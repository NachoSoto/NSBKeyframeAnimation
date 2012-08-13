//
//  NSKeyframeAnimationFunctions.c
//  NSKeyframeAnimation
//
//  Created by Nacho Soto on 8/6/12.
//  Copyright (c) 2012 Nacho Soto. All rights reserved.
//

#include <math.h>
#include <stdlib.h>

// source: http://gsgd.co.uk/sandbox/jquery/easing/jquery.easing.1.3.js

double NSKeyframeAnimationFunctionBounce(double t, double b, double c, double d)
{
    if ((t/=d) < (1/2.75)) {
        return c*(7.5625*t*t) + b;
    } else if (t < (2/2.75)) {
        return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b;
    } else if (t < (2.5/2.75)) {
        return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b;
    } else {
        return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b;
    }
}

double NSKeyframeAnimationFunctionEasyInElastic(double t, double b, double c, double d)
{
    double s = 1.70158; double p=0; double a=c;
    
    if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
    if (a < abs(c)) { a=c; s=p/4; }
    else s = p/(2*M_PI) * asin (c/a);
    return -(a*pow(2,10*(t-=1)) * sin( (t*d-s)*(2*M_PI)/p )) + b;
}

double NSKeyframeAnimationFunctionEasyInOutCubic(double t, double b, double c, double d)
{
    if ((t/=d/2) < 1) return c/2*t*t*t + b;
    return c/2*((t-=2)*t*t + 2) + b;
}

double NSKeyframeAnimationFunctionEasyInOutElastic(double t, double b, double c, double d)
{
    double s=1.70158, p=0, a=c;
    if (t==0) return b;  if ((t/=d/2)==2) return b+c;  if (!p) p=d*(.3*1.5);
    if (a < abs(c)) { a=c; s=p/4; }
    else s = p/(2*M_PI) * asin(c/a);
    if (t < 1) return -.5*(a*pow(2,10*(t-=1)) * sin( (t*d-s)*(2*M_PI)/p )) + b;
    return a*pow(2,-10*(t-=1)) * sin( (t*d-s)*(2*M_PI)/p )*.5 + c + b;
}

double NSKeyframeAnimationFunctionEasyInBack(double t, double b, double c, double d)
{
    double s = 1.70158;
    return c*(t/=d)*t*((s+1)*t - s) + b;
}