//
//  THMortgage.m
//  Homemortgagecalculator
//
//  Created by Tyler Hemmie on 9/27/14.
//  Copyright (c) 2014 Frozen Fire Studios. All rights reserved.
//

#import "THMortgage.h"
#import "THCalculator.h"
#import "FormulaViewController.h"
#import "FormulaListViewController.h"
#import "THVariable.h"



@implementation THMortgage

- (NSNumber *)collectPrinciple {
    
    THVariable *principleVariable = [self.variables objectAtIndex:0];
    
    
    if (principleVariable.value == nil) {
        NSNumber *principle = @([principleVariable.defaultValue integerValue]);
        NSLog(@"%@",principle);
        
        return principle;
        
    }
    else {
        NSNumber *principle = principleVariable.value;
        NSLog(@"%@",principle);
        
        
        return principle;
        
    }
    
}

- (NSNumber *)collectInterest {
    
    THVariable *interestVariable = [self.variables objectAtIndex:1];
    
    
    if (interestVariable.value == nil) {
        NSNumber *interest = @([interestVariable.defaultValue integerValue]);
        NSLog(@"%@",interest);
        
        return interest;
        
    }
    else {
        NSNumber *interest = interestVariable.value;
        NSLog(@"%@",interest);
        
        
        return interest;
        
    }
    
}

- (NSNumber *)collectYears {
    
    THVariable *yearsVariable = [self.variables objectAtIndex:2];
    
    
    if (yearsVariable.value == nil) {
        NSNumber *years = @([yearsVariable.defaultValue integerValue]);
        NSLog(@"%@",years);
        
        return years;
        
    }
    else {
        NSNumber *years = yearsVariable.value;
        NSLog(@"%@",years);
        
        
        return years;
        
    }
    
}

-(NSNumber *)calculate {

//    THVariable *principleVariable = [self.variables objectAtIndex:0];
//    THVariable *interestVariable = [self.variables objectAtIndex:1];
//    THVariable *yearsVariable = [self.variables objectAtIndex:2];
    


//    if (principleVariable.value == nil) {
//        NSNumber *principle = @([principleVariable.defaultValue integerValue]);
//        NSLog(@"%@",principle);
//    }
//    else {
//        NSNumber *principle = principleVariable.value;
//        NSLog(@"%@",principle);
//
//    }
//    
    NSNumber *principle = [self collectPrinciple];
    NSNumber *interest = [self collectInterest];
    NSNumber *years = [self collectYears];

//    NSLog(@"%@",principleVariable.value);
//    NSLog(@"%@",interestVariable.value);
//    NSLog(@"%@",yearsVariable.value);
    
    NSNumber *adjustedInterest = @(interest.floatValue / 1200.0);
    NSNumber *months = @([years doubleValue] * 12.0);
    
//     ((ixPx((1+i)^n))/(((1+i)^n)-1))
    
//         (i*P*((1+i)^n)
        NSNumber *top = @(adjustedInterest.floatValue * principle.floatValue * pow((1.0 + adjustedInterest.floatValue), months.floatValue));
//         ((1+i)^n)-1)
        NSNumber *bot = @(pow((1.0 + adjustedInterest.floatValue), months.floatValue) - 1.0);
    
        return @(top.floatValue/bot.floatValue);

}


@end
