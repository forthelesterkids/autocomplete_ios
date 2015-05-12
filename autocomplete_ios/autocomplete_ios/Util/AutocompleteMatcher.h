//
//  AutocompleteMatcher.h
//  autocomplete_ios
//
//  Created by Christopher Lester on 5/11/15.
//  Copyright (c) 2015 IOS_SDK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AutocompleteItem.h"
#import "NSString+Util.h"

@interface AutocompleteMatcher : NSObject

-(instancetype)initWithMatchingStrings:(NSString *)masterCompareString matchString:(NSString *)masterMatchString;
-(AutocompleteItem *)matchStrings;

@property (nonatomic, copy) NSString *masterCompareString;
@property (nonatomic, copy) NSString *masterMatchString;
@property (nonatomic, copy) AutocompleteItem *item;

@end
