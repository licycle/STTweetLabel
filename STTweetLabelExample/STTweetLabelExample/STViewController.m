//
//  STViewController.m
//  STTweetLabel
//
//  Created by Sebastien Thiebaud on 09/29/13.
//  Copyright (c) 2013 Sebastien Thiebaud. All rights reserved.
//

#import "STViewController.h"
#import "STTweetLabel.h"

@interface STViewController ()

@property (nonatomic, weak) IBOutlet UILabel *displayLabel;
@property (nonatomic, weak) IBOutlet STTweetLabel *tweetLabel;
- (IBAction)switchChange:(id)sender;

@end

@implementation STViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.tweetLabel.text = @"Hi. This is a new tool for @话题 Developed by @SebThiebaud for #iPhone #ObjC... and #iOS7 ;-) My GitHub page: https://t.co/pQXDoiYA";
    self.tweetLabel.textAlignment = NSTextAlignmentLeft;
    

    self.tweetLabel.detectionBlock = ^(STTweetHotWord hotWord, NSString *string, NSString *protocol, NSRange range) {

        NSArray *hotWords = @[@"Handle", @"Hashtag", @"Link"];
        _displayLabel.text = [NSString stringWithFormat:@"%@ [%d,%d]: %@%@", hotWords[hotWord], (int)range.location, (int)range.length, string, (protocol != nil) ? [NSString stringWithFormat:@" *%@*", protocol] : @""];
    };
}

- (IBAction)switchChange:(id)sender {
    UISwitch *whichSwitch = (UISwitch *)sender;
    BOOL setting = whichSwitch.isOn;
    self.tweetLabel.isEditable=setting;
}
@end
