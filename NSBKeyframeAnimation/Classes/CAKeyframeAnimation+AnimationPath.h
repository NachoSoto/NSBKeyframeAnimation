//
//  CAKeyframeAnimation+AnimationPath.h
//  NSBKeyframeAnimation
//
//  Created by Nacho Soto on 8/6/12.
//  Copyright (c) 2012 Nacho Soto. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CAKeyframeAnimation (AnimationPath)

- (UIBezierPath *)animationPath;

@end
