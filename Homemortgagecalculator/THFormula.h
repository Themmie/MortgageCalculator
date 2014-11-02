//
//  FormulaObject.h
//  Homemortgagecalculator
//
//  Created by Tyler Hemmie on 9/24/14.
//  Copyright (c) 2014 Frozen Fire Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface THFormula : NSObject

@property (strong, nonatomic) NSMutableArray *variables;

- (NSNumber *)calculate;


@end
