//
//  AnimatedLeaf.m
//
//  Created by AJ Cram on 11/13/13.
//  Copyright (c) 2013 AJ Cram. All rights reserved.
//

#import "AnimatedLeaf.h"
#import "Utilities.h"

@implementation AnimatedLeaf

-(id) initWithFrame:(CGRect)frame andColor:(LeafColor)leafColor
{
    self = [super initWithFrame:frame];
    
    if( self )
    {
        NSString *leafPrefix = [self prefixForLeafColor:leafColor];
        
        const int NUMBER_OF_FRAMES = 61;
        
        NSMutableArray* allImages = [[NSMutableArray alloc]initWithCapacity:NUMBER_OF_FRAMES];
        
        for( int i = 0; i < NUMBER_OF_FRAMES; i++)
        {
            NSString* pathString;

            pathString = [NSString stringWithFormat:@"%@_leaf_a_%05d.png", leafPrefix, i];
            
            NSString *path = [[NSBundle mainBundle] pathForResource:pathString ofType:nil];
            UIImage* image = [[UIImage alloc]initWithContentsOfFile:path];
            [allImages addObject:image];
        }
        
        double rotation = arc4random() % 360;
        
        self.animationImages = allImages;
        self.animationDuration = 8;
        self.animationRepeatCount = 0;
        self.transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(rotation));

        [self startAnimating];
    }

    return self;
}

- (NSString *)prefixForLeafColor:(LeafColor)leafColor {
    NSString *prefix = nil;
    
    switch (leafColor) {
        case LeafColorBlue:
            prefix = @"blue";
            break;
        case LeafColorGreen:
            prefix = @"green";
            break;
        case LeafColorOrange:
            prefix = @"orange";
            break;
        case LeafColorPink:
            prefix = @"pink";
            break;
        case LeafColorRed:
            prefix = @"red";
            break;
        case LeafColorTeal:
            prefix = @"teal";
            break;
    }
    
    return prefix;
}

@end
