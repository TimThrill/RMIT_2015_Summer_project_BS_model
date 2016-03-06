//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

#include <iostream>
#include <ctime>
#include <ratio>
#include <chrono>

#include "BSApp.h"
#include "NetwControlInfo.h"
#include "FindModule.h"
#include "ConnectionManager.h"
#include "NicEntry.h"
#include "BaseWorldUtility.h"
#include "StationaryMobility.h"

#include <SimpleAddress.h>

#include "BeaconReply_m.h"

#include "Coord.h"
#include "AddressingInterface.h"
#include <algorithm>

//#include "ANN/ANN.h"					// ANN declaration
#include <cstdlib>						// C standard library
#include <cstdio>						// C I/O (for sscanf)
#include <cstring>						// string manipulation

//#include <engine.h>
//using namespace std;

//#include "MyMobility.h"
//#include <cQueue.h>

Define_Module(BSApp);
// Constructor
BSApp::BSApp() :
        BaseApplLayer(), delayTimer(NULL), beaconExpiredTimer(NULL), queryExpiredTimer(
                NULL) {
    m.lock();
    //queryPeerList = new std::queue<LAddress::L3Type>();
    m.unlock();
}

//Destructor
BSApp::~BSApp() {
    // TODO Auto-generated destructor stub
    //delete queryPeerList;
    delete score;
    if (delayTimer) {
        cancelAndDelete(delayTimer);
    }
    if (beaconExpiredTimer) {
        cancelAndDelete(beaconExpiredTimer);
    }
    if (queryExpiredTimer) {
        cancelAndDelete(queryExpiredTimer);
    }
    oResult.close();
    oKeywords.close();
}

void BSApp::initialize(int stage) {
    EV << "BSAPP initiallize start" << std::endl;
    BaseApplLayer::initialize(stage);
    EV << "stage: " << stage << std::endl;
    if (stage == 0) {
        hasPar("coreDebug") ?
                coreDebug = par("coreDebug").boolValue() : coreDebug = false;
        EV << "initialized" << std::endl;

        // Set source ip address
        srcAddress = getNode()->getId();

        node_id = par("node_id");

        // Register the finish signal
        finishSignal = registerSignal("finish");
        queryFinish = registerSignal("queryFinish");
        firstQuery = true;
        reply = registerSignal("reply");
        roundFinish = registerSignal("roundFinish");
        beaconSend = registerSignal("beaconSend");
        beaconReceive = registerSignal("beaconReceive");
        querySendRound = registerSignal("querySendRound");
        querySend = registerSignal("querySend");
        queryReplyReceive = registerSignal("queryReply");
        queryScoreFinish = registerSignal("scoreFinish");

        successfulQuery = 0;
        numSendPackage = 0;
        numReceivePackage = 0;
        irProcessTime = 0;
        rcvQueryNumber = 0;


        // Set indexing file path
        std::string lexiconPath = MAIN_INDEXING_PATH + "lexicon";
        std::string documentMapPath = MAIN_INDEXING_PATH + "map";
        std::string invertedListPath = MAIN_INDEXING_PATH + "ivlist";
        std::string jsonFilePath = REVIEW_JSON_DATASET
                + "jsonData";
        // Initial output file
        score = new QueryScore(lexiconPath, documentMapPath, invertedListPath,
                jsonFilePath);
        oResult.open(
                QUERY_RESULT_PATH + std::to_string(node_id) + "/results_r"
                        + ev.getConfig()->getConfigValue("seed-set"),
                std::fstream::out);
        oKeywords.open(
                QUERY_RESULT_PATH + std::to_string(node_id) + "/keywords_r"
                        + ev.getConfig()->getConfigValue("seed-set"),
                std::fstream::out);
    } else if (stage == 1) {
        emit(querySendRound, queryTimes);
        //scheduleAt(simTime() + dblrand() * 10, delayTimer);
    }
    EV << "BSApp Finish initialized" << std::endl;
}

