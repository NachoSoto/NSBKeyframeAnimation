//
//  NSKeyframeAnimationFunctions.h
//  NSKeyframeAnimation
//
//  Created by Nacho Soto on 8/6/12.
//  Copyright (c) 2012 Nacho Soto. All rights reserved.
//

typedef double (*NSKeyframeAnimationFunction)(double, double, double, double);

double NSKeyframeAnimationFunctionBounce(double t, double b, double c, double d);
double NSKeyframeAnimationFunctionEasyInElastic(double t, double b, double c, double d);
double NSKeyframeAnimationFunctionEasyInOutElastic(double t, double b, double c, double d);
double NSKeyframeAnimationFunctionEasyInOutCubic(double t, double b, double c, double d);
double NSKeyframeAnimationFunctionEasyInBack(double t, double b, double c, double d);