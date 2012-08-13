//
//  NSFunctionViewer+Animations.h
//  NSKeyframeAnimation
//
//  Created by Nacho Soto on 8/12/12.
//  Copyright (c) 2012 Nacho Soto. All rights reserved.
//

#import "NSFunctionViewer.h"

#import "NSKeyframeAnimationFunctions.h"

typedef enum
{
    AnimationTypeEaseInQuad = 0,
    AnimationTypeEaseOutQuad,
    AnimationTypeEaseInOutQuad,
    AnimationTypeEaseInCubic,
    AnimationTypeEaseOutCubic,
    AnimationTypeEaseInOutCubic,
    AnimationTypeEaseInQuart,
    AnimationTypeEaseOutQuart,
    AnimationTypeEaseInOutQuart,
    AnimationTypeEaseInQuint,
    AnimationTypeEaseOutQuint,
    AnimationTypeEaseInOutQuint,
    AnimationTypeEaseInSine,
    AnimationTypeEaseOutSine,
    AnimationTypeEaseInOutSine,
    AnimationTypeEaseInExpo,
    AnimationTypeEaseOutExpo,
    AnimationTypeEaseInOutExpo,
    AnimationTypeEaseInCirc,
    AnimationTypeEaseOutCirc,
    AnimationTypeEaseInOutCirc,
    AnimationTypeEaseInElastic,
    AnimationTypeEaseOutElastic,
    AnimationTypeEaseInOutElastic,
    AnimationTypeEaseInBack,
    AnimationTypeEaseOutBack,
    AnimationTypeEaseInOutBack,
    AnimationTypeEaseInBounce,
    AnimationTypeEaseOutBounce,
    AnimationTypeEaseInOutBounce,
    AnimationTypeCount
} AnimationType;

@interface NSFunctionViewer (Animations)

+ (NSString *)animatonNameForType:(AnimationType)animationType;
+ (NSKeyframeAnimationFunction)animationFunctionForType:(AnimationType)animationType;

@end
