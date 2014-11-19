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
#import "CustomTableViewCell.h"
#import "ToggleTableViewCell.h"
#import "AddTableViewCell.h"
#import "UIColor+THColors.h"
#import "THCalculator.h"
#import "FormulaListViewController.h"

@interface FormulaViewController () <THValueCellDelegate, UITableViewDataSource, UITableViewDelegate>

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

#pragma mark - UITableViewDataSource

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
    
    
    if ([part.type  isEqualToString:@"basic"]) {
     
        BasicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:part.type forIndexPath:indexPath];

        
        [cell.titleLabel setText:part.name];
        [cell.valueTextField setText:part.defaultValue];
             
//        NSLog(@"%@",part.type);
//        NSLog(@"%@",part.name);
//        NSLog(@"%@",part.defaultValue);
        
        [cell setDelegate:self];
        
        return cell;


    }
    
    else if ([part.type isEqualToString:@"custom"]) {
        
        CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:part.type forIndexPath:indexPath];
        
        
        [cell setDelegate:self];
        
        return cell;


    }
    else if ([part.type isEqualToString:@"toggle"]) {
        
        BasicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:part.type forIndexPath:indexPath];

        
        [[(ToggleTableViewCell *)cell toggleControl] insertSegmentWithTitle:@"15" atIndex:0 animated:NO];
        [[(ToggleTableViewCell *)cell toggleControl] insertSegmentWithTitle:@"20" atIndex:1 animated:NO];
        [[(ToggleTableViewCell *)cell toggleControl] insertSegmentWithTitle:@"25" atIndex:2 animated:NO];
        [[(ToggleTableViewCell *)cell toggleControl] insertSegmentWithTitle:@"30" atIndex:3 animated:NO];
        [[(ToggleTableViewCell *)cell toggleControl] insertSegmentWithTitle:@"40" atIndex:4 animated:NO];
        [[(ToggleTableViewCell *)cell toggleControl] setSelectedSegmentIndex:3];
        

        [cell setDelegate:self];

        return cell;

    }
    else if ([part.type isEqualToString:@"add"]) {
        AddTableViewCell *addCell = [tableView dequeueReusableCellWithIdentifier:part.type forIndexPath:indexPath];

//        addCell.userInteractionEnabled = YES;
//        addCell.selectionStyle = UITableViewCellSelectionStyleBlue;

//        [addCell setDelegate:self];

        
        return addCell;
        
    }
    else {
        
    }
    
    return nil;
}


//- (void)makeANewCell:(UITableView *)tableview {
//    
//    NSIndexPath *path1 = [NSIndexPath indexPathForRow:0 inSection:0];
//    NSIndexPath *path2 = [NSIndexPath indexPathForRow:1 inSection:0];
//    NSArray *indexArray = [NSArray arrayWithObjects:path1,path2,nil];
//    
//    [self.FormulaTableView beginUpdates];
//    [self.FormulaTableView insertRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationRight];
//    [self.FormulaTableView endUpdates];
//}

    
    
    
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

#pragma mark - UITableViewDelegate

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    THVariable *part = [self.formula.variables objectAtIndex:indexPath.row];
    
    if ([part.type isEqualToString:@"add"]) return indexPath;
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    THVariable *part = [self.formula.variables objectAtIndex:indexPath.row];
    
//    [self.formula.variabl]
    
    
    if ([part.type isEqualToString:@"add"]) {
        
        
        
//        THVariable *addCredit = [[THVariable alloc] init];
//        addCredit.type = @"add";
//        [self.variables addObject:addCredit];
//        
//        [backRatioFormula setVariables:@[income, mortgage, addCredit]];
//        
//        [formulaViewController setFormula:backRatioFormula];
        
        THVariable *newVariable = [[THVariable alloc] init];
        newVariable.type = @"custom";
        newVariable.defaultValue = @"0";
#warning MAKING THIS 0 AS WELL AND I AMDE DEFAULT 0 NOT THAT IT REALLY MATTERS
        newVariable.value = @0;

        
        [self.formula.variables insertObject:newVariable atIndex:([self.formula.variables count]- 1)];
        
        NSLog(@"%@",self.formula.variables);

        NSIndexPath *newIndex = [NSIndexPath indexPathForRow:([self.formula.variables count]- 2) inSection:0];
 
        [self.FormulaTableView insertRowsAtIndexPaths:@[newIndex] withRowAnimation:UITableViewRowAnimationRight];
    }

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
