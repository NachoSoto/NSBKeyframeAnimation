//
//  NSBKeyframeAnimationFunctions.c
//  NSBKeyframeAnimation
//
//  Created by Nacho Soto on 8/6/12.
//  Copyright (c) 2012 Nacho Soto. All rights reserved.
//

#include <math.h>
#include <stdlib.h>

#import "NSBKeyframeAnimationFunctions.h"

// source: http://gsgd.co.uk/sandbox/jquery/easing/jquery.easing.1.3.js

double NSBKeyframeAnimationFunctionEaseInQuad(double t,double b, double c, double d)
{
    t/=d;
    return c*t*t + b;
}

double NSBKeyframeAnimationFunctionEaseOutQuad(double t,double b, double c, double d)
{
    t/=d;
    return -c *t*(t-2) + b;
}

double NSBKeyframeAnimationFunctionEaseInOutQuad(double t,double b, double c, double d)
{
    t/=d/2;
    if (t < 1) return c/2*t*t + b;
    --t;
    return -c/2 * (t*(t-2) - 1) + b;
}

double NSBKeyframeAnimationFunctionEaseInCubic(double t,double b, double c, double d)
{
    t/=d;
    return c*t*t*t + b;
}

double NSBKeyframeAnimationFunctionEaseOutCubic(double t,double b, double c, double d)
{
    t=t/d-1;
    return c*(t*t*t + 1) + b;
}

double NSBKeyframeAnimationFunctionEaseInOutCubic(double t, double b, double c, double d)
{
    t/=d/2;
    if (t < 1) return c/2*t*t*t + b;
    
    t-=2;
    return c/2*(t*t*t + 2) + b;
}

double NSBKeyframeAnimationFunctionEaseInQuart(double t, double b, double c, double d)
{
    t/=d;
    return c*t*t*t*t + b;
}

double NSBKeyframeAnimationFunctionEaseOutQuart(double t, double b, double c, double d)
{
    t=t/d-1;
    return -c * (t*t*t*t - 1) + b;
}

double NSBKeyframeAnimationFunctionEaseInOutQuart(double t, double b, double c, double d)
{
    t/=d/2;
    if (t < 1) return c/2*t*t*t*t + b;
    
    t-=2;
    return -c/2 * (t*t*t*t - 2) + b;
}

double NSBKeyframeAnimationFunctionEaseInQuint(double t, double b, double c, double d)
{
    t/=d;
    return c*t*t*t*t*t + b;
}

double NSBKeyframeAnimationFunctionEaseOutQuint(double t, double b, double c, double d)
{
    t=t/d-1;
    return c*(t*t*t*t*t + 1) + b;
}

double NSBKeyframeAnimationFunctionEaseInOutQuint(double t, double b, double c, double d)
{
    t/=d/2;
    if (t < 1) return c/2*t*t*t*t*t + b;
    
    t-=2;
    return c/2*(t*t*t*t*t + 2) + b;
}

double NSBKeyframeAnimationFunctionEaseInSine(double t, double b, double c, double d)
{
    return -c * cos(t/d * (M_PI_2)) + c + b;
}

double NSBKeyframeAnimationFunctionEaseOutSine(double t, double b, double c, double d)
{
    return c * sin(t/d * (M_PI_2)) + b;
}

double NSBKeyframeAnimationFunctionEaseInOutSine(double t, double b, double c, double d)
{
    return -c/2 * (cos(M_PI*t/d) - 1) + b;
}

double NSBKeyframeAnimationFunctionEaseInExpo(double t, double b, double c, double d)
{
    return (t==0) ? b : c * pow(2, 10 * (t/d - 1)) + b;
}

double NSBKeyframeAnimationFunctionEaseOutExpo(double t, double b, double c, double d)
{
    return (t==d) ? b+c : c * (-pow(2, -10 * t/d) + 1) + b;
}

double NSBKeyframeAnimationFunctionEaseInOutExpo(double t, double b, double c, double d)
{
    if (t==0) return b;
    if (t==d) return b+c;
    if ((t/=d/2) < 1) return c/2 * pow(2, 10 * (t - 1)) + b;
    return c/2 * (-pow(2, -10 * --t) + 2) + b;
}

