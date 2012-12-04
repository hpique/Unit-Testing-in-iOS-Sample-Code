//
//  RMViewControllerTest.m
//  ColorTouch1
//
//  Created by Hermes Pique on 12/4/12.
//  Copyright (c) 2012 Robot Media. All rights reserved.
//

#import "RMViewControllerTest.h"

@implementation RMViewControllerTest {
    RMViewController *_viewController;
}

- (void) setUp
{
    _viewController = [[RMViewController alloc] initWithNibName:@"RMViewController" bundle:nil];
}

// Without OCMock I can only test if it doesn't crash
- (void) testHandleGesture
{
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] init];
    [_viewController handleGesture:gesture];
}

@end