void BSApp::handleBeaconExpiredTimer() {
    EV << "Cancel and delete beacon timer: " << std::endl;
    cancelAndDelete(beaconExpiredTimer);
    beaconExpiredTimer = NULL;
    sendBeacon();
}

void BSApp::handleQueryExpiredTimer() {
    EV << "Cancel and delete query timer" << std::endl;
    cancelAndDelete(queryExpiredTimer);
    queryExpiredTimer = NULL;

    // Query time expired, abort this query, record the data
    // Record processing time
    simtime_t processingTime = simTime() - startTime;
    emit(finishSignal, processingTime);

    // Record query successful rate
    if (numSendPackage != 0) {
        oResult << "$$$$$$$$$$$$$$ROUND " << querySendRounds
                << " FINISHED&&&&&&&&&&&&&&" << std::endl << std::endl;
        double querySuccessfulRate = numReceivePackage / numSendPackage;
        emit(roundFinish, querySuccessfulRate);

        simtime_t queryTime = simTime() - queryStartTime;
        emit(queryFinish, queryTime);
        firstQuery = true;
    } else {
        double querySuccessfulRate = -1;
        emit(roundFinish, querySuccessfulRate);
    }

    if (querySendRounds < queryTimes) {
// Delete start: Do not want to resend query
//        m.lock();
//        unsigned int n = 0;
//        unsigned int listSize = queryPeerList->size();
//
//        // Resend the query messages
//        for(; n < listSize; n++) {
//            LAddress::L3Type address = queryPeerList->front();  // Get the first peer address
//            sendQuery(address);
//            EV<<"Resend query message to peer: "<<address<<std::endl;
//        }
//        m.unlock();
// Delete end

//        if (queryPeerList) {
//            delete (queryPeerList);
//        }
//        queryPeerList = new std::queue<LAddress::L3Type>();

        // This round has been finished, start next query round
        if (!delayTimer) {
            delayTimer = new cMessage("delay-timer", SEND_BEACON_TIMER);
            scheduleAt(simTime() + QUERY_FREQUENCY * uniform(0, 1), delayTimer);
        } else {
            cancelAndDelete(delayTimer);
            delayTimer = new cMessage("delay-timer", SEND_BEACON_TIMER);
            scheduleAt(simTime() + QUERY_FREQUENCY * uniform(0, 1), delayTimer);
        }
    } else {
        // This query node receive all the peers' query reply messages and finish its query round
        queryNodeNumber--;
    }
}

/**
 * A timer with kind = SEND_PEER_QUERY_TIMER indicates that a new
 * peer query has to be send (@ref sendBroadcast).
 *
 *
 * sendPeerQuery
 **/
void BSApp::handleSelfMsg(cMessage *msg) {
    EV << msg->getFullName() << std::endl;
    switch (msg->getKind()) {
    case SEND_BEACON_TIMER:
        EV << "Receive send beacon signal" << std::endl;
        sendBeacon();
        delete msg;
        delayTimer = NULL;
        break;
    case SEND_BEACON_EXPIRED_TIMER:
        EV << "Receive send beacon expired timer signal" << std::endl;
        handleBeaconExpiredTimer();
        break;
    case SEND_QUERY_EXPIRED_TIMER:
        EV << "Receive send query expired timer signal" << std::endl;
        handleQueryExpiredTimer();
        break;
    default:
        EV << "Unknown selfmessage! ->, kind: " << msg->getKind() << std::endl;
        //delete msg;
        break;
    }
}

/**
 * This function creates a new peer query message and sends it down to
 * the network layer
 **/
