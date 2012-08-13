//
//  NSKeyframeAnimation.h
//  NSKeyframeAnimation
//
//  Created by Nacho Soto on 8/6/12.
//  Copyright (c) 2012 Nacho Soto. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "NSKeyframeAnimationFunctions.h"

typedef void(^NSKeyframeAnimationCompletionBlock)(BOOL finished);

@interface NSKeyframeAnimation : CAKeyframeAnimation

+ (id)animationWithKeyPath:(NSString *)keypath
                  duration:(NSTimeInterval)duration
                startValue:(double)startValue
                  endValue:(double)endValue
                  function:(NSKeyframeAnimationFunction)function;

@property (nonatomic, copy, readwrite) NSKeyframeAnimationCompletionBlock completionBlock;

@end
