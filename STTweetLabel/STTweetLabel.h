//
//  STTweetLabel.h
//  STTweetLabel
//
//  Created by Sebastien Thiebaud on 09/29/13.
//  Reedited by Zn2studio kangda on 29/2/16
//  Copyright (c) 2013 Sebastien Thiebaud. All rights reserved.
//

#import <UIKit/UIKit.h>
//三种类型@，# ，link
typedef NS_ENUM(NSInteger, STTweetHotWord) {
    STTweetHandle = 0,
    STTweetHashtag,
    STTweetLink
};

@interface STTweetLabel : UILabel


@property (nonatomic, strong) NSArray *validProtocols; //可识别的协议
@property (nonatomic, assign) BOOL leftToRight;     //文字从左到右
@property (nonatomic, assign) BOOL textSelectable;
@property (nonatomic, strong) UIColor *selectionColor;
@property (nonatomic, assign) BOOL isEditable;
@property (nonatomic, copy) void (^detectionBlock)(STTweetHotWord hotWord, NSString *string, NSString *protocol, NSRange range);

- (void)setAttributes:(NSDictionary *)attributes;
- (void)setAttributes:(NSDictionary *)attributes hotWord:(STTweetHotWord)hotWord;

- (NSDictionary *)attributes;
- (NSDictionary *)attributesForHotWord:(STTweetHotWord)hotWord;

- (CGSize)suggestedFrameSizeToFitEntireStringConstrainedToWidth:(CGFloat)width;

@end
