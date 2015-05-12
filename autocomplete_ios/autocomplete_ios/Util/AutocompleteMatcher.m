//
//  AutocompleteMatcher.m
//  autocomplete_ios
//
//  Created by Christopher Lester on 5/11/15.
//  Copyright (c) 2015 IOS_SDK. All rights reserved.
//

#import "AutocompleteMatcher.h"
#import "SelectedRange.h"

@implementation AutocompleteMatcher

-(instancetype)initWithMatchingStrings:(NSString *)masterCompareString matchString:(NSString *)masterMatchString
{
    self = [super init];
    
    if(self)
    {
        _masterMatchString = masterMatchString;
        _masterCompareString = masterCompareString;
        _item = [[AutocompleteItem alloc] initWithAutocompleteTerm:masterCompareString selectedRanges:[NSMutableArray new]];
    }
    return self;
}

-(AutocompleteItem *)matchStrings{
    return [self stringsMatch:self.masterCompareString matchTerm:self.masterMatchString];
}

-(AutocompleteItem *)stringsMatch:(NSString *)compareString matchTerm:(NSString *)matchTerm{
    
    if(matchTerm.length == 0 || compareString.length == 0){
        return nil;
    }
    long indexOf = [[compareString lowercaseString] indexOf:[matchTerm substringWithRange:NSMakeRange(0,1)]];
    if(indexOf != 0){
        return nil;
    }
    else {
        return [self matchIndexOf:self.masterCompareString matchTerm:self.masterMatchString];
    }
    return nil;

}

-(AutocompleteItem *)matchIndexOf:(NSString *)compareString matchTerm:(NSString *)matchTerm{
    long currentIndexOf = 0;
    
    for(int i = 0; i < matchTerm.length; i++){
        unichar charAtIndex = [matchTerm characterAtIndex:i];
        NSString *subString = [NSString stringWithCharacters:&charAtIndex length:1];
        long indexOf = [[compareString lowercaseString] indexOf:[subString lowercaseString] fromPosition:currentIndexOf];
        if(indexOf != -1){
            long movingIndex = indexOf + 1;
            [self appendSelectedRange:indexOf upper:movingIndex];
            currentIndexOf = movingIndex;
        }
        else {
            return nil;
        }
    }
    return self.item;
}

-(void)appendSelectedRange:(long)lower upper:(long)upper{
    SelectedRange *range = [[SelectedRange alloc] initWithLowerAndUpper:lower upper:upper];
    [[self.item selectedRanges] addObject:range];
}

@end
