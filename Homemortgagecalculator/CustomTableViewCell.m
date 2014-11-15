//
//  CustomTableViewCell.m
//  Homemortgagecalculator
//
//  Created by Tyler Hemmie on 8/6/14.
//  Copyright (c) 2014 Frozen Fire Studios. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code
//    }
//    return self;
//}

#pragma mark - Value

- (void)valueChanged:(UITextField *)textField
{
    [self.delegate cell:self valueDidChange:@(textField.text.doubleValue)];
}
@end
