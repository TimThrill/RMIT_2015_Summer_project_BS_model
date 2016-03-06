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

cplusplus {{
#include <vector>
#include "KeyWords.h"
#include "ApplPkt_m.h"
#include "Coord.h"
}}

packet ApplPkt;
class noncobject Keywords;
class Coord;

//
// TODO generated message class
//
packet Query extends ApplPkt {
    string businessName;
    string businessType;
    Keywords keyWords;	// key words of the query search
    // In omnet++ we use coord instead of longitude and latitude
    //double longitude;
    //double latitude;
    Coord peerLocation;
    double maxRange;	// Max range distance of the business (unit@m)
    simtime_t timeStamp;	// Time stamp
}
