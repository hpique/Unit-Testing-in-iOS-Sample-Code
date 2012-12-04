//
//  RMViewController.m
//  ColorTouch1
//
//  Created by Hermes Pique on 12/4/12.
//  Copyright (c) 2012 Robot Media. All rights reserved.
//

#import "RMViewController.h"

@implementation RMViewController

- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer
{
    CGPoint point = [gestureRecognizer locationInView:self.view];
    CGSize size = self.view.frame.size;
    CGFloat width = size.width;
    CGFloat height = size.height;
    CGFloat x = point.x;
    CGFloat y = point.y;
    CGFloat red = x / width;
    CGFloat green = y / height;
    UIColor *color = [UIColor colorWithRed:red green:green blue:0 alpha:1];
    self.view.backgroundColor = color;
}

@end
