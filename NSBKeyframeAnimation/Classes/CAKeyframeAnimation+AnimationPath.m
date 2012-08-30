//
//  CAKeyframeAnimation+AnimationPath.m
//  NSBKeyframeAnimation
//
//  Created by Nacho Soto on 8/6/12.
//  Copyright (c) 2012 Nacho Soto. All rights reserved.
//

#import "CAKeyframeAnimation+AnimationPath.h"

@implementation CAKeyframeAnimation (AnimationPath)

- (UIBezierPath *)animationPath
{
    NSArray *values = self.values;
    
    const double numValues = values.count;
    double minValue = HUGE_VALF, maxValue = 0;
    
    for (NSNumber *number in values)
    {
        const double v = [number doubleValue];
        
        if (v < minValue)
            minValue = v;
        else if (v > maxValue)
            maxValue = v;
    }
    
    // normalize everything to [0, 1]
    const double difference = maxValue - minValue,
                 xDelta = 1 / numValues;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    NSUInteger i = 0;
    for (NSNumber *number in values)
    {
        const double v = [number doubleValue];
        
        CGPoint p = CGPointMake(i * xDelta, (v - minValue) / difference);
        
        if (i == 0)
            [path moveToPoint:p];
        else
            [path addLineToPoint:p];
        
        i++;
    }
    
    return path;
}

@end
