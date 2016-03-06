/*
 * MyApplicationLayer.cpp
 *
 *  Created on: Dec 14, 2015
 *      Author: cheetah
 */
#include <string>

#include "BaseWorldUtility.h"
#include "MyApplicationLayer.h"
#include "NetwControlInfo.h"
#include "SimpleAddress.h"
#include "ApplPkt_m.h"
#include "AddressingInterface.h"
#include "FindModule.h"
#include "Constant.h"
#include "Util.h"
#include "QueryScore.h"
#include "BSApp.h"

Define_Module(MyApplicationLayer);

// Read dataset
int MyApplicationLayer::beaconSendNumber = 0;
int MyApplicationLayer::beaconReceiveNumber = 0;

// Constructor
MyApplicationLayer::MyApplicationLayer() :
        BaseApplLayer(), delayTimer(NULL), beaconExpiredTimer(NULL), queryExpiredTimer(
                NULL) {
    m.lock();
    queryPeerList = new std::queue<LAddress::L3Type>();
    m.unlock();
}

//Destructor
MyApplicationLayer::~MyApplicationLayer() {
    // TODO Auto-generated destructor stub
    delete queryPeerList;
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

void MyApplicationLayer::initialize(int stage) {
    EV << "initiallize start" << std::endl;
    BaseApplLayer::initialize(stage);

    radioIn = findGate("radioIn");
    nodeIndex = myApplAddr();

    EV << "stage: " << stage << std::endl;
    if (stage == 0) {
        hasPar("coreDebug") ?
                coreDebug = par("coreDebug").boolValue() : coreDebug = false;
        EV << "initialized" << std::endl;

        // Set source ip address
        srcAddress = getNode()->getId();

        node_id = par("node_id");

        int baseStationId = FindModule<BSApp*>::findGlobalModule()->getNode()->getId();
        EV<<"Base station id: "<<baseStationId<<std::endl;

        // Initial beacon message rules
        querySendRounds = 0;
        if (queryNodeNumber < INITIAL_BEACON_NODES_NUMBER) { // Still have node to send beacon message
            // Initilistion for query rounds
            lamda = par("lamda");   // Set lamda parameter for poisson function
            // Get sim_time_limit value from ini file
            const char *s = ev.getConfig()->getConfigValue("sim-time-limit");
            int simulationTime = MAX_SIM_TIME; //convert from s

            if (s != NULL) // if max_sim_time is set in ini file
            {

                char secondNo[10]; // to store string s without 's' (second symbol) appendix
                strncpy(secondNo, s, strlen(s) - 1);
                secondNo[strlen(s) - 1] = '\0';
                simulationTime = atoi(secondNo);
                EV << "simulation time: " << simulationTime << std::endl;

            } // otherwise use the default MAX_SIM_TIME value

            // assume that we have max_sim_time value, now calculate no of queries N coming to this node as a poisson random number
            queryTimes = poisson(lamda * simulationTime);

            if (queryTimes < 0) {
                queryTimes = 0;
            }

            EV << "Total query times of this node: " << queryTimes << std::endl;

            if (querySendRounds < queryTimes) { // query send round is not reached query times, send beacon to query
                delayTimer = new cMessage("delay-timer", QUERY_MESSAGE);
                scheduleAt(simTime() + uniform(0, 1) * QUERY_FREQUENCY,
                        delayTimer);
                queryNodeNumber++;
            }
        }
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
        queryResponse = registerSignal("queryResponse");

        successfulQuery = 0;
        numSendPackage = 0;
        numReceivePackage = 0;

        // Set indexing file path
        std::string lexiconPath = MAIN_INDEXING_PATH + std::to_string(node_id)
                + "/lexicon";
        std::string documentMapPath = MAIN_INDEXING_PATH
                + std::to_string(node_id) + "/map";
        std::string invertedListPath = MAIN_INDEXING_PATH
                + std::to_string(node_id) + "/ivlist";
        std::string jsonFilePath = REVIEW_JSON_DATASET
                + std::to_string(node_id);
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

    //registerWithBattery("application layer", 1);
    EV << "Finish initialized" << std::endl;
}

void MyApplicationLayer::handleBeaconExpiredTimer() {
    EV << "Cancel and delete beacon timer: " << std::endl;
    cancelAndDelete(beaconExpiredTimer);
    beaconExpiredTimer = NULL;
    sendBeacon();
}

void MyApplicationLayer::handleQueryExpiredTimer() {
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

        if (queryPeerList) {
            delete (queryPeerList);
        }
        queryPeerList = new std::queue<LAddress::L3Type>();

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
void MyApplicationLayer::handleSelfMsg(cMessage *msg) {
    EV << msg->getFullName() << std::endl;
    switch (msg->getKind()) {
    case QUERY_MESSAGE:
    {
        EV << "Receive send query signal" << std::endl;
        // Send the query message
        long desAddr = (FindModule<BSApp*>::findGlobalModule())->getNode()->getId();
        sendQuery(desAddr);
        querySendRounds++;
        delete msg;
        delayTimer = NULL;
        break;
    }
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
void MyApplicationLayer::sendBeacon() {
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
    beaconSendNumber++;
    emit(beaconSend, beaconSendNumber);

    sendDown(beaconMessage);
}

/**
 * This function handle received beacon message
 **/
void MyApplicationLayer::handleBeaconMessage(Beacon* msg) {
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
void MyApplicationLayer::handleBeaconReplyMessage(BeaconReply* msg) {
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
        beaconReceiveNumber++;
        emit(beaconReceive, beaconReceiveNumber);
    } else {
        EV << "Already delete previous send beacon expired timer" << std::endl;
    }

    // Add the sender to the query list
    m.lock();
    if (queryPeerList) {
        queryPeerList->push(msg->getSrcAddr());
    } else {
        EV << "Error: query peer list is null, cannot add peer!" << std::endl;
    }

    EV << "Add peer to query peer list, queue size: " << queryPeerList->size()
              << std::endl;
    m.unlock();

    // Send the query message
    sendQuery(msg->getSrcAddr());
}

void MyApplicationLayer::handleQueryMessage(Query* msg) {
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

    sendQueryReply(queryReplyMessage);

    //delete(queryReplyMessage);
}

void MyApplicationLayer::handleQueryReplyMessage(QueryReply* msg) {
    EV << "Node: " << srcAddress << " receive query reply message from node: "
              << msg->getSrcAddr() << std::endl;

    numReceivePackage++;
    emit(queryReplyReceive, numReceivePackage);
    simtime_t queryResponseTime_t = simTime() - msg->getQuerySendStamp();
    EV<<"Query send time__________________"<<std::endl;
    emit(queryResponse, queryResponseTime_t);

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

        if ((querySendRounds == queryTimes)) {
            simtime_t queryTime = simTime() - queryStartTime;
            emit(queryFinish, queryTime);
            firstQuery = true;

            oResult << "$$$$$$$$$$$$$$ROUND " << querySendRounds
                    << " FINISHED&&&&&&&&&&&&&&" << std::endl << std::endl;
            if (queryExpiredTimer) {
                cancelAndDelete(queryExpiredTimer); // Existed previous timer, cancle and delete because receive one beacon reply message
                queryExpiredTimer = NULL;   // Restore pointer to null
                EV << "After delete query expired timer, point to: "
                          << queryExpiredTimer << std::endl;
            } else {
                EV << "Already delete previous send query expired timer"
                          << std::endl;
            }

            // This query node receive all the peers' query reply messages and finish its query round
            queryNodeNumber--;  // Reduce number of query node

            // All the query node finish their query, recording the simulation time
            simtime_t processingTime = simTime() - startTime;
            emit(finishSignal, processingTime);

            // Record query successful rate
            double querySuccessfulRate = numReceivePackage / numSendPackage;
            emit(roundFinish, querySuccessfulRate);

            EV << "After received query reply: Initial query node number: "
                      << queryNodeNumber << std::endl;
            if (queryNodeNumber == 0) {
                // Finish the simulation
                // endSimulation();
            }
        } else if (querySendRounds < queryTimes) {
            simtime_t queryTime = simTime() - queryStartTime;
            emit(queryFinish, queryTime);
            firstQuery = true;

            oResult << "$$$$$$$$$$$$$$ROUND " << querySendRounds
                    << " FINISHED&&&&&&&&&&&&&&" << std::endl << std::endl;
            if (queryExpiredTimer) {
                cancelAndDelete(queryExpiredTimer); // Existed previous timer, cancle and delete because receive one beacon reply message
                queryExpiredTimer = NULL;   // Restore pointer to null
                EV << "After delete query expired timer, point to: "
                          << queryExpiredTimer << std::endl;
            } else {
                EV << "Already delete previous send query expired timer"
                          << std::endl;
            }

            // This round has been finished, start next query round
            if (!delayTimer) {
                delayTimer = new cMessage("delay-timer", QUERY_MESSAGE);
                scheduleAt(simTime() + QUERY_FREQUENCY * uniform(0, 1),
                        delayTimer);
            } else {
                cancelAndDelete(delayTimer);
                delayTimer = new cMessage("delay-timer", QUERY_MESSAGE);
                scheduleAt(simTime() + QUERY_FREQUENCY * uniform(0, 1),
                        delayTimer);
            }

            // All the query node finish their query, recording the simulation time
            simtime_t processingTime = simTime() - startTime;
            emit(finishSignal, processingTime);

            // Record query successful rate
            double querySuccessfulRate = (double) numReceivePackage
                    / numSendPackage;
            emit(roundFinish, querySuccessfulRate);
        } else {
//            if(queryExpiredTimer)   // Receive the query reply, we extend the timer
//            {
//                cancelAndDelete(queryExpiredTimer);
//                queryExpiredTimer = new cMessage("Expired Timer", SEND_QUERY_EXPIRED_TIMER);
//            }
        }
//    } else {
//        EV << "Error: query peer list is null!" << std::endl;
//    }
//    m.unlock();
    return;
}

void MyApplicationLayer::sendBeaconReply(BeaconReply* beaconReplyMessage) {
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

void MyApplicationLayer::sendQuery(LAddress::L3Type& destAddr) {
    Query* queryMessage = new Query("QUERY_MESSAGE", QUERY_MESSAGE);

    // Set max distance to 1km
    queryMessage->setMaxRange(MAX_RANGE);

    // Set query key words
    std::string keyword1 = "greate";
    std::string keyword2 = "service";
    std::string keyword3 = "parding";
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
    //queryMessage->setSrcAddr(srcAddress);
    queryMessage->setSrcAddr(nodeIndex);
    // Set query ip address
    queryMessage->setDestAddr(destAddr);

    queryMessage->setBitLength(headerLength);

    // set the control info to tell the network layer the layer 3
    // address;
    //NetwControlInfo::setControlInfo(queryMessage, queryMessage->getDestAddr());

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


    Coord bs(0, 0);
    //Coord bs(1000, 0);

    double distance = FindModule<LinearMobility*>::findSubModule(getParentModule())->getCurrentPosition().distance(bs);

    simtime_t delay = distance / BaseWorldUtility::speedOfLight;
    WATCH(delay);

    simtime_t duration = 0.003*2; //data rate = 128kbps
    WATCH(duration);

    queryMessage->setBitLength(headerLength);

    cModule *targetModule = (getParentModule()->getParentModule())->getSubmodule("baseStation");
    sendDirect(queryMessage, 0, 0, targetModule, "radioIn");
    //MiximBatteryAccess::drawCurrent(365.6, 0); //rx_Current
    //EV<<"$$$$$$$$$$$$battery capacity: "<<MiximBatteryAccess::fullname<<" :"<<FindModule<SimpleBattery*>::findSubModule(getParentModule())->estimateResidualAbs()<<std::endl;
    //sendDown(queryMessage);
    //delete(queryMessage);
}

void MyApplicationLayer::sendQueryReply(QueryReply* queryReplyMessage) {
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
    sendDown(queryReplyMessage);
}

void MyApplicationLayer::handleLowerMsg(cMessage* msg) {
    switch (msg->getKind()) {
    case BEACON_MESSAGE:
        EV << "Receive beacon signal" << std::endl;
        handleBeaconMessage(static_cast<Beacon*>(msg));
        delete msg;
        break;
    case BEACON_REPLY_MESSAGE:
        EV << "Receive beacon reply signal" << std::endl;
        handleBeaconReplyMessage(static_cast<BeaconReply*>(msg));
        delete msg;
        break;
    case QUERY_MESSAGE:
        EV << "Receive query signal" << std::endl;
        handleQueryMessage(static_cast<Query*>(msg));
        delete msg;
        break;
    case QUERY_REPLY_MESSAGE:
        EV << "Receive query reply signal" << std::endl;
        handleQueryReplyMessage(static_cast<QueryReply*>(msg));
        delete msg;
        break;
    default:
        EV << "Unknown message type!!!! Delete message" << std::endl;
        delete msg;
        break;
    }
}

/**
 * Get the data from dataset and asset into query reply message
 * */
QueryReply* MyApplicationLayer::setQueryReplyMessage(
        QueryReply* queryReplyMessage, Query* queryMessage) {
    queryReplyMessage->setQuerySendStamp(queryMessage->getTimeStamp());
    EV << "Set query reply message start, node_id: " << node_id << std::endl;

    simtime_t startTime = simTime();
    score->getRankingResult(queryReplyMessage, queryMessage);
    emit(queryScoreFinish, simTime() - startTime);

    EV << "After set query reply: "
              << queryReplyMessage->getReplyBusinesses().size() << std::endl;

//    QueryReplyMessage mQueryReply = {};

    //for(; it != queryReplyMessage->getReplyBusinesses().end(); it++)
    //{
//    mQueryReply.businessId = (MyApplicationLayer::extractMessage.businessList.begin()->second).businessId;
//    mQueryReply.businessName = (MyApplicationLayer::extractMessage.businessList.begin()->second).businessName;
//    mQueryReply.businessLocation.x = (MyApplicationLayer::extractMessage.businessList.begin()->second).longitude;
//    mQueryReply.businessLocation.y = (MyApplicationLayer::extractMessage.businessList.begin()->second).latitude;
    /* mQueryReply.distance = getDistance((MyApplicationLayer::extractMessage.businessList.begin()->second).longitude,
     queryMessage->getLongitude(),
     (MyApplicationLayer::extractMessage.businessList.begin()->second).latitude,
     queryMessage->getLatitude());
     */
//    mQueryReply.businessType = "Restaurant";
//    mQueryReply.businessAddress = (MyApplicationLayer::extractMessage.businessList.begin()->second).address;
//    mQueryReply.rate = (MyApplicationLayer::extractMessage.businessList.begin()->second).rating;
//    mQueryReply.textReview = (MyApplicationLayer::extractMessage.businessList.begin()->second).textReview;
    //}
//    queryReplyMessage->getReplyBusinesses().push_back(mQueryReply);
    EV << "Set query reply message end" << std::endl;
    return queryReplyMessage;
}

void MyApplicationLayer::printReceivedQueryMessage(Query* msg) {
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

void MyApplicationLayer::handleMessage(cMessage* msg)
{
    if (msg->isSelfMessage()){
        handleSelfMsg(msg);
    //} else if(msg->getArrivalGateId()==upperGateIn) {
    } else if(msg->getArrivalGateId()==upperLayerIn) {
        recordPacket(PassedMessage::INCOMING,PassedMessage::UPPER_DATA,msg);
        handleUpperMsg(msg);
    } else if(msg->getArrivalGateId()==upperControlIn) {
        recordPacket(PassedMessage::INCOMING,PassedMessage::UPPER_CONTROL,msg);
        handleUpperControl(msg);
    } else if(msg->getArrivalGateId()==lowerControlIn){
        recordPacket(PassedMessage::INCOMING,PassedMessage::LOWER_CONTROL,msg);
        handleLowerControl(msg);
    //} else if(msg->getArrivalGateId()==lowerGateIn) {
    } else if(msg->getArrivalGateId()==lowerLayerIn) {
        recordPacket(PassedMessage::INCOMING,PassedMessage::LOWER_DATA,msg);
        handleLowerMsg(msg);
    } else if(msg->getArrivalGateId()==radioIn) {
        //MiximBatteryAccess::drawCurrent(365.6, 0); //rx_Current
        handleQueryReplyMessage(static_cast<QueryReply *>(msg));
        delete msg;
    }

    else if(msg->getArrivalGateId()==-1) {
        /* Classes extending this class may not use all the gates, f.e.
         * BaseApplLayer has no upper gates. In this case all upper gate-
         * handles are initialized to -1. When getArrivalGateId() equals -1,
         * it would be wrong to forward the message to one of these gates,
         * as they actually don't exist, so raise an error instead.
         */
        opp_error("No self message and no gateID?? Check configuration.");
    } else {
        /* msg->getArrivalGateId() should be valid, but it isn't recognized
         * here. This could signal the case that this class is extended
         * with extra gates, but handleMessage() isn't overridden to
         * check for the new gate(s).
         */
        opp_error("Unknown gateID?? Check configuration or override handleMessage().");
    }
}
