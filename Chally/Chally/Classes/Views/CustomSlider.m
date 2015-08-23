//
//  CustomSlider.m
//  Chally
//
//  Created by Vardan Abrahamyan on 7/19/15.
//
//

#import "CustomSlider.h"

@implementation CustomSlider

- (CGRect)trackRectForBounds:(CGRect)bounds{
    
    CGRect customBounds = CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.width, 7.0);
    [super trackRectForBounds:customBounds];

    return customBounds;
}

@end