double NSBKeyframeAnimationFunctionEaseInCirc(double t, double b, double c, double d)
{
    t/=d;
    return -c * (sqrt(1 - (t)*t) - 1) + b;
}

double NSBKeyframeAnimationFunctionEaseOutCirc(double t, double b, double c, double d)
{
    t=t/d-1;
    return c * sqrt(1 - (t)*t) + b;
}

double NSBKeyframeAnimationFunctionEaseInOutCirc(double t, double b, double c, double d)
{
    if ((t/=d/2) < 1) return -c/2 * (sqrt(1 - t*t) - 1) + b;
    
    t-=2;
    return c/2 * (sqrt(1 - (t)*t) + 1) + b;
}

double NSBKeyframeAnimationFunctionEaseInElastic(double t, double b, double c, double d)
{
    double s = 1.70158; double p=0; double a=c;
    
    if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
    if (a < abs(c)) { a=c; s=p/4; }
    else s = p/(2*M_PI) * asin (c/a);
    
    t-=1;
    return -(a*pow(2,10*(t)) * sin( (t*d-s)*(2*M_PI)/p )) + b;
}

double NSBKeyframeAnimationFunctionEaseOutElastic(double t, double b, double c, double d)
{
    double s=1.70158, p=0, a=c;
    if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
    if (a < abs(c)) { a=c; s=p/4; }
    else s = p/(2*M_PI) * asin (c/a);
    return a*pow(2,-10*t) * sin( (t*d-s)*(2*M_PI)/p ) + c + b;
}

double NSBKeyframeAnimationFunctionEaseInOutElastic(double t, double b, double c, double d)
{
    double s=1.70158, p=0, a=c;
    if (t==0) return b;  if ((t/=d/2)==2) return b+c;  if (!p) p=d*(.3*1.5);
    if (a < abs(c)) { a=c; s=p/4; }
    else s = p/(2*M_PI) * asin(c/a);
    
    t-=1;
    if (t < 1) return -.5*(a*pow(2,10*(t)) * sin( (t*d-s)*(2*M_PI)/p )) + b;
    
    t-=1;
    return a*pow(2,-10*(t)) * sin( (t*d-s)*(2*M_PI)/p )*.5 + c + b;
}

double NSBKeyframeAnimationFunctionEaseInBack(double t, double b, double c, double d)
{
    const double s = 1.70158;
    
    t/=d;
    return c*(t)*t*((s+1)*t - s) + b;
}

double NSBKeyframeAnimationFunctionEaseOutBack(double t, double b, double c, double d)
{
    const double s = 1.70158;
    
    t=t/d-1;
    return c*((t)*t*((s+1)*t + s) + 1) + b;
}

double NSBKeyframeAnimationFunctionEaseInOutBack(double t, double b, double c, double d)
{
    double s = 1.70158;
    s*=(1.525);
    t/=d/2;
    if ((t) < 1) return c/2*(t*t*(((s)+1)*t - s)) + b;
    
    t-=2;
    s*=(1.525);
    return c/2*((t)*t*(((s)+1)*t + s) + 2) + b;
}

double NSBKeyframeAnimationFunctionEaseInBounce(double t, double b, double c, double d)
{
    return c - NSBKeyframeAnimationFunctionEaseOutBounce(d-t, 0, c, d) + b;
}

double NSBKeyframeAnimationFunctionEaseOutBounce(double t, double b, double c, double d)
{
    if ((t/=d) < (1/2.75)) {
        return c*(7.5625*t*t) + b;
    } else if (t < (2/2.75)) {
        t-=(1.5/2.75);
        return c*(7.5625*(t)*t + .75) + b;
    } else if (t < (2.5/2.75)) {
        t-=(2.25/2.75);
        return c*(7.5625*(t)*t + .9375) + b;
    } else {
        t-=(2.625/2.75);
        return c*(7.5625*(t)*t + .984375) + b;
    }
}

double NSBKeyframeAnimationFunctionEaseInOutBounce(double t, double b, double c, double d)
{
    if (t < d/2)
        return NSBKeyframeAnimationFunctionEaseInBounce (t*2, 0, c, d) * .5 + b;
    else
        return NSBKeyframeAnimationFunctionEaseOutBounce(t*2-d, 0, c, d) * .5 + c*.5 + b;
}