void BSApp::sendBeacon() {
    Beacon *beaconMessage = new Beacon("BEACON_MESSAGE", BEACON_MESSAGE);

    beaconMessage->setSrcAddr(srcAddress);
    EV << "Send beacon from: " << srcAddress << std::endl;

    // we use the host modules getIndex() as a appl address
    beaconMessage->setBitLength(headerLength);

    // set the control info to tell the network layer the layer 3
    // address;
    NetwControlInfo::setControlInfo(beaconMessage, LAddress::L3BROADCAST);

    // Set beacon expired timer for send message
    if (!beaconExpiredTimer) { // No previous expired timer, create new one
        beaconExpiredTimer = new cMessage("Beacon Expired Timer",
                SEND_BEACON_EXPIRED_TIMER);
        scheduleAt(simTime() + MESSAGE_EXPIRE_TIME, beaconExpiredTimer); // Add the expired timer into schedule
    } else { // Already existed a beacon expired timer, delete previous and set a new one
        EV << "Error: Already exited expired timer!" << std::endl;
        cancelAndDelete(beaconExpiredTimer); // Cancel and delete previous timer
        beaconExpiredTimer = NULL;  // Restore pointer to NULL
        EV << "Cancel the previous timer and set a new timer at time: "
                  << simTime() << std::endl;
        beaconExpiredTimer = new cMessage("Beacon Expired Timer",
                SEND_BEACON_EXPIRED_TIMER);   // Set a new timer
        scheduleAt(simTime() + MESSAGE_EXPIRE_TIME, beaconExpiredTimer); // Add the beacon expired timer into schedule
    }

    EV << "Node :" << beaconMessage->getSrcAddr()
              << " send broadcast beacon message" << std::endl;
    coreEV << "Sending Beacon packet!" << endl;

    // Set start timer
    startTime = simTime();
    // Set send time stamp
    beaconMessage->setTimeStamp(simTime());

    // Add one round
    querySendRounds++;
    // Record beacon send number
    //beaconSendNumber++;
    //emit(beaconSend, beaconSendNumber);

    sendDown(beaconMessage);
}

/**
 * This function handle received beacon message
 **/
void BSApp::handleBeaconMessage(Beacon* msg) {
    // Set reply ip address
    EV << "Node: " << srcAddress << "** receive beacon from node ip address: "
              << msg->getSrcAddr() << std::endl;

    // Record the latency time
    simtime_t latency = simTime() - msg->getTimeStamp();
    emit(reply, latency);
    EV << "latency: " << latency << std::endl;

    BeaconReply *beaconReplyMessage = new BeaconReply("BEACON_REPLY_MESSAGE",
            BEACON_REPLY_MESSAGE);
    // Set peer distance
    Coord currentPeerLocation = beaconReplyMessage->getPeerLocation();
    beaconReplyMessage->setPeerDistance(
            currentPeerLocation.distance(msg->getSrcPosition()));

    // Set source ip address
    beaconReplyMessage->setSrcAddr(getNode()->getId());

    uint32_t replyIpAddress = msg->getSrcAddr();
    beaconReplyMessage->setDestAddr(replyIpAddress);

    // Set send time stamp
    beaconReplyMessage->setTimeStamp(simTime());

    // Send message
    sendBeaconReply(beaconReplyMessage);

    //delete(beaconReplyMessage);
}

/**
 * This function handle received beacon reply message
 **/
void BSApp::handleBeaconReplyMessage(BeaconReply* msg) {
    EV << "Node: " << srcAddress << "** receive beacon reply from node: "
              << msg->getSrcAddr() << std::endl;

    // Record the latency time
    simtime_t latency = simTime() - msg->getTimeStamp();
    emit(reply, latency);

    if (beaconExpiredTimer) {
        cancelAndDelete(beaconExpiredTimer); // Existed previous timer, cancle and delete because receive at least one beacon reply message
        beaconExpiredTimer = NULL;  // Restore pointer to NULL
        EV << "After delete beacon expired timer, point to: "
                  << beaconExpiredTimer << std::endl;

        // Record beacon reply receive
        //beaconReceiveNumber++;
        //emit(beaconReceive, beaconReceiveNumber);
    } else {
        EV << "Already delete previous send beacon expired timer" << std::endl;
    }

    // Add the sender to the query list
//    m.lock();
//    if (queryPeerList) {
//        queryPeerList->push(msg->getSrcAddr());
//    } else {
//        EV << "Error: query peer list is null, cannot add peer!" << std::endl;
//    }
//
//    EV << "Add peer to query peer list, queue size: " << queryPeerList->size()
//              << std::endl;
//    m.unlock();

    // Send the query message
    sendQuery(msg->getSrcAddr());
}

