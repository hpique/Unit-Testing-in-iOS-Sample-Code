//
//  RMAppDelegate.m
//  ColorTouch2
//
//  Created by Hermes Pique on 12/4/12.
//  Copyright (c) 2012 Robot Media. All rights reserved.
//

#import "RMAppDelegate.h"

#import "RMViewController.h"

@implementation RMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[RMViewController alloc] initWithNibName:@"RMViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
