//
//  BasicCellTableViewCell.h
//  Homemortgagecalculator
//
//  Created by Tyler Hemmie on 8/6/14.
//  Copyright (c) 2014 Frozen Fire Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *valueTextField;

@end
