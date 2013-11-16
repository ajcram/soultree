//
//  RootViewController.m
//  FakeChatter
//
//  Created by AJ Cram on 11/13/13.
//  Copyright (c) 2013 AJ Cram. All rights reserved.
//

#import "RootViewController.h"
#import "AnimatedLeaf.h"
#import <SpriteKit/SpriteKit.h>

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIView* v = [UIView new];
    v.backgroundColor = [UIColor whiteColor];
    self.view = v;

    UILabel* label = [UILabel new];
    [v addSubview:label];
    label.text = @"Philanthrifty";
    label.autoresizingMask = (
                              UIViewAutoresizingFlexibleTopMargin |
                              UIViewAutoresizingFlexibleLeftMargin |
                              UIViewAutoresizingFlexibleBottomMargin |
                              UIViewAutoresizingFlexibleRightMargin
                              );
    [label sizeToFit];
    label.center = CGPointMake(CGRectGetMidX(v.bounds),
                               CGRectGetMidY(v.bounds));
    label.frame = CGRectIntegral(label.frame);
    
    //
    // load sprite
    //
    AnimatedLeaf* leaf = [[AnimatedLeaf alloc]init];
    leaf.frame = CGRectMake(250,50,550,550);
    leaf.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:leaf];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
