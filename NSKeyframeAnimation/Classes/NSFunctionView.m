//
//  NSFunctionView.m
//  NSKeyframeAnimation
//
//  Created by Nacho Soto on 8/6/12.
//  Copyright (c) 2012 Nacho Soto. All rights reserved.
//

#import "NSFunctionView.h"

#import "CAKeyframeAnimation+AnimationPath.h"

#define kLineColor [UIColor blackColor].CGColor
#define kLineWidth (2.0f)

#define kPadding (40.0f)

@implementation NSFunctionView

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        
    }
    
    return self;
}

- (void)dealloc
{
    [_animation release];
    
    [super dealloc];
}

- (void)setAnimation:(CAKeyframeAnimation *)animation
{
    if (_animation != animation)
    {
        [_animation release];
        _animation = [animation retain];
        
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *path = [self.animation animationPath];
    
    const CGFloat horizontalScale = self.frame.size.width - kPadding,
                  verticalScale =self.frame.size.height - kPadding;
    
    [path applyTransform:CGAffineTransformMakeScale(horizontalScale, verticalScale)];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(ctx);
    {
        CGContextTranslateCTM(ctx, kPadding / 2, kPadding / 2);
        CGContextAddPath(ctx, path.CGPath);
        CGContextSetStrokeColorWithColor(ctx, kLineColor);
        CGContextSetLineWidth(ctx, kLineWidth);
        CGContextStrokePath(ctx);
    }
    CGContextRestoreGState(ctx);
}

@end
