//
//  CAAnimation+WMAnimation.h
//  PopDemo
//
//  Created by David on 16/6/2.
//  Copyright © 2016年 WM. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, Axis) {
    AxisX,
    AxisY,
    AxisZ
};

typedef NS_ENUM(NSInteger, ShakeDerection) {
    ShakeDerectionAxisX = 0, // 左右
    ShakeDerctionAxisY, // 上下
};

@interface CAAnimation (WMAnimation)
/**
 *  比例大小伸缩的动画
 *
 *  @param view       要添加的view
 *  @param scaleValue 放大缩小的比例
 *  @param repeat     重复的次数
 *  @param duration   执行动画的时间
 */
+ (void)showScaleAnimationInView:(UIView *)view scaleValue:(CGFloat)scaleValue repeat:(CGFloat)repeat duration:(CGFloat)duration;

+ (void)showOpacityAnimationInView:(UIView *)view alpha:(CGFloat)alpha repeat:(CGFloat)repeat duration:(CGFloat)duration;
/**
 *  在具体的View实现震动效果
 *
 *  @param view      动画的载体
 *  @param offset    震动的偏移量
 *  @param duration  动画执行的时间
 *  @param repeat    重复的次数
 *  @param derection 震动的方向
 */
+ (void)showShakeAnimationInView:(UIView *)view offset:(CGFloat)offset duration:(CGFloat)duration repeat:(CGFloat)repeat derection:(ShakeDerection)derection;

/**
 *  旋转动画
 *
 *  @param view     动画的载体
 *  @param degree   旋转的角度
 *  @param axis     旋转的轴线
 *  @param repeat   动画执行的次数
 *  @param duration 动画执行的时间
 */
+ (void)showRotateAnimationInView:(UIView *)view Degree:(CGFloat)degree axis:(Axis)axis repeat:(CGFloat)repeat duration:(CGFloat)duration;

/**
 * 在具体的UIView上实现一个移动的动画
 *@param   view         动画的载体
 *@param   Position     最终停留的位置(中心点坐标)
 *@param   repeat       动画循环次数，0表示无限循环
 *@param   duration     动画运行一次的时间
 *@return  void
 */
+ (void)showMoveAnimationInView:(UIView *)view Position:(CGPoint)position Repeat:(CGFloat)repeat Duration:(CGFloat)duration;

@end
