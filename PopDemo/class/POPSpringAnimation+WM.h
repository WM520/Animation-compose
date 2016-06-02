//
//  POPSpringAnimation+WM.h
//  PopDemo
//
//  Created by David on 16/6/2.
//  Copyright © 2016年 WM. All rights reserved.
//

#import "POPSpringAnimation.h"

@interface POPSpringAnimation (WM)

+ (POPSpringAnimation *)createAnimationfromValue:(CGRect)fromRect withToValue:(CGRect)toRect withSpringBounciness:(CGFloat)springBounciness withSpringSpeed:(CGFloat)springSpeed withBeginTime:(CFTimeInterval)time;

@end
