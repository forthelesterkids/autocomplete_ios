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
@property (nonatomic, strong) NSArray *matchedItems;
@property (nonatomic, strong) NSMutableArray *dataSource;


@end

@implementation ACViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self generateRandomStrings];
}

- (void)generateRandomStrings{
    for(int i =0; i < 100000; i++){
        NSString *random = [NSString randomStringWithLength:30];
        [self.dataSource addObject:random];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSMutableArray *)dataSource{
    if(!_dataSource){
        _dataSource = [NSMutableArray new];
    }
    
    return _dataSource;
}
- (IBAction)matchStrings:(UITextField *)sender {
    NSString *stringToMatch = sender.text;
    NSDate *startDate = [NSDate new];
    for (NSString *matchString in self.dataSource)
    {
        AutocompleteMatcher *matcher = [[AutocompleteMatcher alloc] initWithMatchingStrings:matchString matchString:stringToMatch];
        AutocompleteItem *item = [matcher matchStrings];
        if(item){
            //NSLog(@"Strings match %@", item.autocompleteTerm);
        }
    }
    double timePassed_ms = [startDate timeIntervalSinceNow] * -1000.0;
    
    NSLog(@"Total performace %f", timePassed_ms);
}

- (IBAction)matchText:(UITextField *)sender {
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_matchedItems count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *MyIdentifier = @"MyIdentifier";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
//    
//    if (cell == nil)
//    {
//        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
//                                       reuseIdentifier:MyIdentifier] autorelease];
//    }
//    [cell.imageView setImageWithURL:[NSURL URLWithString:@"http://example.com/image.jpg"]
//                   placeholderImage:[UIImage imageNamed:@"placeholder"]];
//    cell.textLabel.text = @"My Text";
//    return cell;
    return nil;
}

@end
