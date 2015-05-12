//
//  NSObject+NSString_Util.m
//  autocomplete_ios
//
//  Created by Christopher Lester on 5/11/15.
//  Copyright (c) 2015 IOS_SDK. All rights reserved.
//

#import "NSString+Util.h"

NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

@implementation NSString (Util)

- (long) indexOf:(NSString *)text
{
    NSRange range = [self rangeOfString:text];
    if (range.length != NSNotFound)
    {
        return range.location;
    }
    else
    {
        return -1;
    }
}

-(long)indexOf:(NSString *)compareText fromPosition:(long)fromRange
{
    unichar charAtIndex = [compareText characterAtIndex:0];
    NSUInteger length = [self length];
    unichar buffer[length];
    
    [self getCharacters:buffer range:NSMakeRange(0, length)];
    
    for (NSUInteger i = fromRange; i < length; i++)
    {
        if(i >= fromRange)
        {
            if(charAtIndex == buffer[i])
            {
                return i;
            }
        }
    }
    
    return -1;
}

+(NSString *)randomStringWithLength:(int)len
{
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (int i=0; i<len; i++)
    {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length])]];
    }
    
    return randomString;
}

@end