void BSApp::handleQueryMessage(Query* msg) {
    EV << "Node: " << srcAddress << " receive query message from node: "
              << msg->getSrcAddr() << std::endl;

    // Record the latency time
    simtime_t latency = simTime() - msg->getTimeStamp();
    emit(reply, latency);
    EV << "Latency: " << latency << std::endl;

    QueryReply* queryReplyMessage = new QueryReply("QUERY_REPLY_MESSAGE",
            QUERY_REPLY_MESSAGE);

    printReceivedQueryMessage(msg);

    setQueryReplyMessage(queryReplyMessage, msg);

    // Set query reply src address
    queryReplyMessage->setSrcAddr(srcAddress);

    // Set query reply ip address
    queryReplyMessage->setDestAddr(msg->getSrcAddr());

    sendQueryReply(queryReplyMessage, msg);

    //delete(queryReplyMessage);
}

void BSApp::handleQueryReplyMessage(QueryReply* msg) {
    EV << "Node: " << srcAddress << " receive query reply message from node: "
              << msg->getSrcAddr() << std::endl;

    numReceivePackage++;
    emit(queryReplyReceive, numReceivePackage);

    // Record the latency time
    simtime_t latency = simTime() - msg->getTimeStamp();
    emit(reply, latency);

    EV << "**********************Query reply results start******************"
              << std::endl;

    // Test for print result
    std::vector<QueryReplyMessage>::iterator it =
            msg->getReplyBusinesses().begin();
    int cnt = 1;
    for (; it != msg->getReplyBusinesses().end(); it++) {
        oResult << "business No." << cnt << ":" << std::endl;
        oResult << "Result start: " << std::endl;
        oResult << "Business name: " << it->businessName << std::endl;
        oResult << "Business id: "<<it->businessId<< std::endl;
        oResult << "Business distance: " << (FindModule<LinearMobility*>::findSubModule(getParentModule())->getCurrentPosition()).distance(Coord(it->businessLocation.x, it->businessLocation.y)) << std::endl;
        oResult << "Text review: " << it->textReview << std::endl;
        oResult << "rate: " << it->rate << std::endl;
        oResult << "Ranking score: " << it->score << std::endl;
        oResult << "Business type: " << it->businessType << std::endl;
        oResult << "Business address: " << it->businessAddress << std::endl;
        oResult << "Business location latitude: " << it->businessLocation.y
                << " longitude: " << it->businessLocation.x << std::endl;
        oResult << "*******************end*******************" << std::endl
                << std::endl;
        cnt++;
    }
    EV << "**********************Query reply results finish******************"
              << std::endl;

    // Receive query reply from a peer, pop that peer from query peer list
//    m.lock();
//    if (queryPeerList->size() > 0) {
//        queryPeerList->pop();
//        EV << "Pop peer from the peer list, query peer list size: "
//                  << queryPeerList->size() << std::endl;
//
//        if ((queryPeerList->size() == 0) && (querySendRounds == queryTimes)) {
//            simtime_t queryTime = simTime() - queryStartTime;
//            emit(queryFinish, queryTime);
//            firstQuery = true;
//
//            oResult << "$$$$$$$$$$$$$$ROUND " << querySendRounds
//                    << " FINISHED&&&&&&&&&&&&&&" << std::endl << std::endl;
//            if (queryExpiredTimer) {
//                cancelAndDelete(queryExpiredTimer); // Existed previous timer, cancle and delete because receive one beacon reply message
//                queryExpiredTimer = NULL;   // Restore pointer to null
//                EV << "After delete query expired timer, point to: "
//                          << queryExpiredTimer << std::endl;
//            } else {
//                EV << "Already delete previous send query expired timer"
//                          << std::endl;
//            }
//
//            // This query node receive all the peers' query reply messages and finish its query round
//            queryNodeNumber--;  // Reduce number of query node
//
//            // All the query node finish their query, recording the simulation time
//            simtime_t processingTime = simTime() - startTime;
//            emit(finishSignal, processingTime);
//
//            // Record query successful rate
//            double querySuccessfulRate = numReceivePackage / numSendPackage;
//            emit(roundFinish, querySuccessfulRate);
//
//            EV << "After received query reply: Initial query node number: "
//                      << queryNodeNumber << std::endl;
//            if (queryNodeNumber == 0) {
//                // Finish the simulation
//                // endSimulation();
//            }
//        } else if (queryPeerList->size() == 0 && querySendRounds < queryTimes) {
//            simtime_t queryTime = simTime() - queryStartTime;
//            emit(queryFinish, queryTime);
//            firstQuery = true;
//
//            oResult << "$$$$$$$$$$$$$$ROUND " << querySendRounds
//                    << " FINISHED&&&&&&&&&&&&&&" << std::endl << std::endl;
//            if (queryExpiredTimer) {
//                cancelAndDelete(queryExpiredTimer); // Existed previous timer, cancle and delete because receive one beacon reply message
//                queryExpiredTimer = NULL;   // Restore pointer to null
//                EV << "After delete query expired timer, point to: "
//                          << queryExpiredTimer << std::endl;
//            } else {
//                EV << "Already delete previous send query expired timer"
//                          << std::endl;
//            }
//
//            // This round has been finished, start next query round
//            if (!delayTimer) {
//                delayTimer = new cMessage("delay-timer", SEND_BEACON_TIMER);
//                scheduleAt(simTime() + QUERY_FREQUENCY * uniform(0, 1),
//                        delayTimer);
//            } else {
//                cancelAndDelete(delayTimer);
//                delayTimer = new cMessage("delay-timer", SEND_BEACON_TIMER);
//                scheduleAt(simTime() + QUERY_FREQUENCY * uniform(0, 1),
//                        delayTimer);
//            }
//
//            // All the query node finish their query, recording the simulation time
//            simtime_t processingTime = simTime() - startTime;
//            emit(finishSignal, processingTime);
//
//            // Record query successful rate
//            double querySuccessfulRate = (double) numReceivePackage
//                    / numSendPackage;
//            emit(roundFinish, querySuccessfulRate);
//        } else {
////            if(queryExpiredTimer)   // Receive the query reply, we extend the timer
////            {
////                cancelAndDelete(queryExpiredTimer);
////                queryExpiredTimer = new cMessage("Expired Timer", SEND_QUERY_EXPIRED_TIMER);
////            }
//        }
//    } else {
//        EV << "Error: query peer list is null!" << std::endl;
//    }
//    m.unlock();
    return;
}

