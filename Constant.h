/*
 * Constant.h
 *
 *  Created on: 26 Dec 2015
 *      Author: admin
 */

#ifndef CONSTANT_H_
#define CONSTANT_H_

#include <string>

const int MESSAGE_EXPIRE_TIME = 5; // Expiration time of send message
const int MAX_SIM_TIME = 10;    // Max simulation time @unit(s)
const int QUERY_FREQUENCY = 30;   // Query interval of each query round
const int INITIAL_BEACON_NODES_NUMBER = 50; // Initial number of node who send beacon messages
const int MAX_QUERY_REPLY_BUSINESS = 10; // The number of businesses in query reply messages
const double MAX_RANGE = 20000;	// Max range of query business
const std::string MAIN_INDEXING_PATH = "/mnt/cong/";   // The root path contain lexicon, docMap and inverted list file
const std::string REVIEW_JSON_DATASET = "/mnt/cong/"; // This file contains original review data
const std::string QUERY_RESULT_PATH = "./QueryResults/";	// The path to record query results

#endif /* CONSTANT_H_ */
