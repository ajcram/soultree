//
//  RootViewController.h
//  FakeChatter
//
//  Created by AJ Cram on 11/13/13.
//  Copyright (c) 2013 AJ Cram. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>
#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *background;
@property (weak, nonatomic) IBOutlet UIImageView *tree;

@property (strong, nonatomic) CMMotionManager *motionManager;

@property (assign) CGRect originalBackgroundFrame;
@property (assign) CGRect originalTreeFrame;

@end
