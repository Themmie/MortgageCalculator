//
//  ToggleTableViewCell.m
//  Homemortgagecalculator
//
//  Created by Tyler Hemmie on 8/6/14.
//  Copyright (c) 2014 Frozen Fire Studios. All rights reserved.
//

#import "ToggleTableViewCell.h"

@implementation ToggleTableViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)awakeFromNib {
    [super awakeFromNib];
    [self.toggleControl removeAllSegments];
}

- (void)prepareForReuse {
    [self.toggleControl removeAllSegments];
}

- (IBAction)segmentChanged:(UISegmentedControl *)sender {
        NSNumber *numberValue = [[NSNumber alloc] initWithFloat:[self.toggleControl titleForSegmentAtIndex:self.toggleControl.selectedSegmentIndex].floatValue];
        [self.delegate cell:self valueDidChange:numberValue];
}
@end
