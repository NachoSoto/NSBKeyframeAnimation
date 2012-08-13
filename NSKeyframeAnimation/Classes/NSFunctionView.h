//
//  NSFunctionView.h
//  NSKeyframeAnimation
//
//  Created by Nacho Soto on 8/6/12.
//  Copyright (c) 2012 Nacho Soto. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface NSFunctionView : UIView

@property (nonatomic, retain, readwrite) CAKeyframeAnimation *animation;

@end
