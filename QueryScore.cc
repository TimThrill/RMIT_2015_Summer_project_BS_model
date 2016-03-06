/*
 * QueryScore.cc
 *
 *  Created on: Jan 16, 2016
 *      Author: cheetah
 */
#include <limits>
#include <algorithm>
#include <cerrno>

#include "QueryScore.h"
#include "Constant.h"

void QueryScore::initialise() {
	EV<<"queryscore initialise"<<std::endl;	
	EV<<this->lexiconFilePath<<std::endl;	
	EV<<this->documentMapFilePath<<std::endl;

    // Read map file into memory
	std::ifstream mapFile(this->documentMapFilePath);
    unsigned int docNo;
    long docOffset;
    if(mapFile.is_open())
    {
        while (mapFile>>docNo>>docOffset) {
            docMap.insert(
                    std::pair<unsigned int, Document>(docNo,
                            Document(docNo, docOffset)));
            EV<<"docNO: "<<docNo<<" offset: "<<docOffset<<std::endl;
        }
    }
    else
    {
        EV<<"ERROR: map file open error=>"<<strerror(errno)<<std::endl;
    }
    mapFile.close();
	EV<<"map size: "<<docMap.size()<<std::endl;
    // Read lexicon file into memeory
	std::ifstream lexiconfile(this->lexiconFilePath);
    std::string word;
    int docFrequency;
    long invlistPos;
    if(lexiconfile.is_open())
    {
        while (lexiconfile>>word>>docFrequency>>invlistPos) {
            lexiconMap.insert(
                    std::pair<std::string, Lexicon>(word,
                            Lexicon(word, invlistPos, docFrequency)));
        }
    }
    else
    {
        EV<<"ERROR: lexicon file open error=>"<<strerror(errno)<<std::endl;
    }

    lexiconfile.close();
    return;
}

void QueryScore::getRankingResult(QueryReply* queryReplyMessage,
        Query* queryMessage) {
    std::vector<std::pair<unsigned int, double> > reviewScore;
    for (std::vector<std::string>::iterator it_key =
            queryMessage->getKeyWords().keywords.begin();
            it_key != queryMessage->getKeyWords().keywords.end(); it_key++) {
        if (lexiconMap.find(*it_key) != lexiconMap.end()) { // The word is in the lexicon map
            Lexicon& term = lexiconMap[*it_key];
            long pos = term.location;
            std::ifstream ivsFile(this->invertedListFilePath);
            if(ivsFile.is_open())
            {
                ivsFile.seekg(pos, ivsFile.beg); // Jump to the relavant start position
                                                 // in invert list
                int ft = term.docFrequency; // Read document frequency
                EV << "doc freq: " << ft << std::endl;
                ivsFile.read((char*) &ft, sizeof(int));
                EV << "doc freq in invs: " << ft << std::endl;
                for (int j = 0; j < ft; j++) {
                    unsigned int docId;
                    ivsFile.read((char*) &docId, sizeof(int));
                    int fdt;
                    ivsFile.read((char*) &fdt, sizeof(int));
                    unsigned int i = 0;
                    for (; i < reviewScore.size(); i++) {
                        if (docId == reviewScore[i].first) {
                            break;
                        }
                    }

                    if (i == reviewScore.size()) {
                        reviewScore.push_back(
                                std::pair<unsigned int, double>(docId, 0.0)); // This review is not in the review result, add into review results.
                    }
                }
            }
            else
            {
                EV<<"ERROR: Inverted list file open error=>"<<strerror(errno)<<std::endl;
            }
            ivsFile.close();
        }
    }

    EV << "effective review set size: " << reviewScore.size() << std::endl;

    rankingScore(&reviewScore, queryMessage);

    setRankingResult(MAX_QUERY_REPLY_BUSINESS, queryReplyMessage, &reviewScore);

    return;
}

void QueryScore::setRankingResult(int maxResults, QueryReply* queryReplyMessage,
        std::vector<std::pair<unsigned int, double> >* reviewScore) {
    std::vector<std::pair<unsigned int, double> >::iterator it =
            reviewScore->begin();
    vecQueryReply replyBusinesses_var;
    for (int i = 0; ((i < maxResults) && (i < reviewScore->size())); i++) {
        if((it + i)->second != -1)
        {
            Json::Value root = readReviewJson(docMap[(it + i)->first].docOffset);
            QueryReplyMessage reply;
            reply.textReview = root["text_review"].asString();
            reply.businessName = root["business_name"].asString();
            reply.rate = root["rate"].asDouble();
            reply.businessLocation = Coord(root["longitude"].asDouble(), root["latitude"].asDouble());
            reply.score  = (it + i)->second;
            reply.businessId = root["business_id"].asString();
            queryReplyMessage->getReplyBusinesses().push_back(reply);
        }
    }
    return;
}

