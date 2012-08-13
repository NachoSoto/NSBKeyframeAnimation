//
//  NSKeyframeAnimationFunctions.h
//  NSKeyframeAnimation
//
//  Created by Nacho Soto on 8/6/12.
//  Copyright (c) 2012 Nacho Soto. All rights reserved.
//

typedef double (*NSKeyframeAnimationFunction)(double, double, double, double);

double NSKeyframeAnimationFunctionEaseInQuad(double t,double b, double c, double d);
double NSKeyframeAnimationFunctionEaseOutQuad(double t,double b, double c, double d);
double NSKeyframeAnimationFunctionEaseInOutQuad(double t,double b, double c, double d);

double NSKeyframeAnimationFunctionEaseInCubic(double t,double b, double c, double d);
double NSKeyframeAnimationFunctionEaseOutCubic(double t,double b, double c, double d);
double NSKeyframeAnimationFunctionEaseInOutCubic(double t, double b, double c, double d);

double NSKeyframeAnimationFunctionEaseInQuart(double t, double b, double c, double d);
double NSKeyframeAnimationFunctionEaseOutQuart(double t, double b, double c, double d);
double NSKeyframeAnimationFunctionEaseInOutQuart(double t, double b, double c, double d);

double NSKeyframeAnimationFunctionEaseInQuint(double t, double b, double c, double d);
double NSKeyframeAnimationFunctionEaseOutQuint(double t, double b, double c, double d);
double NSKeyframeAnimationFunctionEaseInOutQuint(double t, double b, double c, double d);

double NSKeyframeAnimationFunctionEaseInSine(double t, double b, double c, double d);
double NSKeyframeAnimationFunctionEaseOutSine(double t, double b, double c, double d);
double NSKeyframeAnimationFunctionEaseInOutSine(double t, double b, double c, double d);

double NSKeyframeAnimationFunctionEaseInExpo(double t, double b, double c, double d);
double NSKeyframeAnimationFunctionEaseOutExpo(double t, double b, double c, double d);
double NSKeyframeAnimationFunctionEaseInOutExpo(double t, double b, double c, double d);

double NSKeyframeAnimationFunctionEaseInCirc(double t, double b, double c, double d);
double NSKeyframeAnimationFunctionEaseOutCirc(double t, double b, double c, double d);
double NSKeyframeAnimationFunctionEaseInOutCirc(double t, double b, double c, double d);

double NSKeyframeAnimationFunctionEaseInElastic(double t, double b, double c, double d);
double NSKeyframeAnimationFunctionEaseOutElastic(double t, double b, double c, double d);
double NSKeyframeAnimationFunctionEaseInOutElastic(double t, double b, double c, double d);

double NSKeyframeAnimationFunctionEaseInBack(double t, double b, double c, double d);
double NSKeyframeAnimationFunctionEaseOutBack(double t, double b, double c, double d);
double NSKeyframeAnimationFunctionEaseInOutBack(double t, double b, double c, double d);

double NSKeyframeAnimationFunctionEaseInBounce(double t, double b, double c, double d);
double NSKeyframeAnimationFunctionEaseOutBounce(double t, double b, double c, double d);
double NSKeyframeAnimationFunctionEaseInOutBounce(double t, double b, double c, double d);