void BSApp::sendBeaconReply(BeaconReply* beaconReplyMessage) {
    beaconReplyMessage->setBitLength(headerLength);

    // set the control info to tell the network layer the layer 3
    // address;
    NetwControlInfo::setControlInfo(beaconReplyMessage,
            beaconReplyMessage->getDestAddr());

    EV << "Send beacon reply from Node :" << beaconReplyMessage->getSrcAddr()
              << std::endl;
    EV << "Send beacon reply to Node: " << beaconReplyMessage->getDestAddr()
              << std::endl;

    coreEV << "Sending Beacon reply packet!" << endl;
    sendDown(beaconReplyMessage);
}

void BSApp::sendQuery(LAddress::L3Type& destAddr) {
    Query* queryMessage = new Query("QUERY_MESSAGE", QUERY_MESSAGE);

    // Set max distance to 1km
    queryMessage->setMaxRange(MAX_RANGE);

    // Set query key words
    std::string keyword1 = "asked";
    std::string keyword2 = "busy";
    std::string keyword3 = "card";
    (queryMessage->getKeyWords()).keywords.push_back(keyword1);
    (queryMessage->getKeyWords()).keywords.push_back(keyword2);
    (queryMessage->getKeyWords()).keywords.push_back(keyword3);

    // Record query key words into file
    oKeywords << "Query round: " << querySendRounds << std::endl;
    oKeywords << "key words: " << std::endl;
    for (auto x : queryMessage->getKeyWords().keywords) {
        oKeywords << x << ", ";
    }
    oKeywords << std::endl;
    oKeywords << "MAX RANGE: "<<queryMessage->getMaxRange()<<"m"<<std::endl;
    // Write keywords end

    // Set query node location
    // Read position from omnetpp.ini file
    queryMessage->setPeerLocation(
            FindModule<LinearMobility*>::findSubModule(getParentModule())->getCurrentPosition());
    //queryMessage->setLatitude(par("latitude"));

    // Set src address
    queryMessage->setSrcAddr(srcAddress);
    // Set query ip address
    queryMessage->setDestAddr(destAddr);

    queryMessage->setBitLength(headerLength);

    // set the control info to tell the network layer the layer 3
    // address;
    NetwControlInfo::setControlInfo(queryMessage, queryMessage->getDestAddr());

    numSendPackage++;
    emit(querySend, numSendPackage);

    // Set expired timer for send message
    if (!queryExpiredTimer) { // No previous expired timer, create new one
        queryExpiredTimer = new cMessage("Expired Timer",
                SEND_QUERY_EXPIRED_TIMER);
        scheduleAt(simTime() + MESSAGE_EXPIRE_TIME, queryExpiredTimer); // Add the expired timer into schedule
    } else { // Already existed a expired timer, delete previous and set a new one
        EV << "Error: Already existed query expired timer!" << std::endl;
        cancelAndDelete(queryExpiredTimer);  // Cancel and delete previous timer
        queryExpiredTimer = NULL;
        EV << "Cancel the previous query timer and set a new timer at time: "
                  << simTime() << std::endl;
        queryExpiredTimer = new cMessage("Expired Timer",
                SEND_QUERY_EXPIRED_TIMER);   // Set a new timer
        scheduleAt(simTime() + MESSAGE_EXPIRE_TIME, queryExpiredTimer); // Add the expired timer into schedule
    }

    // Set time stamp
    queryMessage->setTimeStamp(simTime());

    if (firstQuery) {
        queryStartTime = simTime();
        firstQuery = false;
    }

    EV << "Node: " << queryMessage->getSrcAddr()
              << " send query message to node: " << queryMessage->getDestAddr()
              << std::endl;
    coreEV << "Sending Query packet!" << endl;
    sendDown(queryMessage);
    //delete(queryMessage);
}

