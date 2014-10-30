//
//  ViewController.m
//  Objective-C 101
//
//  Created by Tyron Allen on 9/23/14.
//  Copyright (c) 2014 Tyron Allen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong) NSArray *lightGrayViewConstraints;
@property

@end

@implementation ViewController

-(void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.view setBackgroundColor:[UIColor orangeColor]];
    
    [[self view] addSubview:[self lightGreyView]];
    [[self view ] add Con]
}

- (UIView *)lightGreyView
{
    if(!_lightGreyView){
        _lightGreyView = [[UIView alloc] initWithFrame:CGRectZero];
        [_lightGreyView setTranslatesAutoresizingMaskIntoConstraints:NO];
        _lightGreyView.backgroundColor = UIColor.lightGrayColor;
    }
    
    return _lightGreyView;
}

-(NSArray *)lightGrayViewConstraints{
    if(!_lightGrayViewConstraints){
        _lightGrayViewConstraints = @[
                                      [NSLayoutConstraint constraintWithItem:_lightGrayViewConstraints
                                                                   attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f],
                                      [NSLayoutConstraint constraintWithItem:_lightGrayViewConstraints
                                                                   attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0f constant:0.0f],
                                      [NSLayoutConstraint constraintWithItem:_lightGrayViewConstraints
                                                                   attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f],
                                      [NSLayoutConstraint constraintWithItem:_lightGrayViewConstraints
                                                                   attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0.0f]];
                                      
    }
                    return _lightGrayViewConstraints;
    
}

-(UIButton *)submitButton
{
    if (!_submitButton){
        _submitButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [_submitButton setTranslatesAutoresizingMaskIntoConstraints:FALSE];
        [_submitButton setTitle:@"submit" forState:UIControlStateNormal];
    }
    return _submitButton;
}

@end
