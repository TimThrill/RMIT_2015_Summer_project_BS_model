/*
 * Util.h
 *
 *  Created on: Jan 3, 2016
 *      Author: cheetah
 */

#ifndef UTIL_H_
#define UTIL_H_

/*
 * Returns the distance between two points on the Earth.
 * Direct translation from http://en.wikipedia.org/wiki/Haversine_formula
*/
double getDistance(double longitude1, double longitude2, double latitude1, double latitude2);


#endif /* UTIL_H_ */
