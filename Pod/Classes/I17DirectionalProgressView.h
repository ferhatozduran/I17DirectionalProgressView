//
//  I17DirectionalProgressView.h
//  I17DirectionalProgressView
//
//  Created by Ferhat Ozduran on 11/16/2014.
//  Copyright (c) 2014 Ferhat Ozduran. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, I17DirectionalProgressViewDirection) {
    I17DirectionalProgressViewDirectionLeftToRight,
    I17DirectionalProgressViewDirectionRightToLeft,
    I17DirectionalProgressViewDirectionTopToBottom,
    I17DirectionalProgressViewDirectionBottomToUp
};

@interface I17DirectionalProgressView : UIView

@property (nonatomic, assign, readonly) I17DirectionalProgressViewDirection direction;
@property (nonatomic, assign) float progress;
@property (nonatomic, strong) UIColor *progressTintColor;
@property (nonatomic, strong) UIColor *trackTintColor;
@property (nonatomic, strong) UIImage *progressImage;
@property (nonatomic, strong) UIImage *trackImage;

- (instancetype)initWithDirection:(I17DirectionalProgressViewDirection)direction
                            style:(UIProgressViewStyle)style;
- (void)setProgress:(float)progress
           animated:(BOOL)animated;

@end
