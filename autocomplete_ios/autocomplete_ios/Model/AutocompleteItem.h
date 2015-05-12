//
//  AutocompleteItem.h
//  autocomplete_ios
//
//  Created by Christopher Lester on 5/11/15.
//  Copyright (c) 2015 IOS_SDK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AutocompleteItem : NSObject

-(instancetype)initWithAutocompleteTerm:(NSString *)autocompleteTerm selectedRanges:(NSMutableArray *)selectedRanges;

@property (nonatomic, copy) NSString *autocompleteTerm;
@property (nonatomic, strong) NSMutableArray *selectedRanges;
@property (nonatomic, strong) NSAttributedString *spannableRange;

@end
