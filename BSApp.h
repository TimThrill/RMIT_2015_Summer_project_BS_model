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


#ifndef BSAPP_H_
#define BSAPP_H_

#include <mutex>
#include <queue>
#include <mutex>
#include <fstream>

#include "BaseApplLayer.h"
#include "MiXiMDefs.h"
#include "Beacon_m.h"
#include "BeaconReply_m.h"
#include "Query_m.h"
#include "QueryReply_m.h"
#include "LinearMobility.h"
#include "QueryScore.h"

#include "BaseApplLayer.h"
#include "cqueue.h"
#include <iostream>
#include "Query_m.h"
#include "QueryReply_m.h"
#include "HostState.h"
#include <vector>
#include "Constant.h"
using namespace std;
//#include <fstream>						// file I/O



class BSApp : public BaseApplLayer{
public:
    //Constructor
    BSApp();

    //Deconstructor
    virtual ~BSApp();

    /** @brief Initialization of the module and some variables*/
    void initialize(int);

    /* The message type of application layer */
    enum messageType {
        SEND_BEACON_TIMER,
        BEACON_MESSAGE,
        BEACON_REPLY_MESSAGE,
        QUERY_MESSAGE,
        QUERY_REPLY_MESSAGE,
        SEND_BEACON_EXPIRED_TIMER,      // Timer for expiration period of sent message
        SEND_QUERY_EXPIRED_TIMER
    };

    // Source ip address
    long srcAddress;
    // Destination ip address
    long destAdress;

//    // beacon send number for all nodes
//    static int beaconSendNumber;
//    // beacon receiving number for all nodes
//    static int beaconReceiveNumber;

    // We use poisson process to distribute query rounds of each peer node
    int queryTimes; // how many query rounds
    double lamda;   // parameter of poisson formula
    int querySendRounds; // Counter for how many query rounds

    int successfulQuery;

private:

    long myNetworkAddress;

    /** @brief Copy constructor is not allowed.
     */
    BSApp(const BSApp&);
    /** @brief Assignment operator is not allowed.
     */
    BSApp& operator=(const BSApp&);

    //std::queue<LAddress::L3Type> *queryPeerList;  // Address list of peers that return beacon reply message and shoudl send query message to

    std::mutex m;   // Mutex lock to ensure thread safe

    // Signal for recording the processing time of each simulation
    simsignal_t finishSignal;
    // signal for recording latency
    simsignal_t reply;
    simtime_t startTime;    // start time for whole process from peer discovery to query reply
    // Signal for recording the processing time of each query process
    simsignal_t queryFinish;
    simtime_t queryStartTime;   // start time for query process from send query message
    bool firstQuery;
    double irProcessTime;
    int rcvQueryNumber;


    // Signal for beacon send
    simsignal_t beaconSend;
    // Signal for beacon receiving
    simsignal_t beaconReceive;
    // Signal for query send round
    simsignal_t querySendRound;
    // Signal for query send
    simsignal_t querySend;
    // Signal for query reply receive
    simsignal_t queryReplyReceive;
    // Signal for recording query successful rate, record after each round finish
    simsignal_t roundFinish;
    // Signal for query score
    simsignal_t queryScoreFinish;

    // Counter for calculating query successful rate
    int numSendPackage;
    int numReceivePackage;

    int node_id;    // Node id for the node, this is corresponding to the node id in the dataset

    // Ranking class
    QueryScore *score;
    // Output file
    std::fstream oResult;   // For query reply
    std::fstream oKeywords; // For query keywords

protected:
    /** @brief Timer message for scheduling next message.*/
    cMessage *delayTimer;
    /** @brief Timer message for beacon expired period */
    cMessage *beaconExpiredTimer;
    /** @brief Timer message for query expired period */
    cMessage *queryExpiredTimer;
    /** @brief Enables debugging of this module.*/
    bool coreDebug;

    /** @brief Handle messages from lower layer */
    virtual void handleMessage(cMessage*);
    /** @brief Handle self messages such as timer... */
    void handleSelfMsg(cMessage*);
    /** @brief Handle beacon message */
    void handleBeaconMessage(Beacon*);
    /** @brief Handle beacon reply message */
    void handleBeaconReplyMessage(BeaconReply*);
    /** @brief Handle query message */
    void handleQueryMessage(Query*);
    /** @brief Handle query reply message */
    void handleQueryReplyMessage(QueryReply*);
    /** @brief Handle beacon expired timer */
    void handleBeaconExpiredTimer();
    /** @brief Handle query expired timer */
    void handleQueryExpiredTimer();
    /** @brief send a broadcast packet to all connected neighbors */
    void sendBeacon();
    /** @brief send beacon reply message */
    void sendBeaconReply(BeaconReply*);
    /** @brief send query message */
    void sendQuery(LAddress::L3Type& destAddr);
    /** @brief send query reply message */
    void sendQueryReply(QueryReply*, Query*);

    //** @brief get network address
    void setNetworkAddress();

    QueryReply* setQueryReplyMessage(QueryReply*, Query*);

    void printReceivedQueryMessage(Query*);
};

#endif /* MYAPP_H_ */
