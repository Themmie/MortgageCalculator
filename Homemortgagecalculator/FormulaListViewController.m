//
//  FormulaListViewController.m
//  Homemortgagecalculator
//
//  Created by Tyler Hemmie on 7/21/14.
//  Copyright (c) 2014 Frozen Fire Studios. All rights reserved.
//

#import "FormulaListViewController.h"

@interface FormulaListViewController ()

@end

@implementation FormulaListViewController

- (void)viewDidLoad

    
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*- (NSInteger)tableView:(UITableView *)tableView
            numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
                cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView
                          dequeueReusableCellWithIdentifier:@"FormulaListItem"];
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    if (indexPath.row == 0) {
        label.text = @"Mortgage";
        [cell setBackgroundColor:[UIColor redColor]];
    }
        else if (indexPath.row == 1){
        label.text = @"Front Ratio";
    }
        else if (indexPath.row == 2){
        label.text = @"Back Ratio";
    
    }
        return cell;
}*/
@end
