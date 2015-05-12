//
//  SelectedRange.m
//  autocomplete_ios
//
//  Created by Christopher Lester on 5/11/15.
//  Copyright (c) 2015 IOS_SDK. All rights reserved.
//

#import "SelectedRange.h"

@implementation SelectedRange

-(instancetype)initWithLowerAndUpper:(long)lower upper:(long)upper{
    
    self = [super init];
    
    if(self)
    {
        _lower = lower;
        _upper = upper;
    }
        
    return self;
}


@end
