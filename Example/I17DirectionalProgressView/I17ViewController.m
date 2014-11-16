//
//  I17ViewController.m
//  I17DirectionalProgressView
//
//  Created by Ferhat Ozduran on 11/16/2014.
//  Copyright (c) 2014 Ferhat Ozduran. All rights reserved.
//

#import "I17ViewController.h"
#import <I17DirectionalProgressView/I17DirectionalProgressView.h>


@interface I17ViewController ()

@property (nonatomic, strong) I17DirectionalProgressView *progressView;
@property (nonatomic, strong) I17DirectionalProgressView *progressView2;
@property (nonatomic, strong) I17DirectionalProgressView *progressView3;
@property (nonatomic, strong) I17DirectionalProgressView *progressView4;
@property (nonatomic, strong) UIProgressView *regularProgressView;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UIButton *magicButton;

@end



@implementation I17ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIProgressViewStyle progressViewStyle = UIProgressViewStyleBar;
    
    self.progressView = [[I17DirectionalProgressView alloc] initWithDirection:I17DirectionalProgressViewDirectionLeftToRight
                                                             style:progressViewStyle];
    self.progressView.translatesAutoresizingMaskIntoConstraints = NO;
    self.progressView.backgroundColor = [UIColor yellowColor];
//    self.progressView.progressTintColor = [UIColor greenColor];
//    self.progressView.trackTintColor = [UIColor redColor];
    [self.view addSubview:self.progressView];
    
    self.progressView2 = [[I17DirectionalProgressView alloc] initWithDirection:I17DirectionalProgressViewDirectionRightToLeft
                                                              style:progressViewStyle];
    self.progressView2.translatesAutoresizingMaskIntoConstraints = NO;
    self.progressView2.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.progressView2];
    
    self.progressView3 = [[I17DirectionalProgressView alloc] initWithDirection:I17DirectionalProgressViewDirectionTopToBottom
                                                              style:progressViewStyle];
    self.progressView3.translatesAutoresizingMaskIntoConstraints = NO;
    self.progressView3.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:self.progressView3];
    
    self.progressView4 = [[I17DirectionalProgressView alloc] initWithDirection:I17DirectionalProgressViewDirectionBottomToUp
                                                              style:progressViewStyle];
    self.progressView4.translatesAutoresizingMaskIntoConstraints = NO;
    self.progressView4.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.progressView4];
    
    self.regularProgressView = [UIProgressView new];
    self.regularProgressView.translatesAutoresizingMaskIntoConstraints = NO;
    self.regularProgressView.progressViewStyle = progressViewStyle;
    self.regularProgressView.backgroundColor = [UIColor whiteColor];
    self.regularProgressView.trackTintColor = [UIColor blueColor];
    [self.view addSubview:self.regularProgressView];
    
    self.magicButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.magicButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.magicButton addTarget:self
                         action:@selector(onMagicButtonTouchUp:)
               forControlEvents:UIControlEventTouchUpInside];
    [self.magicButton setTitle:@"Magic" forState:UIControlStateNormal];
    [self.view addSubview:self.magicButton];
    
    // _progressView
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(40)-[_progressView(100)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_progressView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_progressView(5)]-200-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_progressView)]];
    
    // _progressView2
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_progressView2(100)]-40-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_progressView2)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_progressView2(5)]-200-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_progressView2)]];
    
    // _progressView3
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(100)-[_progressView3(5)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_progressView3)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_progressView3(100)]-50-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_progressView3)]];
    
    // _progressView4
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_progressView4(5)]-(100)-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_progressView4)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_progressView4(100)]-50-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_progressView4)]];
    
    // _progressView
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_regularProgressView(100)]-110-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_regularProgressView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_regularProgressView(5)]-300-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_regularProgressView)]];
    
    // Position magicButton
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_magicButton
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_magicButton]-10-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_magicButton)]];
}

- (void)onMagicButtonTouchUp:(id)sender
{
    self.progressView.progress = 0.0;
    self.progressView2.progress = 0.0;
    self.progressView3.progress = 0.0;
    self.progressView4.progress = 0.0;
    self.regularProgressView.progress = 0.0;
    
    [self.timer invalidate];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.2
                                                  target:self
                                                selector:@selector(onTimerFired:)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)onTimerFired:(NSTimer *)timer
{
    CGFloat progress = self.progressView.progress;
    progress += 0.1;
    
    [self.progressView setProgress:progress animated:YES];
    [self.progressView2 setProgress:progress animated:YES];
    [self.progressView3 setProgress:progress animated:YES];
    [self.progressView4 setProgress:progress animated:YES];
    [self.regularProgressView setProgress:progress animated:YES];
    
    if (self.progressView.progress >= 1.0) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

@end
