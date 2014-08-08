//
//  THCalculatorTests.m
//  MortgageCalculator
//
//  Created by Tyler Hemmie on 5/8/14.
//  Copyright (c) 2014 Frozen Fire Studios. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "THCalculator.h"

@interface THCalculatorTests : XCTestCase
{
    THCalculator *testCalculator;
}
@end

@implementation THCalculatorTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    testCalculator = [[THCalculator alloc] init];
}

- (void)tearDown
{
    testCalculator = nil;
    
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMonthlyMortgageAmountForPrinciple_165000
{
    CGFloat expectedValue = 1097.75;
    CGFloat realValue = [testCalculator monthlyMortgageAmountForPrinciple:165000 andInterest:7.0 andNumberOfPayments:30];
    
    CGFloat roundedValue = [[NSString stringWithFormat:@"%0.2f",realValue] floatValue];
    
    XCTAssertEqual(expectedValue, roundedValue, @"Expected value should equal real value.");
}

- (void)testMonthlyMortgageAmountForPrinciple_200000
{
    CGFloat expectedValue = 1330.60;
    CGFloat realValue = [testCalculator monthlyMortgageAmountForPrinciple:200000 andInterest:7.0 andNumberOfPayments:30];
    
    CGFloat roundedValue = [[NSString stringWithFormat:@"%0.2f",realValue] floatValue];
    
    XCTAssertEqual(expectedValue, roundedValue, @"Expected value should equal real value.");
}

- (void)testMonthlyMortgageAmountForPrinciple_WrongValue
{
    CGFloat expectedValue = 200.00;
    CGFloat realValue = [testCalculator monthlyMortgageAmountForPrinciple:200000 andInterest:7.0 andNumberOfPayments:30];
    
    CGFloat roundedValue = [[NSString stringWithFormat:@"%0.2f",realValue] floatValue];
    
    XCTAssertNotEqual(expectedValue, roundedValue, @"Expected value should equal real value.");
}


- (void)testFrontRatioForMortgage_1000
{
    CGFloat expectedValue = 33;
    CGFloat realValue = [testCalculator frontRatioForPayment:1000.0 andIncome:3000];
    
    XCTAssertEqual(expectedValue, realValue, @"Expected value should equal real value");
    
}

- (void)testFrontRatioForMortgage_1500
{
    CGFloat expectedValue = 50;
    CGFloat realValue = [testCalculator frontRatioForPayment:1500 andIncome:3000];
    
    XCTAssertEqual(expectedValue, realValue, @"Expected value should equal real value");
}

- (void)testFrontRatioForMortgage_WrongValue
{
    CGFloat expectedValue = 20;
    CGFloat realValue = [testCalculator frontRatioForPayment:1500 andIncome:3000];
    
    XCTAssertNotEqual(expectedValue, realValue, @"Expected value should not equal real value");
}

- (void)testBackRatioForMortgage_1500
{
    CGFloat expectedValue = 50;
    CGFloat realValue = [testCalculator backRatioForMortgage:1500 andIncome:4000 andSchool:250 andCar:200 andAnything:50];
    
    XCTAssertEqual(expectedValue, realValue, @"Expected value should equal real value");
}

- (void)testBackRatioForMortgage_2000
{
    CGFloat expectedValue = 10;
    CGFloat realValue = [testCalculator backRatioForMortgage:500 andIncome:7000 andSchool:100 andCar:25 andAnything:75];
    
    XCTAssertEqual(expectedValue, realValue, @"Expected value should equal real valeu");
}

- (void)testBackRatioForMortgage_WrongValue
{
    CGFloat expectedValue = 50;
    CGFloat realValue = [testCalculator backRatioForMortgage:500 andIncome:7000 andSchool:100 andCar:25 andAnything:75];
    
    XCTAssertNotEqual(expectedValue, realValue, @"Expected value should not equal real value");
}
@end
