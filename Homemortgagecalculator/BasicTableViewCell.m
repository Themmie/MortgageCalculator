//
//  BasicCellTableViewCell.m
//  Homemortgagecalculator
//
//  Created by Tyler Hemmie on 8/6/14.
//  Copyright (c) 2014 Frozen Fire Studios. All rights reserved.
//

#import "BasicTableViewCell.h"

@implementation BasicTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
