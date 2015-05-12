//
//  AutocompleteItem.m
//  autocomplete_ios
//
//  Created by Christopher Lester on 5/11/15.
//  Copyright (c) 2015 IOS_SDK. All rights reserved.
//

#import "AutocompleteItem.h"

@implementation AutocompleteItem

-(instancetype)initWithAutocompleteTerm:(NSString *)autocompleteTerm selectedRanges:(NSMutableArray *)selectedRanges{
    self = [super init];
    if(self)
    {
        _autocompleteTerm = autocompleteTerm;
        _selectedRanges = selectedRanges;
    }
    return self;
}


@end
