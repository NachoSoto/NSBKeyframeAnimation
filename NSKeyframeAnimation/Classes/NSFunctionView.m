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

#define kPointColor [UIColor greenColor]
#define kPointSize (8.0f)

#define kPathAnimationKeyPath @"position"

@interface PointLayer : CALayer

@end

@implementation PointLayer

- (id)init
{
    if ((self = [super init]))
    {
        self.needsDisplayOnBoundsChange = YES;
    }
    
    return self;
}

- (void)drawInContext:(CGContextRef)ctx
{
    CGContextSaveGState(ctx);
    {
        CGContextAddEllipseInRect(ctx, self.bounds);
        CGContextSetFillColorWithColor(ctx, kPointColor.CGColor);
        CGContextFillPath(ctx);
    }
    CGContextRestoreGState(ctx);
}

@end

@interface NSFunctionView ()

@property (nonatomic, retain) PointLayer *pointLayer;

@property (nonatomic, retain) UIBezierPath *animationPath;

@end

@implementation NSFunctionView

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        self.pointLayer = [PointLayer layer];
        self.pointLayer.frame = CGRectMake(0, 0, kPointSize, kPointSize);
        
        self.backgroundColor = [UIColor clearColor];
        
        [self.layer addSublayer:self.pointLayer];
    }
    
    return self;
}

- (void)dealloc
{
    [_animation release];
    [_animation release];
    [_pointLayer release];
    
    [super dealloc];
}

#pragma mark -

- (UIBezierPath *)animationPath
{
    if (_animationPath == nil)
    {
        _animationPath = [[self.animation animationPath] retain];
        
        const CGFloat horizontalScale = self.frame.size.width,
                      verticalScale = self.frame.size.height;
        
        [_animationPath applyTransform:CGAffineTransformMakeScale(horizontalScale, verticalScale)];
    }
    
    return _animationPath;
}

- (void)setAnimation:(CAKeyframeAnimation *)animation
{
    if (_animation != animation)
    {
        [_animation release];
        _animation = [animation retain];
        
        self.animationPath = nil;
        
        CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:kPathAnimationKeyPath];
        pathAnimation.path = self.animationPath.CGPath;
        pathAnimation.duration = animation.duration;
        pathAnimation.fillMode = kCAFillModeForwards;
        pathAnimation.removedOnCompletion = NO;
        
        [self.pointLayer addAnimation:pathAnimation forKey:kPathAnimationKeyPath];
        
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *path = self.animationPath;
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(ctx);
    {
        CGContextAddPath(ctx, path.CGPath);
        CGContextSetStrokeColorWithColor(ctx, kLineColor);
        CGContextSetLineCap(ctx, kCGLineCapRound);
        CGContextSetLineWidth(ctx, kLineWidth);
        CGContextStrokePath(ctx);
    }
    CGContextRestoreGState(ctx);
}

@end
