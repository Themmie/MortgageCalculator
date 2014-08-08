//
//  THCalculator.m
//  MortgageCalculator
//
//  Created by Tyler Hemmie on 4/27/14.
//  Copyright (c) 2014 Frozen Fire Studios. All rights reserved.
//

#import "THCalculator.h"

@implementation THCalculator


- (CGFloat)monthlyMortgageAmountForPrinciple:(CGFloat)principle andInterest:(CGFloat)interest andNumberOfPayments:(NSUInteger)numberOfPayments
{
    CGFloat adjustedInterest = interest/1200.0;
    CGFloat adjustedNumberOfPayments = numberOfPayments*12.0;
    // ((ixPx((1+i)^n))/(((1+i)^n)-1))
    
    // (i*P*((1+i)^n)
    CGFloat top = adjustedInterest * principle * pow((1.0 + adjustedInterest), adjustedNumberOfPayments);
    // ((1+i)^n)-1)
    CGFloat bot = pow((1.0 + adjustedInterest), adjustedNumberOfPayments) - 1.0;
    
    return top/bot;
}

-(NSInteger)frontRatioForPayment:(CGFloat)payment andIncome:(CGFloat)income
{
    return payment/income*100;
}

-(NSInteger)backRatioForMortgage:(CGFloat)mortgage andIncome:(CGFloat)income andSchool:(CGFloat)school andCar:(CGFloat)car andAnything:(CGFloat)anything
{
    return (mortgage+school+car+anything)/income*100;
}
@end
