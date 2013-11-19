//
//  AnimatedLeaf.h
//  FakeChatter
//
//  Created by AJ Cram on 11/13/13.
//  Copyright (c) 2013 AJ Cram. All rights reserved.
//

typedef NS_ENUM(NSUInteger, LeafColor) {
    LeafColorBlue,
    LeafColorGreen,
    LeafColorOrange,
    LeafColorPink,
    LeafColorRed,
    LeafColorTeal
};

@interface AnimatedLeaf : UIImageView

-(id) initWithFrame:(CGRect)frame andColor:(LeafColor)leafColor;

@end
