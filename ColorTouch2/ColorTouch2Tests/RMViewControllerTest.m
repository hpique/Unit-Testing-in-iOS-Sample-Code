//
//  RMViewControllerTest.m
//  ColorTouch2
//
//  Created by Hermes Pique on 12/4/12.
//  Copyright (c) 2012 Robot Media. All rights reserved.
//

#import "RMViewControllerTest.h"
#import <OCMock/OCMock.h>

@implementation RMViewControllerTest {
    RMViewController *_viewController;
}

- (void) setUp
{
    _viewController = [[RMViewController alloc] initWithNibName:@"RMViewController" bundle:nil];
}

- (void) testColorFromPointAndSize_PointTopLeftSizeiPhoneLandscapeResultBlack
{
    CGSize size = CGSizeMake(320, 480);
    CGPoint point = CGPointZero;
    UIColor *expectedColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    UIColor *color = [_viewController colorFromPoint:point andSize:size];
    [self assertEqualsColor:expectedColor toColor:color];
}

- (void) testColorFromPointAndSize_PointTopRightSizeiPhoneLandscapeResultRed
{
    CGSize size = CGSizeMake(320, 480);
    CGPoint point = CGPointMake(size.width, 0);
    UIColor *expectedColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
    UIColor *color = [_viewController colorFromPoint:point andSize:size];
    [self assertEqualsColor:expectedColor toColor:color];
}

- (void) testColorFromPointAndSize_PointBottomLeftSizeiPhoneLandscapeResultGreen
{
    CGSize size = CGSizeMake(320, 480);
    CGPoint point = CGPointMake(0, size.height);
    UIColor *expectedColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
    UIColor *color = [_viewController colorFromPoint:point andSize:size];
    [self assertEqualsColor:expectedColor toColor:color];
}

- (void) testColorFromPointAndSize_PointBottomRightSizeiPhoneLandscapeResultYellow
{
    CGSize size = CGSizeMake(320, 480);
    CGPoint point = CGPointMake(size.width, size.height);
    UIColor *expectedColor = [UIColor colorWithRed:1 green:1 blue:0 alpha:1];
    UIColor *color = [_viewController colorFromPoint:point andSize:size];
    [self assertEqualsColor:expectedColor toColor:color];
}

- (void) testColorFromPointAndSize_PointCenterSizeiPhoneLandscape
{
    CGSize size = CGSizeMake(320, 480);
    CGPoint point = CGPointMake(size.width / 2, size.height / 2);
    UIColor *expectedColor = [UIColor colorWithRed:0.5 green:0.5 blue:0 alpha:1];
    UIColor *color = [_viewController colorFromPoint:point andSize:size];
    [self assertEqualsColor:expectedColor toColor:color];
}

- (void) testColorFromPointAndSize_SizeWidthZero
{
    CGSize size = CGSizeMake(0, 480);
    CGPoint point = CGPointZero;
    UIColor *color = [_viewController colorFromPoint:point andSize:size];
    STAssertNil(color, nil);
}

- (void) testColorFromPointAndSize_SizeHeightZero
{
    CGSize size = CGSizeMake(320, 0);
    CGPoint point = CGPointZero;
    UIColor *color = [_viewController colorFromPoint:point andSize:size];
    STAssertNil(color, nil);
}

- (void) testColorFromPointAndSize_SizeZero
{
    // Prepare input
    CGSize size = CGSizeZero;
    CGPoint point = CGPointZero;

    // Do something
    UIColor *color = [_viewController colorFromPoint:point andSize:size];
    
    // Validate output
    STAssertNil(color, @"Color must be nil when size is zero");
}

- (void) testHandleGesture
{
    // Prepare input and state
    id viewMock = [OCMockObject partialMockForObject:_viewController.view];
    CGRect viewFrame = CGRectMake(0, 0, 480, 320);
    [[[viewMock stub] andReturnValue:OCMOCK_VALUE(viewFrame)] frame];
    _viewController.view = viewMock;

    UIGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] init];
    id gestureMock = [OCMockObject partialMockForObject:gesture];
    CGPoint gesturePoint = CGPointMake(viewFrame.size.width / 2,
                                       viewFrame.size.height / 2);
    [[[gestureMock stub]
      andReturnValue:OCMOCK_VALUE(gesturePoint)] locationInView:[OCMArg any]];
    
    // Do something that changes state
    [_viewController handleGesture:gestureMock];

    // Validate state
    UIColor *expectedColor = [UIColor colorWithRed:0.5 green:0.5 blue:0 alpha:1];
    UIColor *color = _viewController.view.backgroundColor;
    [self assertEqualsColor:expectedColor toColor:color];
}

#pragma mark - Helper

- (void) assertEqualsColor:(UIColor*)colorA toColor:(UIColor*)colorB
{
    CGFloat rA, gA, bA, aA;
    [colorA getRed:&rA green:&gA blue:&bA alpha:&aA];
    CGFloat rB, gB, bB, aB;
    [colorB getRed:&rB green:&gB blue:&bB alpha:&aB];
    
    STAssertEquals(rA, rB, @"%@ not equals to %@", colorA, colorB);
    STAssertEquals(gA, gB, @"%@ not equals to %@", colorA, colorB);
    STAssertEquals(bA, bB, @"%@ not equals to %@", colorA, colorB);
    STAssertEquals(aA, aB, @"%@ not equals to %@", colorA, colorB);
}

@end