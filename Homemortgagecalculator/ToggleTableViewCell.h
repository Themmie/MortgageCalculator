//
//  ToggleTableViewCell.h
//  Homemortgagecalculator
//
//  Created by Tyler Hemmie on 8/6/14.
//  Copyright (c) 2014 Frozen Fire Studios. All rights reserved.
//

#import "BasicTableViewCell.h"

@interface ToggleTableViewCell : BasicTableViewCell

@property (weak, nonatomic) IBOutlet UISegmentedControl *toggleControl;


@end
