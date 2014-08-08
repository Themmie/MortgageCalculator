//
//  THVariable.h
//  Homemortgagecalculator
//
//  Created by Tyler Hemmie on 7/24/14.
//  Copyright (c) 2014 Frozen Fire Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface THVariable : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *defaultValue;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSNumber *value;

@end
