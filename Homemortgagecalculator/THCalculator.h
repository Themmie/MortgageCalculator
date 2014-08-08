//
//  THCalculator.h
//  MortgageCalculator
//
//  Created by Tyler Hemmie on 4/27/14.
//  Copyright (c) 2014 Frozen Fire Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface THCalculator : NSObject

/**
 
 Calculatese the monthly mortgage payment for given parameters.
 
 @param principle The total dollar ammount of your loan
 @param interest The annual interest percentage
 @param numberOfPayments The total number of payments in years
 
 */
- (CGFloat)monthlyMortgageAmountForPrinciple:(CGFloat)principle andInterest:(CGFloat)interest andNumberOfPayments:(NSUInteger)numberOfPayments;

- (NSInteger)frontRatioForPayment:(CGFloat)payment andIncome:(CGFloat)income;

-(NSInteger)backRatioForMortgage:(CGFloat)mortgage andIncome:(CGFloat)income andSchool:(CGFloat)school andCar:(CGFloat)car andAnything:(CGFloat)anything;

@end
