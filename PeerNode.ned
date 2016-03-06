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

import org.mixim.base.modules.BaseArp;
import org.mixim.base.modules.IBaseNetwLayer;
import org.mixim.modules.power.battery.BatteryStats;
import org.mixim.modules.power.battery.SimpleBattery;


//
// TODO auto-generated type
//
module PeerNode
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
        appl: MyApplicationLayer {
            parameters:
                @display("p=59,38;i=app");
        }
        netwl: <netwType> like IBaseNetwLayer {
            parameters:
                @display("p=60,101;i=block/layer");
        }
        nic: MyNic {
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
        nic.upperLayerOut --> { @display("ls=black;m=m,70,0,70,0"); } --> netwl.lowerLayerIn;
        nic.upperLayerIn <-- { @display("ls=black;m=m,70,0,70,0"); } <-- netwl.lowerLayerOut;
        nic.upperControlOut --> { @display("ls=red;m=m,70,0,70,0"); } --> netwl.lowerControlIn;
        nic.upperControlIn <-- { @display("ls=red;m=m,70,0,70,0"); } <-- netwl.lowerControlOut;

        netwl.upperLayerOut --> { @display("ls=black;m=m,70,0,70,0"); } --> appl.lowerLayerIn;
        netwl.upperLayerIn <-- { @display("ls=black;m=m,70,0,70,0"); } <-- appl.lowerLayerOut;
        netwl.upperControlOut --> { @display("ls=red;m=m,70,0,70,0"); } --> appl.lowerControlIn;
        netwl.upperControlIn <-- { @display("ls=red;m=m,70,0,70,0"); } <-- appl.lowerControlOut;

        radioIn --> appl.radioIn;
}
