//
//  RootViewController.m
//  FakeChatter
//
//  Created by AJ Cram on 11/13/13.
//  Copyright (c) 2013 AJ Cram. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

#import "RootViewController.h"
#import "AnimatedLeaf.h"
#import "UIApplication+AppDimensions.h"
#import "Utilities.h"

@implementation RootViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupParallax];
    
    //    UIView* v = [UIView new];
    //    v.backgroundColor = [UIColor whiteColor];
    //    self.view = v;
    
    //    UILabel* label = [UILabel new];
    //    [self.view addSubview:label];
    //    label.text = @"Philanthrifty";
    //    label.autoresizingMask = (
    //                              UIViewAutoresizingFlexibleTopMargin |
    //                              UIViewAutoresizingFlexibleLeftMargin |
    //                              UIViewAutoresizingFlexibleBottomMargin |
    //                              UIViewAutoresizingFlexibleRightMargin
    //                              );
    //    [label sizeToFit];
    //    label.center = CGPointMake(CGRectGetMidX(self.view.bounds),
    //                               CGRectGetMidY(self.view.bounds));
    //    label.frame = CGRectIntegral(label.frame);
    
    //
    // load sprite
    //
    [self addLeavesForColor:LeafColorBlue];
    [self addLeavesForColor:LeafColorGreen];
    [self addLeavesForColor:LeafColorOrange];
    [self addLeavesForColor:LeafColorPink];
    [self addLeavesForColor:LeafColorRed];
    [self addLeavesForColor:LeafColorTeal];
}

#pragma mark - Leaves

- (void)addLeavesForColor:(LeafColor)color {
    CGRect flowerFrame = CGRectMake(0, 0, 250, 250);
    
    double randomTheta = arc4random() % 360;
    double randomRadius = (arc4random() % (int) self.tree.frame.size.width) / 4;
    
    double xOffset = self.tree.center.x + cos(DEGREES_TO_RADIANS(randomTheta)) * randomRadius;
    double yOffset = self.tree.center.y + sin(DEGREES_TO_RADIANS(randomTheta)) * randomRadius;
    
    CGPoint origin = CGPointMake(xOffset, yOffset);
    flowerFrame.origin = origin;
    
    AnimatedLeaf *leaf = [[AnimatedLeaf alloc] initWithFrame:flowerFrame andColor:color];
    
    [self.view addSubview:leaf];
}

#pragma mark - Parallax

- (void)setupParallax {
    CGSize curSize = [UIApplication currentSize];
    CGRect backgroundRect;
    
    double xOffset = -(self.background.frame.size.width - curSize.width) / 2;
    double yOffset = -(self.background.frame.size.height - curSize.height) / 2;
    CGPoint origin = CGPointMake(xOffset, yOffset);
    CGSize size = self.background.frame.size;
    backgroundRect.origin = origin;
    backgroundRect.size = size;
    
    self.originalBackgroundFrame = backgroundRect;
    
    self.originalTreeFrame = self.tree.frame;
    
    NSOperationQueue *motionQueue = [[NSOperationQueue alloc] init];
    
    self.motionManager = [[CMMotionManager alloc] init];
    
    self.motionManager.deviceMotionUpdateInterval = 1.0/20.0;
    
    [self.motionManager startDeviceMotionUpdatesToQueue:motionQueue
                                            withHandler:^(CMDeviceMotion *motion, NSError *error) {
                                                CMAttitude *attitude = motion.attitude;
                                                
                                                double dR = RADIANS_TO_DEGREES(attitude.roll);
                                                double dP = RADIANS_TO_DEGREES(attitude.pitch);
                                                
                                                double clampedRoll = fmin(fmax(dR, -60), 0);
                                                double clampedPitch = fmin(fmax(dP, -30), 30);
                                                
                                                CGRect curBackgroundFrame = self.originalBackgroundFrame;
                                                curBackgroundFrame.origin.y += clampedRoll + 30;
                                                curBackgroundFrame.origin.x += clampedPitch / -1;
                                                
                                                CGRect curTreeFrame = self.originalTreeFrame;
                                                curTreeFrame.origin.y += clampedRoll / -8;
                                                curTreeFrame.origin.x += clampedPitch / 2;
                                                
                                                dispatch_async(dispatch_get_main_queue(), ^{
                                                    [UIView animateWithDuration:0
                                                                     animations:^{
                                                                         self.background.frame = curBackgroundFrame;
                                                                         self.tree.frame = curTreeFrame;
                                                                     }];
                                                });
                                            }];
}

@end
