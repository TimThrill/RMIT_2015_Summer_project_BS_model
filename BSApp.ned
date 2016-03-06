
// -- 15 Dec, 2010--
// define our own application layer.
// the query node will subsequentially choose one of its connected node
// to communicate with and ask for its query.
// first I implement for single type object query.
// Asumptions: 
// 1.Each mobile node knows its three nearest neighbors and saves into its cache
// 2. Each connected node will provide 1 verified answer
// 3. Verification method hasn't implemented yet
   
package p2p_wireless_wifi;

import org.mixim.base.modules.IBaseApplLayer;

simple BSApp like IBaseApplLayer
{
    parameters:
        @class(BSApp);
        @signal[scoreFinish](type="double");
        @statistic[processingTime](title="query processing time"; source="scoreFinish"; record=last; interpolationmode=none);
        bool debug; // debug switch
        int headerLength @unit("bit"); // length of the application message header (in bits)
        //bool multipleVerification = default(false);
        //bool centralizedApproach = default(false);
        int node_id;	// Node id
     
    gates:
        input lowerLayerIn; // from network layer
        output lowerLayerOut; // to network layer
        input lowerControlIn; // control from network layer
        output lowerControlOut; // control to network layer  
        input radioIn;
}
