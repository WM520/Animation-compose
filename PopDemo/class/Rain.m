//
//  Rain.m
//  CAEmitterLayer
//
//  Created by David on 16/5/31.
//  Copyright © 2016年 WM. All rights reserved.
//

#import "Rain.h"

@implementation Rain

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
    CAEmitterCell *rainflake  = [CAEmitterCell emitterCell];
    rainflake.birthRate       = 25.f;
    rainflake.speed           = 10.f;
    rainflake.velocity        = 10.f;
    rainflake.velocityRange   = 10.f;
    rainflake.yAcceleration   = 1000.f;
    rainflake.contents        = (__bridge id)([UIImage imageNamed:@"rain"].CGImage);
    rainflake.color           = [UIColor blackColor].CGColor;
    rainflake.lifetime        = 7.f;
    rainflake.scale           = 0.2f;
    rainflake.scaleRange      = 0.f;
    
    // 添加动画
    self.emitterLayer.emitterCells = @[rainflake];
}

@end
