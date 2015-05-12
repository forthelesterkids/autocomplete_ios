//
//  ViewController.m
//  autocomplete_ios
//
//  Created by Christopher Lester on 5/11/15.
//  Copyright (c) 2015 IOS_SDK. All rights reserved.
//

#import "ACViewController.h"
#import "AutocompleteMatcher.h"
#import "SelectedRange.h"

@interface ACViewController ()

@property (weak, nonatomic) IBOutlet UITableView *matchTextTableView;
@property (nonatomic, strong) NSMutableArray *matchedItems;
@property (nonatomic, strong) NSMutableArray *dataSource;


@end

@implementation ACViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self generateRandomStrings];
}

- (void)generateRandomStrings
{
    for(int i =0; i < 100000; i++)
    {
        NSString *random = [NSString randomStringWithLength:30];
        [self.dataSource addObject:random];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(NSMutableArray *)dataSource
{
    if(!_dataSource)
    {
        _dataSource = [NSMutableArray new];
    }
    
    return _dataSource;
}

-(NSMutableArray *)matchedItems
{
    if(!_matchedItems)
    {
        _matchedItems = [NSMutableArray new];
    }
    
    return _matchedItems;
}
- (IBAction)matchStrings:(UITextField *)sender
{
    NSString *stringToMatch = sender.text;

    [self.matchedItems removeAllObjects];
    for (NSString *matchString in self.dataSource)
    {
        AutocompleteMatcher *matcher = [[AutocompleteMatcher alloc] initWithMatchingStrings:matchString matchString:stringToMatch];
        AutocompleteItem *item = [matcher matchStrings];
        if(item)
        {
            [self.matchedItems addObject:item];
        }
    }
    
    [self.matchTextTableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.matchedItems count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MatchedIdentifier = @"MatchedIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MatchedIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:MatchedIdentifier];
    }
    AutocompleteItem *item = [self.matchedItems objectAtIndex:indexPath.row];
    cell.textLabel.attributedText = [self formatSpannableText:item];
    return cell;
}

-(NSAttributedString *)formatSpannableText:(AutocompleteItem *)spannable
{
    
    NSMutableAttributedString * string = [[NSMutableAttributedString alloc] initWithString:spannable.autocompleteTerm];
    for(SelectedRange *range in spannable.selectedRanges){
        [string addAttribute:NSBackgroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(range.lower,1)];
    
    }
    return string;
}

@end