void QueryScore::rankingScore(
        std::vector<std::pair<unsigned int, double> >* reviewsScore,
        Query* queryMessage) {
    float alpha = 0.14;  // weight parameter for distance score
    float beta = 0.2;   // weight parameter for text score
    float charley = 0.66;    // weight parameter for rating score
    double maxDis = 0;
    double maxText = 0;
    double maxRating = 5;
    std::map<unsigned int, double> disScoreset; // Use to store distance score and normalised by max distance later
    std::map<unsigned int, double> textScoreSet; // Use to store distance score and normalised by max text score later
    std::map<unsigned int, double> ratings;
    for (std::vector<std::pair<unsigned int, double> >::iterator it =
            reviewsScore->begin(); it != reviewsScore->end(); it++) {

        // Read the corresponding json data of this review into memory
        Json::Value root = readReviewJson(docMap[it->first].docOffset);
        EV << "Processing review: " << root["hash_value"].asString()
                  << std::endl;

        Coord businessCoord(root["longitude"].asDouble(),
                root["latitude"].asDouble());
        double disScore = getDistanceScore(businessCoord,
                queryMessage->getPeerLocation());
        if(disScore > queryMessage->getMaxRange())
        {
            EV<<"Business is out of range"<<std::endl;
            disScore = -1;
        }
        if (maxDis < disScore) {
            maxDis = disScore;
        }
        disScoreset.insert(
                std::pair<unsigned int, double>(it->first, disScore));

        double textScore = getTextScore(it, queryMessage);
        if (maxText < textScore) {
            maxText = textScore;
        }
        textScoreSet.insert(
                std::pair<unsigned int, double>(it->first, textScore));
        //double reviewScore = textScore * root["rating"].asDouble() / maxText;
        EV << "Dis socre: " << disScore << " text score: " << textScore
                  << std::endl << std::endl;

        ratings.insert(
                std::pair<unsigned int, double>(it->first,
                        root["rate"].asDouble()));
    }

    for (std::vector<std::pair<unsigned int, double> >::iterator it =
            reviewsScore->begin(); it != reviewsScore->end(); it++) {
        if (maxDis && maxText && maxRating && (disScoreset[it->first] != -1)) {
            double disScore = disScoreset[it->first] / maxDis;
            double textScore = textScoreSet[it->first] / maxText;
            double ratingScore = ratings[it->first] / maxRating;
            double overallScore = alpha * disScore + beta * textScore + charley * ratingScore;
            it->second = overallScore;
            EV << "hash_value: " << it->first << " score: " << it->second<< std::endl;
            EV<<"dis score: "<<disScore<<" text score: "<<textScore<<" rating socre: "<<ratingScore<<std::endl<<std::endl;
        }
        else
        {
            it->second = -1;
        }
    }


    struct scoreCompare {
        bool operator ()(std::pair<unsigned int, double>& a,
                std::pair<unsigned int, double>& b) {
            return (a.second > b.second);
        }
    } t_scoreCompare;

    std::sort(reviewsScore->begin(), reviewsScore->end(), t_scoreCompare);
    return;
}

/*
 * The ranking formula is
 * S = 1/N * sum(fdt / docFreq)
 * N is the number of keywords
 * sum is the word in keywords
 * fdt is the within review word frequency
 * docFreq is the review frequency of the word
 * */
double QueryScore::getTextScore(
        const std::vector<std::pair<unsigned int, double> >::iterator& it_review,
        Query* queryMessage) {
    int N = queryMessage->getKeyWords().keywords.size(); // number of query word in the keywords collection
    double score = 0;
    for (std::vector<std::string>::iterator it =
            queryMessage->getKeyWords().keywords.begin();
            it != queryMessage->getKeyWords().keywords.end(); it++) {
        if (lexiconMap.find(*it) != lexiconMap.end()) {
            Lexicon& term = lexiconMap[*it];
            int docFreq = term.docFrequency;
            long pos = term.location;
            std::ifstream ivsFile(this->invertedListFilePath);
            if(ivsFile.is_open())
            {
                ivsFile.seekg(pos + sizeof(int), ivsFile.beg); // Jump to the relavant start position
                for (int j = 0; j < docFreq; j++) {
                    unsigned int docId;
                    ivsFile.read((char*) &docId, sizeof(int));
                    int fdt;    // Within document frequency
                    ivsFile.read((char*) &fdt, sizeof(int));
                    if (docId == it_review->first) {
                        score += (double) fdt  * (log ((double)docMap.size() / docFreq));
                        break;
                    }
                }
            }
            else
            {
                EV<<"ERROR: Inverted list file open error=>"<<strerror(errno)<<std::endl;
            }
            ivsFile.close();
        }
    }
    return score;
}

Json::Value QueryScore::readReviewJson(long line_number) {
    Json::Value root;
    Json::Reader reader;

    std::ifstream jsonFile(this->jsonFilePath);
    if(jsonFile.is_open())
    {
        // Jump to specific line
        jsonFile.seekg(jsonFile.beg);
        for (int i = 1; i <= line_number; ++i) {
            jsonFile.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
        }

        std::string line;
        getline(jsonFile, line);
        reader.parse(line, root, false);
    }
    else
    {
        EV<<"ERROR: json file open error=>"<<strerror(errno)<<std::endl;
    }
    jsonFile.close();
    return root;
}

double QueryScore::getDistanceScore(Coord& a, Coord& b) {
    return a.distance(b);
}

