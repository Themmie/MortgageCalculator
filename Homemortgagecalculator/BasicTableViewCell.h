//
//  BasicCellTableViewCell.h
//  Homemortgagecalculator
//
//  Created by Tyler Hemmie on 8/6/14.
//  Copyright (c) 2014 Frozen Fire Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BasicTableViewCell;

@protocol THValueCellDelegate <NSObject>

- (void)cell:(BasicTableViewCell *)cell valueDidChange:(NSValue *)value;

@end

@interface BasicTableViewCell : UITableViewCell

@property (weak, nonatomic) id <THValueCellDelegate> delegate;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *valueTextField;

- (IBAction)valueChanged:(UITextField *)textField;

@end
