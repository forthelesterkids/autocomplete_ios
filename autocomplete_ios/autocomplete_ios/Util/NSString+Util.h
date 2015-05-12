//
//  NSObject+NSString_Util.h
//  autocomplete_ios
//
//  Created by Christopher Lester on 5/11/15.
//  Copyright (c) 2015 IOS_SDK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Util)

-(long)indexOf:(NSString *)text;
-(long)indexOf:(NSString *)compareText fromPosition:(long)fromRange;
+(NSString *)randomStringWithLength:(int)len;

@end
