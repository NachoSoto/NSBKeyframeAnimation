//
//  NSBFunctionViewer+Animations.m
//  NSBKeyframeAnimation
//
//  Created by Nacho Soto on 8/12/12.
//  Copyright (c) 2012 Nacho Soto. All rights reserved.
//

#import "NSBFunctionViewer+Animations.h"

@implementation NSBFunctionViewer (Animations)

+ (NSBKeyframeAnimationFunction)animationFunctionForType:(AnimationType)animationType
{
    switch (animationType)
    {
        case AnimationTypeEaseInQuad:
            return NSBKeyframeAnimationFunctionEaseInQuad;
        case AnimationTypeEaseOutQuad:
            return NSBKeyframeAnimationFunctionEaseOutQuad;
        case AnimationTypeEaseInOutQuad:
            return NSBKeyframeAnimationFunctionEaseInOutQuad;
        case AnimationTypeEaseInCubic:
            return NSBKeyframeAnimationFunctionEaseInCubic;
        case AnimationTypeEaseOutCubic:
            return NSBKeyframeAnimationFunctionEaseOutCubic;
        case AnimationTypeEaseInOutCubic:
            return NSBKeyframeAnimationFunctionEaseInOutCubic;
        case AnimationTypeEaseInQuart:
            return NSBKeyframeAnimationFunctionEaseInQuart;
        case AnimationTypeEaseOutQuart:
            return NSBKeyframeAnimationFunctionEaseOutQuart;
        case AnimationTypeEaseInOutQuart:
            return NSBKeyframeAnimationFunctionEaseInOutQuart;
        case AnimationTypeEaseInQuint:
            return NSBKeyframeAnimationFunctionEaseInQuint;
        case AnimationTypeEaseOutQuint:
            return NSBKeyframeAnimationFunctionEaseOutQuint;
        case AnimationTypeEaseInOutQuint:
            return NSBKeyframeAnimationFunctionEaseInOutQuint;
        case AnimationTypeEaseInSine:
            return NSBKeyframeAnimationFunctionEaseInSine;
        case AnimationTypeEaseOutSine:
            return NSBKeyframeAnimationFunctionEaseOutSine;
        case AnimationTypeEaseInOutSine:
            return NSBKeyframeAnimationFunctionEaseInOutSine;
        case AnimationTypeEaseInExpo:
            return NSBKeyframeAnimationFunctionEaseInExpo;
        case AnimationTypeEaseOutExpo:
            return NSBKeyframeAnimationFunctionEaseOutExpo;
        case AnimationTypeEaseInOutExpo:
            return NSBKeyframeAnimationFunctionEaseInOutExpo;
        case AnimationTypeEaseInCirc:
            return NSBKeyframeAnimationFunctionEaseInCirc;
        case AnimationTypeEaseOutCirc:
            return NSBKeyframeAnimationFunctionEaseOutCirc;
        case AnimationTypeEaseInOutCirc:
            return NSBKeyframeAnimationFunctionEaseInOutCirc;
        case AnimationTypeEaseInElastic:
            return NSBKeyframeAnimationFunctionEaseInElastic;
        case AnimationTypeEaseOutElastic:
            return NSBKeyframeAnimationFunctionEaseOutElastic;
        case AnimationTypeEaseInOutElastic:
            return NSBKeyframeAnimationFunctionEaseInOutElastic;
        case AnimationTypeEaseInBack:
            return NSBKeyframeAnimationFunctionEaseInBack;
        case AnimationTypeEaseOutBack:
            return NSBKeyframeAnimationFunctionEaseOutBack;
        case AnimationTypeEaseInOutBack:
            return NSBKeyframeAnimationFunctionEaseInOutBack;
        case AnimationTypeEaseInBounce:
            return NSBKeyframeAnimationFunctionEaseInBounce;
        case AnimationTypeEaseOutBounce:
            return NSBKeyframeAnimationFunctionEaseOutBounce;
        case AnimationTypeEaseInOutBounce:
            return NSBKeyframeAnimationFunctionEaseInOutBounce;
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
