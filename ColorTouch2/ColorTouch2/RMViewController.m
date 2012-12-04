//
//  RMViewController.m
//  ColorTouch2
//
//  Created by Hermes Pique on 12/4/12.
//  Copyright (c) 2012 Robot Media. All rights reserved.
//

#import "RMViewController.h"

@implementation RMViewController

- (UIColor*) colorFromPoint:(CGPoint)point andSize:(CGSize)size
{
    CGFloat width = size.width;
    if (width == 0) return nil;

    CGFloat height = size.height;
    if (height == 0) return nil;
    
    CGFloat x = point.x;
    CGFloat y = point.y;
    CGFloat red = x / width;
    CGFloat green = y / height;
    UIColor *color = [UIColor colorWithRed:red green:green blue:0 alpha:1];
    return color;
}

- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer
{
    CGPoint point = [gestureRecognizer locationInView:self.view];
    CGSize size = self.view.frame.size;
    UIColor *color = [self colorFromPoint:point andSize:size];
    self.view.backgroundColor = color;
}

@end
