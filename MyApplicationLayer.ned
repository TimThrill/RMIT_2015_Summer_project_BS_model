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

package p2p_wireless_wifi;

import org.mixim.base.modules.IBaseApplLayer;


//
// TODO auto-generated type
//
simple MyApplicationLayer like IBaseApplLayer
{
    parameters:
        // Parameter to record processing time
        @signal[finish](type=simtime_t);
        @statistic[processingTime](title=query processing time; source=finish; record=mean; interpolationmode=none);
        @signal[queryFinish](type=simtime_t);
        @statistic[queryTime](title=query time; source=queryFinish; record=mean; interpolationmode=none);
        @signal[queryResponse](type=simtime_t);
         @statistic[queryResponseTime](title=query response time; source=queryResponse; record=mean; interpolationmode=none);
        // Parameter to record latency
        @signal[reply](type=simtime_t);
        @statistic[latency](title=laytency; source=reply; record=mean; interpolationmode=none);
        // Parameter to record beacon send
        @signal[beaconSend](int);
        @statistic[beaconSendNumber](title=beaconSendNumber; source=beaconSend; record=last);
        // Parameter to record beacon receiving
        @signal[beaconReceive](int);
        @statistic[beaconReceiveNumber](title=beaconReceiveNumber; source=beaconReceive; record=last);
        // Parameter to record query send rounds
        @signal[querySendRound](int);
        @statistic[querySendRoundNumber](title=querySendRoundNumber; source=querySendRound; record=last);
        // Parameter to record query send number, total query number of different rounds
        @signal[querySend](int);
        @statistic[querySendNumber](title=querySendNumber; source=querySend; record=last);
        // Paramter to recor query reply number
        @signal[queryReply](int);
        @statistic[queryReplyNumber](title=queryReplyNumber; source=queryReply; record=last);
        // Parameter to record query successful rate
        @signal[roundFinish](type=double);
        @statistic[querySuccessfulRate](title=QueryRate; source=roundFinish; record=last; interpolationmode=none);
        // Parameter to record query score processing time
        @signal[scoreFinish](type=simtime_t);
        @statistic[queryScoreProcessingTime](title=query score processing time; source=scoreFinish; record=mean; interpolationmode=none);
        
        //Declareation for the cpp file
        @class(MyApplicationLayer);
        bool coreDebug = default(false); //debug switch for base class (TestApplLayer)
        bool debug = default(false); // debug switch
        int headerLength @unit("bit"); // length of the application message header (in bits)
        //double longitude;	// Longitude of the node
        //double latitude;	// Latitude of the node
        double lamda;	// Parameter for poisson formula
		int node_id;	// Node id
        // string businessId;	// The id of query business, this is for first stage test

    gates:
        input lowerLayerIn; // from network layer
        output lowerLayerOut; // to network layer
        input lowerControlIn; // control from network layer
        output lowerControlOut; // control to network layer
        input radioIn;
}
