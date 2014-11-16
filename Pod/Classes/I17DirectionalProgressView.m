//
//  I17DirectionalProgressView.m
//  I17DirectionalProgressView
//
//  Created by Ferhat Ozduran on 11/16/2014.
//  Copyright (c) 2014 Ferhat Ozduran. All rights reserved.
//

#import "I17DirectionalProgressView.h"



@interface I17DirectionalProgressView ()

@property (nonatomic, strong) UIProgressView *progressView;
@property (nonatomic, assign, readwrite) I17DirectionalProgressViewDirection direction;

@end



@implementation I17DirectionalProgressView

- (instancetype)init
{
    return [self initWithDirection:I17DirectionalProgressViewDirectionLeftToRight
                             style:UIProgressViewStyleDefault];
}

- (instancetype)initWithDirection:(I17DirectionalProgressViewDirection)direction
                            style:(UIProgressViewStyle)style
{
    self = [super init];
    
    if (!self) {
        return nil;
    }
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    _progressView = [UIProgressView new];
    _progressView.translatesAutoresizingMaskIntoConstraints = NO;
    _progressView.progressViewStyle = style;
    [self addSubview:_progressView];

    _direction = direction;
    
    switch (direction) {
        case I17DirectionalProgressViewDirectionLeftToRight:
            break;
            
        case I17DirectionalProgressViewDirectionRightToLeft:
            _progressView.transform = CGAffineTransformMakeRotation( M_PI * 1.0 );
            break;
            
        case I17DirectionalProgressViewDirectionTopToBottom:
            _progressView.transform = CGAffineTransformMakeRotation( M_PI * 0.5 );
            break;
            
        case I17DirectionalProgressViewDirectionBottomToUp:
            _progressView.transform = CGAffineTransformMakeRotation( M_PI * 1.5 );
            break;
    }
    
    CGFloat centerHorizontalConstant = 0.0;
    CGFloat centerVerticalConstant = 0.0;
    CGFloat heightConstant = 0.0;
    CGFloat widthConstant = 0.0;
    
    if (style == UIProgressViewStyleBar) {
        if ([[UIDevice currentDevice].systemVersion floatValue] < 8.0 &&
            (direction == I17DirectionalProgressViewDirectionTopToBottom || direction == I17DirectionalProgressViewDirectionBottomToUp)) {
            
            widthConstant = -1.0;
            centerHorizontalConstant = -0.5;
        }
        else {
            heightConstant = -1.0;
            centerVerticalConstant = -0.5;
        }
    }
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_progressView
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0
                                                      constant:centerHorizontalConstant]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_progressView
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1.0
                                                      constant:centerVerticalConstant]];

    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0 &&
        (direction == I17DirectionalProgressViewDirectionTopToBottom || direction == I17DirectionalProgressViewDirectionBottomToUp)) {
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_progressView
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeHeight
                                                        multiplier:1.0
                                                          constant:widthConstant]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_progressView
                                                         attribute:NSLayoutAttributeHeight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:1.0
                                                          constant:heightConstant]];
    }
    else {
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_progressView
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:1.0
                                                          constant:widthConstant]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_progressView
                                                         attribute:NSLayoutAttributeHeight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeHeight
                                                        multiplier:1.0
                                                          constant:heightConstant]];
    }
    
    return self;
}

#pragma mark - Custom Getter/Setter

- (float)progress
{
    return self.progressView.progress;
}

- (void)setProgress:(float)progress
{
    self.progressView.progress = progress;
}

- (UIColor *)progressTintColor
{
    return self.progressView.progressTintColor;
}

- (void)setProgressTintColor:(UIColor *)progressTintColor
{
    self.progressView.progressTintColor = progressTintColor;
}

- (UIColor *)trackTintColor
{
    return self.progressView.trackTintColor;
}

- (void)setTrackTintColor:(UIColor *)trackTintColor
{
    self.progressView.trackTintColor = trackTintColor;
}

- (UIImage *)progressImage
{
    return self.progressView.progressImage;
}

- (void)setProgressImage:(UIImage *)progressImage
{
    self.progressView.progressImage = progressImage;
}

- (UIImage *)trackImage
{
    return self.progressView.trackImage;
}

- (void)setTrackImage:(UIImage *)trackImage
{
    self.progressView.trackImage = trackImage;
}

#pragma mark - Public Methods

- (void)setProgress:(float)progress
           animated:(BOOL)animated
{
    [self.progressView setProgress:progress
                          animated:animated];
    
    if (self.progress == 1.0) {
        NSLog(@"self.frame: %.0f,%.0f", self.frame.size.width, self.frame.size.height);
        NSLog(@"self.progressView.frame: %.0f,%.0f", self.progressView.frame.size.width, self.progressView.frame.size.height);
    }
}

@end