void BSApp::sendQueryReply(QueryReply* queryReplyMessage, Query* msg) {
    queryReplyMessage->setBitLength(headerLength);

    // Set send time stamp
    queryReplyMessage->setTimeStamp(simTime());

    // set the control info to tell the network layer the layer 3
    // address;
    NetwControlInfo::setControlInfo(queryReplyMessage,
            queryReplyMessage->getDestAddr());

    EV << "Node: " << queryReplyMessage->getSrcAddr()
              << " send query reply message to node: "
              << queryReplyMessage->getDestAddr() << std::endl;

    coreEV << "Sending Query reply packet!" << endl;

    Coord bs(0, 0);

    double distance = FindModule<StationaryMobility*>::findSubModule(getParentModule())->getCurrentPosition().distance(bs);
    simtime_t delay = distance / BaseWorldUtility::speedOfLight;
    simtime_t duration = 0.004*2;

    cModule *targetModule = (getParentModule()->getParentModule())->getSubmodule("node", queryReplyMessage->getDestAddr());
    sendDirect(queryReplyMessage, delay, duration, targetModule, "radioIn");
    //sendDown(queryReplyMessage);
}

void BSApp::handleMessage(cMessage* msg) {
    switch (msg->getKind()) {
    case QUERY_MESSAGE:
        EV << "Receive query signal" << std::endl;
        handleQueryMessage(static_cast<Query*>(msg));
        delete msg;
        break;
    default:
        EV << "Unknown message type!!!! Delete message" << std::endl;
        //delete msg;
        break;
    }
}

