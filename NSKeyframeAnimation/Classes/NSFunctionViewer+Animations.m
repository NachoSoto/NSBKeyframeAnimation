//
//  NSFunctionViewer+Animations.m
//  NSKeyframeAnimation
//
//  Created by Nacho Soto on 8/12/12.
//  Copyright (c) 2012 Nacho Soto. All rights reserved.
//

#import "NSFunctionViewer+Animations.h"

@implementation NSFunctionViewer (Animations)

+ (NSKeyframeAnimationFunction)animationFunctionForType:(AnimationType)animationType
{
    switch (animationType)
    {
        case AnimationTypeEaseInQuad:
            return NSKeyframeAnimationFunctionEaseInQuad;
        case AnimationTypeEaseOutQuad:
            return NSKeyframeAnimationFunctionEaseOutQuad;
        case AnimationTypeEaseInOutQuad:
            return NSKeyframeAnimationFunctionEaseInOutQuad;
        case AnimationTypeEaseInCubic:
            return NSKeyframeAnimationFunctionEaseInCubic;
        case AnimationTypeEaseOutCubic:
            return NSKeyframeAnimationFunctionEaseOutCubic;
        case AnimationTypeEaseInOutCubic:
            return NSKeyframeAnimationFunctionEaseInOutCubic;
        case AnimationTypeEaseInQuart:
            return NSKeyframeAnimationFunctionEaseInQuart;
        case AnimationTypeEaseOutQuart:
            return NSKeyframeAnimationFunctionEaseOutQuart;
        case AnimationTypeEaseInOutQuart:
            return NSKeyframeAnimationFunctionEaseInOutQuart;
        case AnimationTypeEaseInQuint:
            return NSKeyframeAnimationFunctionEaseInQuint;
        case AnimationTypeEaseOutQuint:
            return NSKeyframeAnimationFunctionEaseOutQuint;
        case AnimationTypeEaseInOutQuint:
            return NSKeyframeAnimationFunctionEaseInOutQuint;
        case AnimationTypeEaseInSine:
            return NSKeyframeAnimationFunctionEaseInSine;
        case AnimationTypeEaseOutSine:
            return NSKeyframeAnimationFunctionEaseOutSine;
        case AnimationTypeEaseInOutSine:
            return NSKeyframeAnimationFunctionEaseInOutSine;
        case AnimationTypeEaseInExpo:
            return NSKeyframeAnimationFunctionEaseInExpo;
        case AnimationTypeEaseOutExpo:
            return NSKeyframeAnimationFunctionEaseOutExpo;
        case AnimationTypeEaseInOutExpo:
            return NSKeyframeAnimationFunctionEaseInOutExpo;
        case AnimationTypeEaseInCirc:
            return NSKeyframeAnimationFunctionEaseInCirc;
        case AnimationTypeEaseOutCirc:
            return NSKeyframeAnimationFunctionEaseOutCirc;
        case AnimationTypeEaseInOutCirc:
            return NSKeyframeAnimationFunctionEaseInOutCirc;
        case AnimationTypeEaseInElastic:
            return NSKeyframeAnimationFunctionEaseInElastic;
        case AnimationTypeEaseOutElastic:
            return NSKeyframeAnimationFunctionEaseOutElastic;
        case AnimationTypeEaseInOutElastic:
            return NSKeyframeAnimationFunctionEaseInOutElastic;
        case AnimationTypeEaseInBack:
            return NSKeyframeAnimationFunctionEaseInBack;
        case AnimationTypeEaseOutBack:
            return NSKeyframeAnimationFunctionEaseOutBack;
        case AnimationTypeEaseInOutBack:
            return NSKeyframeAnimationFunctionEaseInOutBack;
        case AnimationTypeEaseInBounce:
            return NSKeyframeAnimationFunctionEaseInBounce;
        case AnimationTypeEaseOutBounce:
            return NSKeyframeAnimationFunctionEaseOutBounce;
        case AnimationTypeEaseInOutBounce:
            return NSKeyframeAnimationFunctionEaseInOutBounce;
        default:
            return NULL;
    }
    
    return NULL;
}

+ (NSString *)animatonNameForType:(AnimationType)animationType
{
    switch (animationType)
    {
        case AnimationTypeEaseInQuad:
            return @"Ease In Quad";
        case AnimationTypeEaseOutQuad:
            return @"Ease Out Quad";
        case AnimationTypeEaseInOutQuad:
            return @"Ease In Out Quad";
        case AnimationTypeEaseInCubic:
            return @"Ease In Cubic";
        case AnimationTypeEaseOutCubic:
            return @"Ease Out Cubic";
        case AnimationTypeEaseInOutCubic:
            return @"Ease In Out Cubic";
        case AnimationTypeEaseInQuart:
            return @"Ease In Quart";
        case AnimationTypeEaseOutQuart:
            return @"Ease Out Quart";
        case AnimationTypeEaseInOutQuart:
            return @"Ease In Out Quart";
        case AnimationTypeEaseInQuint:
            return @"Ease In Quint";
        case AnimationTypeEaseOutQuint:
            return @"Ease Out Quint";
        case AnimationTypeEaseInOutQuint:
            return @"Ease In Out Quint";
        case AnimationTypeEaseInSine:
            return @"Ease In Sine";
        case AnimationTypeEaseOutSine:
            return @"Ease Out Sine";
        case AnimationTypeEaseInOutSine:
            return @"Ease In Out Sine";
        case AnimationTypeEaseInExpo:
            return @"Ease In Expo";
        case AnimationTypeEaseOutExpo:
            return @"Ease Out Expo";
        case AnimationTypeEaseInOutExpo:
            return @"Ease In Out Expo";
        case AnimationTypeEaseInCirc:
            return @"Ease In Circ";
        case AnimationTypeEaseOutCirc:
            return @"Ease Out Circ";
        case AnimationTypeEaseInOutCirc:
            return @"Ease In Out Circ";
        case AnimationTypeEaseInElastic:
            return @"Ease In Elastic";
        case AnimationTypeEaseOutElastic:
            return @"Ease Out Elastic";
        case AnimationTypeEaseInOutElastic:
            return @"Ease In Out Elastic";
        case AnimationTypeEaseInBack:
            return @"Ease In Back";
        case AnimationTypeEaseOutBack:
            return @"Ease Out Back";
        case AnimationTypeEaseInOutBack:
            return @"Ease In Out Back";
        case AnimationTypeEaseInBounce:
            return @"Ease In Bounce";
        case AnimationTypeEaseOutBounce:
            return @"Ease Out Bounce";
        case AnimationTypeEaseInOutBounce:
            return @"Ease In Out Bounce";
        case AnimationTypeAll:
            return @"All Animations";
        default:
            return nil;
    }
}

@end
