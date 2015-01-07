//
//  NSBKeyframeAnimation.h
//  NSBKeyframeAnimation
//
//  Created by Nacho Soto on 8/6/12.
//  Copyright (c) 2012 Nacho Soto. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "NSBKeyframeAnimationFunctions.h"

typedef void(^NSBKeyframeAnimationCompletionBlock)(BOOL finished);
typedef double(^NSBKeyframeAnimationFunctionBlock)(double t, double b, double c, double d);

@interface NSBKeyframeAnimation : CAKeyframeAnimation

+ (instancetype)animationWithKeyPath:(NSString *)keypath
							duration:(NSTimeInterval)duration
						  startValue:(double)startValue
							endValue:(double)endValue
							function:(NSBKeyframeAnimationFunction)function;

+ (instancetype)animationWithKeyPath:(NSString *)keypath
							duration:(NSTimeInterval)duration
						  startValue:(double)startValue
							endValue:(double)endValue
					   functionBlock:(NSBKeyframeAnimationFunctionBlock)functionBlock;

@property (nonatomic, copy, readwrite) NSBKeyframeAnimationCompletionBlock completionBlock;

@end
