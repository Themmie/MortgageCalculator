//
//  THBackRatio.m
//  Homemortgagecalculator
//
//  Created by Tyler Hemmie on 9/27/14.
//  Copyright (c) 2014 Frozen Fire Studios. All rights reserved.
//

#import "THBackRatio.h"
#import "THCalculator.h"
#import "FormulaViewController.h"
#import "FormulaListViewController.h"
#import "THVariable.h"

@implementation THBackRatio

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

- (NSNumber *)collectOtherCredit {

    if ([self.variables count] > 3) {
        
        THVariable *otherCreditVariable = [self.variables objectAtIndex:2];
        
        if (otherCreditVariable.value == nil) {
            NSNumber *otherCredit = @([otherCreditVariable.defaultValue integerValue]);
            
            return otherCredit;
        }
        else {
            NSNumber *otherCredit = otherCreditVariable.value;
            
            return otherCredit;
        }
    }
    return nil;
}

- (NSNumber *)calculate {
   
    __block CGFloat otherCreditsValue = 0.0;
    [self.variables enumerateObjectsUsingBlock:^(THVariable *variable, NSUInteger idx, BOOL *stop) {
        if ([variable.type isEqualToString:@"custom"]) {
            otherCreditsValue += variable.value.floatValue;
            
        }
    }];
    NSLog(@"OtherCredits: %f",otherCreditsValue);
    
    NSNumber *income = [self collectIncome];
    NSNumber *mortgage = [self collectMortgage];
    NSNumber *otherCredit = [NSNumber numberWithFloat:otherCreditsValue];

    
//    __block CGFloat otherCreditsValue = 0.0;
//    [self.variables enumerateObjectsUsingBlock:^(THVariable *variable, NSUInteger idx, BOOL *stop) {
//        if ([variable.type isEqualToString:@"custom"]) {
//            otherCreditsValue += variable.value.floatValue;
//        }
//    }];
//    NSLog(@"OtherCredits: %f",otherCreditsValue);
    
//    NSMutableArray *defaultValues = [self.variables valueForKeyPath:@"value"];
//    
////    change to float for use
//    float incomeFLoat = [income floatValue];
//    
//    float total = 0;
//    for(NSString *str in defaultValues)
//    {
//        total += [str floatValue];
//        
//        NSLog(@"%f",(total - incomeFLoat)/incomeFLoat);
//    }
//    
//    //        return payment/income*100;
    
    
    return @(((mortgage.floatValue+otherCredit.floatValue)/income.floatValue));
}

@end
