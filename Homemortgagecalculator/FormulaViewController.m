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
#import "UIColor+THColors.h"


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
    return [self.array count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath

{

    THVariable *part = [self.array objectAtIndex:indexPath.row];
    
    
    
    
    //objectAtIndex:(NSUInteger)index;
    
    BasicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:part.type forIndexPath:indexPath];
    
    if ([part.type  isEqual:@"basic"]) {
     
        //not self, tableview, THVariable, part.type, UITableview,
        //I may need to add 
        [cell.titleLabel setText:part.name];
        [cell.valueTextField setText:part.defaultValue];
        
        [cell setDelegate:self];
     
        NSLog(@"%@",part.type);
        NSLog(@"%@",part.name);
        NSLog(@"%@",part.defaultValue);
        
    }
    
    else if ([part.type isEqualToString:@"custom"]) {
        
    }
    else if ([part.type isEqualToString:@"toggle"]) {

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

- (void)cell:(BasicTableViewCell *)cell valueDidChange:(NSValue *)value
{
    NSLog(@"%@: %@",cell,value);
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
