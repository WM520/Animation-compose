//
//  CAAnimation+WMAnimation.m
//  PopDemo
//
//  Created by David on 16/6/2.
//  Copyright © 2016年 WM. All rights reserved.
//

#import "CAAnimation+WMAnimation.h"

@implementation CAAnimation (WMAnimation)
/**
 *  比例大小伸缩的动画
 *
 *  @param view       要添加的view
 *  @param scaleValue 放大缩小的比例
 *  @param repeat     重复的次数
 *  @param duration   执行动画的时间
 */
+ (void)showScaleAnimationInView:(UIView *)view scaleValue:(CGFloat)scaleValue repeat:(CGFloat)repeat duration:(CGFloat)duration
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = [NSNumber numberWithFloat:1.0];
    animation.toValue = [NSNumber numberWithFloat:scaleValue];
    
    ///循环动画执行方式，原路返回式(YES 注意：一去一回才算一个动画周期) 还是 再次从头开始(NO 注意：仅仅去一次就是一个动画周期)
    animation.autoreverses = YES;
    ///动画结束后保持的状态：开始状态(kCAFillModeRemoved/kCAFillModeBackwards)、结束状态(kCAFillModeForwards/kCAFillModeBoth)
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = YES;
    
    animation.repeatCount = repeat;
    animation.duration = duration;
    [view.layer addAnimation:animation forKey:@"scaleAnimation"];
}
// 透明度
+ (void)showOpacityAnimationInView:(UIView *)view alpha:(CGFloat)alpha repeat:(CGFloat)repeat duration:(CGFloat)duration
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = [NSNumber numberWithFloat:1.0];
    animation.toValue = [NSNumber numberWithFloat:alpha];
    
    animation.autoreverses = YES;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = YES;
    
    animation.repeatCount = repeat;
    animation.duration = duration;
    [view.layer addAnimation:animation forKey:@"opacityAnimation"];
}

/**
 *  在具体的View实现震动效果
 *
 *  @param view      动画的载体
 *  @param offset    震动的偏移量
 *  @param duration  动画执行的时间
 *  @param repeat    重复的次数
 *  @param derection 震动的方向
 */
+ (void)showShakeAnimationInView:(UIView *)view offset:(CGFloat)offset duration:(CGFloat)duration repeat:(CGFloat)repeat derection:(ShakeDerection)derection
{
    NSAssert([view.layer isKindOfClass:[CALayer class]], @"invalid target");
    CGPoint originPos = CGPointZero;
    CGSize originSize = CGSizeZero;
    
    if ([view.layer isKindOfClass:[CALayer class]]) {
        originPos = view.layer.position;
        originSize = view.layer.bounds.size;
    }
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGFloat offsetX = 0;
    CGFloat offsetY = 0;
    if (derection == ShakeDerectionAxisX) {
        offsetX = offset;
    } else if (derection == ShakeDerctionAxisY){
        offsetY = offset;
    }
    
    animation.values = @[
                         [NSValue valueWithCGPoint:CGPointMake(originPos.x, originPos.y)],
                         [NSValue valueWithCGPoint:CGPointMake(originPos.x - offsetX, originPos.y - offsetY)],
                         [NSValue valueWithCGPoint:CGPointMake(originPos.x + offsetX, originPos.y + offsetY)],
                         [NSValue valueWithCGPoint:CGPointMake(originPos.x, originPos.y)]
                         ];
    animation.repeatCount = repeat;
    animation.duration = duration;
    animation.fillMode = kCAFillModeForwards;
    
    [view.layer addAnimation:animation forKey:@"shakeAnimation"];
}

/**
 *  旋转动画
 *
 *  @param view     动画的载体
 *  @param degree   旋转的角度
 *  @param axis     旋转的轴线
 *  @param repeat   动画执行的次数
 *  @param duration 动画执行的时间
 */
+ (void)showRotateAnimationInView:(UIView *)view Degree:(CGFloat)degree axis:(Axis)axis repeat:(CGFloat)repeat duration:(CGFloat)duration
{
    NSArray *axisArray = @[@"transform.rotation.x",@"transform.rotation.y",@"transform.rotation.z"];
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:axisArray[axis]];
    
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:degree];
    rotateAnimation.autoreverses = YES;
    rotateAnimation.fillMode = kCAFillModeForwards;
    rotateAnimation.removedOnCompletion = NO;
    
    rotateAnimation.repeatCount = repeat;
    rotateAnimation.duration = duration;
    [view.layer addAnimation:rotateAnimation forKey:@"rotateAnimation"];
}

/**
 * 在具体的UIView上实现一个移动的动画
 *@param   view         动画的载体
 *@param   Position     最终停留的位置(中心点坐标)
 *@param   repeat       动画循环次数，0表示无限循环
 *@param   duration     动画运行一次的时间
 *@return  void
 */
+ (void)showMoveAnimationInView:(UIView *)view Position:(CGPoint)position Repeat:(CGFloat)repeat Duration:(CGFloat)duration
{    
    CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAnimation.fromValue = [NSValue valueWithCGPoint:view.layer.position];
    moveAnimation.toValue = [NSValue valueWithCGPoint:position];
    moveAnimation.autoreverses = YES;
    moveAnimation.fillMode = kCAFillModeForwards;
    moveAnimation.removedOnCompletion = NO;
    moveAnimation.repeatCount = repeat;
    moveAnimation.duration = duration;
    [view.layer addAnimation:moveAnimation forKey:@"moveAnimation"];
}


@end
