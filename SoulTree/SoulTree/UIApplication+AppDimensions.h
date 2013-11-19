//
//  UIApplication+AppDimensions.h
//  CXParallaxImage
//
//  Created by Richard Puckett on 11/15/13.
//  Copyright (c) 2013 Concur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (AppDimensions)

+(CGSize) currentSize;
+(CGSize) sizeInOrientation:(UIInterfaceOrientation)orientation;

@end
