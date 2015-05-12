//
//  SelectedRange.h
//  autocomplete_ios
//
//  Created by Christopher Lester on 5/11/15.
//  Copyright (c) 2015 IOS_SDK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SelectedRange : NSObject

-(instancetype)initWithLowerAndUpper:(long)lower upper:(long)upper;

@property (nonatomic) long lower;
@property (nonatomic) long upper;

@end