/**
 * Get the data from dataset and asset into query reply message
 * */
QueryReply* BSApp::setQueryReplyMessage(
        QueryReply* queryReplyMessage, Query* queryMessage) {
    queryReplyMessage->setQuerySendStamp(queryMessage->getTimeStamp());
    rcvQueryNumber++;
    EV << "Set query reply message start, node_id: " << node_id << std::endl;

    //simtime_t startTime = simTime();
    struct timeval start, end;
    gettimeofday(&start, NULL);

    score->getRankingResult(queryReplyMessage, queryMessage);
    gettimeofday(&end, NULL);
    double elapsed = ((end.tv_sec - start.tv_sec) * 1000) + ((double)end.tv_usec / 1000 - (double)start.tv_usec / 1000);
    irProcessTime += elapsed;   
    emit(queryScoreFinish, irProcessTime / rcvQueryNumber);

    EV << "After set query reply: "
              << queryReplyMessage->getReplyBusinesses().size() << std::endl;

//    QueryReplyMessage mQueryReply = {};

    //for(; it != queryReplyMessage->getReplyBusinesses().end(); it++)
    //{
//    mQueryReply.businessId = (BSApp::extractMessage.businessList.begin()->second).businessId;
//    mQueryReply.businessName = (BSApp::extractMessage.businessList.begin()->second).businessName;
//    mQueryReply.businessLocation.x = (BSApp::extractMessage.businessList.begin()->second).longitude;
//    mQueryReply.businessLocation.y = (BSApp::extractMessage.businessList.begin()->second).latitude;
    /* mQueryReply.distance = getDistance((BSApp::extractMessage.businessList.begin()->second).longitude,
     queryMessage->getLongitude(),
     (BSApp::extractMessage.businessList.begin()->second).latitude,
     queryMessage->getLatitude());
     */
//    mQueryReply.businessType = "Restaurant";
//    mQueryReply.businessAddress = (BSApp::extractMessage.businessList.begin()->second).address;
//    mQueryReply.rate = (BSApp::extractMessage.businessList.begin()->second).rating;
//    mQueryReply.textReview = (BSApp::extractMessage.businessList.begin()->second).textReview;
    //}
//    queryReplyMessage->getReplyBusinesses().push_back(mQueryReply);
    EV << "Set query reply message end" << std::endl;
    return queryReplyMessage;
}

void BSApp::printReceivedQueryMessage(Query* msg) {
    EV << "Received query message start:" << std::endl;
    EV << "Business name: " << msg->getBusinessName() << std::endl;
    EV << "Business type: " << msg->getBusinessType() << std::endl;
    Keywords &keywords = msg->getKeyWords();
    EV << "Query keywords: ";
    std::vector<std::string>::iterator it = keywords.keywords.begin();
    while (it != keywords.keywords.end()) {
        EV << *it << " ";
        it++;
    }
    EV << std::endl;
    EV << "X position: " << msg->getPeerLocation().x << " Y position: "
              << msg->getPeerLocation().y << std::endl;
    EV << "Max range: " << msg->getMaxRange() << "m" << std::endl;
    EV << "Received query message end" << std::endl;
    return;
}

void BSApp::setNetworkAddress() {
    AddressingInterface* addrScheme = FindModule<AddressingInterface*>::findSubModule(findHost());
    if(addrScheme) {
        myNetworkAddress = addrScheme->myNetwAddr(this);
    } else {
        myNetworkAddress = getId();
    }
    EV<<"Network Address of BS: "<<myNetworkAddress<<endl;
}
