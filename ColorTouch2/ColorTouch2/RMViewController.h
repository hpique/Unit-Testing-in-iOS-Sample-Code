//
//  RMViewController.h
//  ColorTouch2
//
//  Created by Hermes Pique on 12/4/12.
//  Copyright (c) 2012 Robot Media. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RMViewController : UIViewController

- (UIColor*)colorFromPoint:(CGPoint)point andSize:(CGSize)size;

- (IBAction)handleGesture:(UIGestureRecognizer *)gestureRecognizer;

@end
