//
//  AnimatedLeaf.m
//
//  Created by AJ Cram on 11/13/13.
//  Copyright (c) 2013 AJ Cram. All rights reserved.
//

#import "AnimatedLeaf.h"

@implementation AnimatedLeaf
{

}

-(id) init
{
    self = [super init];
    if( self )
    {
        const int NUMBER_OF_FRAMES = 61;
        
        NSMutableArray* allImages = [[NSMutableArray alloc]initWithCapacity:NUMBER_OF_FRAMES];
        
        for( int i = 0; i < NUMBER_OF_FRAMES; i++)
        {
            NSString* pathString;

            pathString = [NSString stringWithFormat:@"blue_leaf_a_%05d.png", i];
            
            NSString *path = [[NSBundle mainBundle] pathForResource:pathString ofType:nil];
            UIImage* image = [[UIImage alloc]initWithContentsOfFile:path];
            [allImages addObject:image];
        }
        
        self.animationImages = allImages;
        self.animationDuration = 8;
        self.animationRepeatCount = 0;
        [self startAnimating];
    }

    return self;
}


@end
