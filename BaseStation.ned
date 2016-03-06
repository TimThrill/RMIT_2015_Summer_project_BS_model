package p2p_wireless_wifi;

import org.mixim.base.modules.BaseArp;
import org.mixim.base.modules.IBaseNetwLayer;
import org.mixim.modules.nic.Nic802154_TI_CC2420;
import org.mixim.modules.power.battery.BatteryStats;
import org.mixim.modules.power.battery.SimpleBattery;


// TODO: Battery module will be added later
// implement MyApp  
module BaseStation
{
    parameters:
        string applType; //type of the application layer
        string netwType; //type of the network layer
        string mobType; //type of the mobility module
        @display("bgb=,,white;i=abstract/person");
        @node();
    gates:
        input radioIn; // gate for sendDirect
        //output displayConnection1; // gate for display Interest Object connection
        //output displayConnection2;
    submodules:
        //        utility: BaseUtility {
        //            parameters:
        //                @display("p=130,38;b=24,24,rect,black;i=block/blackboard");
        //        }
        arp: BaseArp {
            parameters:
                @display("p=130,101;b=24,24,rect,blue;i=block/process");
        }
        mobility: <mobType> like inet.mobility.IMobility {
            parameters:
                @display("p=130,166;i=block/cogwheel");
        }
        appl: BSApp {
            parameters:
                @display("p=59,38;i=app");
        }
        netwl: <netwType> like IBaseNetwLayer {
            parameters:
                @display("p=60,101;i=block/layer");
        }
        nic: Nic802154_TI_CC2420 {
            parameters:
                @display("b=32,30;p=60,233;i=block/ifcard");
        }

        //nic: NicCSMA {
        //    parameters:
        //       @display("b=32,30;p=80,233;i=block/ifcard");
        //}

        batteryStats: BatteryStats {
            @display("p=232,174;i=block/circle");
        }

        battery: SimpleBattery {
            @display("p=232,77;i=block/control");
        }
    connections allowunconnected:
        nic.upperLayerOut --> netwl.lowerLayerIn;
        nic.upperLayerIn <-- netwl.lowerLayerOut;
        nic.upperControlOut --> { @display("ls=red;m=m,70,0,70,0"); } --> netwl.lowerControlIn;
        nic.upperControlIn <-- { @display("ls=red;m=m,70,0,70,0"); } <-- netwl.lowerControlOut;

        netwl.upperLayerOut --> appl.lowerLayerIn;
        netwl.upperLayerIn <-- appl.lowerLayerOut;
        netwl.upperControlOut --> { @display("ls=red;m=m,70,0,70,0"); } --> appl.lowerControlIn;
        netwl.upperControlIn <-- { @display("ls=red;m=m,70,0,70,0"); } <-- appl.lowerControlOut;

        radioIn --> appl.radioIn;
}

