//
//  THFrontRatio.m
//  Homemortgagecalculator
//
//  Created by Tyler Hemmie on 9/27/14.
//  Copyright (c) 2014 Frozen Fire Studios. All rights reserved.
//

#import "THFrontRatio.h"
#import "THCalculator.h"
#import "FormulaViewController.h"
#import "FormulaListViewController.h"
#import "THVariable.h"

@implementation THFrontRatio

- (NSNumber *)collectIncome {
    
    THVariable *incomeVariable = [self.variables objectAtIndex:0];
    
    if (incomeVariable.value == nil) {
        NSNumber *income = @([incomeVariable.defaultValue integerValue]);
        
        return income;
    }
    else {
        NSNumber *income = incomeVariable.value;
        
        return income;
    }


}

- (NSNumber *)collectMortgage {
    
    THVariable *mortgageVariable = [self.variables objectAtIndex:1];
    
    if (mortgageVariable.value == nil) {
        NSNumber *mortgage = @([mortgageVariable.defaultValue integerValue]);
        
        return mortgage;
    }
    else {
        NSNumber *mortgage = mortgageVariable.value;
        
        return mortgage;
    }
}

-(NSNumber *)calculate {
    
    NSNumber *income = [self collectIncome];
    NSNumber *mortgage = [self collectMortgage];
    

//        return payment/income*100;
    

    return @(mortgage.floatValue/income.floatValue);
}

@end
