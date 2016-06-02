//
//  POPSpringAnimation+WM.m
//  PopDemo
//
//  Created by David on 16/6/2.
//  Copyright © 2016年 WM. All rights reserved.
//

#import "POPSpringAnimation+WM.h"

@implementation POPSpringAnimation (WM)

+ (POPSpringAnimation *)createAnimationfromValue:(CGRect)fromRect withToValue:(CGRect)toRect withSpringBounciness:(CGFloat)springBounciness withSpringSpeed:(CGFloat)springSpeed withBeginTime:(CFTimeInterval)time
{
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    animation.fromValue = [NSValue valueWithCGRect:fromRect];
    animation.toValue = [NSValue valueWithCGRect:toRect];
    animation.springSpeed = springSpeed;
    animation.springBounciness = springBounciness;
    animation.beginTime = time;
    return animation;
}

@end
