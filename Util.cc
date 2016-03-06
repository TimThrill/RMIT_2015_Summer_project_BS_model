#include <cmath>
#include <math.h>

#include "Util.h"

int queryNodeNumber = 0;    // The initial number of nodes that send beacon/query messages

/**
 * Returns the distance between two points on the Earth.
 * Direct translation from http://en.wikipedia.org/wiki/Haversine_formula
 * @param lat1d Latitude of the first point in degrees
 * @param lon1d Longitude of the first point in degrees
 * @param lat2d Latitude of the second point in degrees
 * @param lon2d Longitude of the second point in degrees
 * @return The distance between the two points in kilometers
 */
double getDistance(double longitude1, double longitude2,
                    double latitude1, double latitude2) {
    double earthRadiusKm = 6371.0;
    double lat1r, lon1r, lat2r, lon2r, u, v;
    lat1r = latitude1 * M_PI / 180;
    lon1r = longitude1 * M_PI / 180;
    lat2r = latitude2 * M_PI / 180;
    lon2r = longitude2 * M_PI / 180;
    u = sin((lat2r - lat1r)/2);
    v = sin((lon2r - lon1r)/2);
    return 2.0 * earthRadiusKm * asin(sqrt(u * u + cos(lat1r) * cos(lat2r) * v * v));
}
