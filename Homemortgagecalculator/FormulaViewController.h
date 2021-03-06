//
//  FormulaViewController.h
//  Homemortgagecalculator
//
//  Created by Tyler Hemmie on 7/21/14.
//  Copyright (c) 2014 Frozen Fire Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "THFormula.h"



@interface FormulaViewController : UIViewController

@property (nonatomic, strong) NSString *part;
@property (nonatomic, strong) THFormula *formula;

@property (nonatomic, retain) IBOutlet UILabel *answerLabel;

@property (weak, nonatomic) IBOutlet UITableView *FormulaTableView;




@end
