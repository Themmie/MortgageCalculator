//
//  FormulaListViewController.m
//  Homemortgagecalculator
//
//  Created by Tyler Hemmie on 7/21/14.
//  Copyright (c) 2014 Frozen Fire Studios. All rights reserved.
//

#import "FormulaListViewController.h"
#import "THVariable.h"
#import "FormulaViewController.h"
#import "UIColor+THColors.h"
#import "THFormula.h"
#import "THMortgage.h"
#import "THFrontRatio.h"
#import "THBackRatio.h"

@interface FormulaListViewController ()

@end

@implementation FormulaListViewController

- (void)viewDidLoad

    
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor myTableViewBackgroundColor];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    FormulaViewController *formulaViewController = [segue destinationViewController];
    
    
    
    if ([segue.identifier isEqualToString:@"Mortgage"]) {
        
        THMortgage *mortgageFormula = [[THMortgage alloc] init];
        
        THVariable *principle = [[THVariable alloc] init];
        principle.type = @"basic";
        principle.name = @"Principle";
        principle.defaultValue = @"250000";

        
        THVariable *interest = [[THVariable alloc] init];
        interest.type = @"basic";
        interest.name = @"Interest";
        interest.defaultValue = @"75%";
        
        THVariable *years = [[THVariable alloc] init];
        years.type = @"toggle";
        years.name = @"Years";
        years.defaultValue = @"30";

        [mortgageFormula setVariables:[@[principle, interest, years] mutableCopy]];
        
        [formulaViewController setFormula:mortgageFormula];

        
        
    }
    else if ([segue.identifier isEqualToString:@"FrontRatio"]) {
    
        THFrontRatio *frontRatioFormula = [[THFrontRatio alloc] init];
        
        THVariable *income = [[THVariable alloc] init];
        income.type = @"basic";
        income.name = @"Monthly Gross Income";
        income.defaultValue = @"5000";
        
        THVariable *mortgage = [[THVariable alloc] init];
        mortgage.type = @"basic";
        mortgage.name = @"Monthly Mortgage";
        mortgage.defaultValue = @"2000";
        
//        [frontRatioFormula setVariables:@[income, mortgage]];
        [frontRatioFormula setVariables:[@[income, mortgage] mutableCopy]];
        
        [formulaViewController setFormula:frontRatioFormula];

        
    }
    else if ([segue.identifier isEqualToString:@"BackRatio"]) {
        
        THBackRatio *backRatioFormula = [[THBackRatio alloc] init];
        
        THVariable *income = [[THVariable alloc] init];
        income.type = @"basic";
        income.name = @"Monthly Gross Income";
        income.defaultValue = @"5000";
        
        THVariable *mortgage = [[THVariable alloc] init];
        mortgage.type = @"basic";
        mortgage.name = @"Monthly Mortgage";
        mortgage.defaultValue = @"2000";
        
        THVariable *addCredit = [[THVariable alloc] init];
        addCredit.type = @"add";
        
        [backRatioFormula setVariables:[@[income, mortgage, addCredit] mutableCopy]];

        [formulaViewController setFormula:backRatioFormula];

    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
