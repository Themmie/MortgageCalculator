//
//  FormulaViewController.m
//  Homemortgagecalculator
//
//  Created by Tyler Hemmie on 7/21/14.
//  Copyright (c) 2014 Frozen Fire Studios. All rights reserved.
//

#import "FormulaViewController.h"
#import "THVariable.h"
#import "BasicTableViewCell.h"
#import "ToggleTableViewCell.h"
#import "UIColor+THColors.h"
#import "THCalculator.h"



@interface FormulaViewController () <THValueCellDelegate>

@end

@implementation FormulaViewController




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor myTableViewBackgroundColor];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.formula.variables count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath

{

    THVariable *part = [self.formula.variables objectAtIndex:indexPath.row];
    
    
    
    
    //objectAtIndex:(NSUInteger)index;
    
    BasicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:part.type forIndexPath:indexPath];

    
    if ([part.type  isEqual:@"basic"]) {
     
        [cell.titleLabel setText:part.name];
        [cell.valueTextField setText:part.defaultValue];
             
//        NSLog(@"%@",part.type);
//        NSLog(@"%@",part.name);
//        NSLog(@"%@",part.defaultValue);
        
        [cell setDelegate:self];

    }
    
    else if ([part.type isEqualToString:@"custom"]) {
        [cell setDelegate:self];

    }
    else if ([part.type isEqualToString:@"toggle"]) {
        [[(ToggleTableViewCell *)cell toggleControl] insertSegmentWithTitle:@"15" atIndex:0 animated:NO];
        [[(ToggleTableViewCell *)cell toggleControl] insertSegmentWithTitle:@"20" atIndex:1 animated:NO];
        [[(ToggleTableViewCell *)cell toggleControl] insertSegmentWithTitle:@"25" atIndex:2 animated:NO];
        [[(ToggleTableViewCell *)cell toggleControl] insertSegmentWithTitle:@"30" atIndex:3 animated:NO];
        [[(ToggleTableViewCell *)cell toggleControl] insertSegmentWithTitle:@"40" atIndex:4 animated:NO];

        [cell setDelegate:self];


    }
    else if ([part.type isEqualToString:@"add"]) {
        
    }
    else {
        
    }
    
    return cell;
                                                

    
    
    
    
    
    
//    if (indexPath.row == 0){
//    
//    UITableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:@"custom" forIndexPath:indexPath];
//        
//        
//        return customCell;
//    }
//     else if (indexPath.row == 1){
//            
//    UITableViewCell *toggleCell = [tableView dequeueReusableCellWithIdentifier:@"toggle" forIndexPath:
//        indexPath];
//         return toggleCell;
//             
//    }
//     else if (indexPath.row == 4){
//         
//    UITableViewCell *addCell = [tableView dequeueReusableCellWithIdentifier:@"Add" forIndexPath:
//        indexPath];
//         return addCell;
//    }
//             
//    else {
//        
//        UITableViewCell *basicCell = [tableView dequeueReusableCellWithIdentifier:@"basic" forIndexPath:
//        indexPath];
//            return basicCell;
//      // Configure the cell...
//    }

    
}

#pragma mark - THValueCellDelegate

- (void)cell:(BasicTableViewCell *)cell valueDidChange:(NSNumber *)value
{
//    NSLog(@"%@: %@",cell,value);
    
    NSIndexPath *indexPath = [self.FormulaTableView indexPathForCell:cell];
    THVariable *part = [self.formula.variables objectAtIndex:indexPath.row];
    part.value = value;

//    NSLog(@"%@",self.formula.Variables);

////    NSInteger solution = [calculator frontRatioForPayment:p andIncome:i];
//    NSInteger solution = [calculator monthlyMortgageAmountForPrinciple:p andInterest:i andNumberOfPayments:y];
//    [self.formula calculate]
    [self.answerLabel setText:[NSString stringWithFormat: @"%@",[self.formula calculate]]];

    
}

@end
