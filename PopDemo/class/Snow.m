//
//  snow.m
//  CAEmitterLayer
//
//  Created by David on 16/5/31.
//  Copyright © 2016年 WM. All rights reserved.
//

#import "Snow.h"

@implementation Snow

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    self.emitterLayer.masksToBounds = YES;
    self.emitterLayer.emitterMode = kCAEmitterLayerSurface;
    self.emitterLayer.emitterShape = kCAEmitterLayerLine;
    self.emitterLayer.emitterSize = self.frame.size;
    self.emitterLayer.emitterPosition = CGPointMake(self.frame.size.width / 2.0, -20);
}

- (void)show
{
    // 配置
    CAEmitterCell *snowflake  = [CAEmitterCell emitterCell];
    snowflake.birthRate       = 1.f;
    snowflake.speed           = 10.f;
    snowflake.velocity        = 2.f;
    snowflake.velocityRange   = 10.f;
    snowflake.yAcceleration   = 10.f;
    snowflake.emissionRange   = 0.5 * M_PI;
    snowflake.spinRange       = 0.25 * M_PI;
    snowflake.contents        = (__bridge id)([UIImage imageNamed:@"snow"].CGImage);
    snowflake.color           = [UIColor redColor].CGColor;
    snowflake.lifetime        = 60.f;
    snowflake.scale           = 0.5;
    snowflake.scaleRange      = 0.3;
    
    // 添加动画
    self.emitterLayer.emitterCells = @[snowflake];
}

@end
