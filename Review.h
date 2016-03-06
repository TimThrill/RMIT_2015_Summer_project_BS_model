/*
 * Review.h
 *
 *  Created on: 19 Dec 2015
 *      Author: Cong MA
 */

#ifndef REVIEW_H_
#define REVIEW_H_

#include "Customer.h"
#include "Business.h"

/**
 * This is the review of a business
 * */
class Review {
public:
    int customerId;
    int businessId;
    std::string textReview;
    double rating;
    Review(int iCustomerId, int iBusinessId, double iRating, std::string iReview)
    : customerId(iCustomerId),
      businessId(iBusinessId),
      rating(iRating),
      textReview(iReview){}
};



#endif /* REVIEW_H_ */
