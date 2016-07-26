//
//  LineationViewController.m
//  PopDemo
//
//  Created by David on 16/5/31.
//  Copyright © 2016年 WM. All rights reserved.
//

#import "LineationViewController.h"
#import "WMLayer.h"

@interface LineationViewController ()
@property (nonatomic, strong)CAEmitterLayer * emitterLayer;
@end

@implementation LineationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.title = @"点击页面有惊喜";
    [self snow];
//    [self SetupEmitter];
}
/**
 *  下雪效果
 */
- (void)snow
{
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    
    emitter.emitterPosition = CGPointMake(self.view.frame.size.width / 2.0, -30);
    emitter.emitterSize = CGSizeMake(self.view.frame.size.width * 2.0, 0);

    // 发射模式
    emitter.emitterMode = kCAEmitterLayerSurface;
    // 发射形状
    emitter.emitterShape = kCAEmitterLayerLine;
    
    [self.view.layer addSublayer:emitter];
    
    // Configure the snowflake emitter cell
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    
    //    随机颗粒的大小
    snowflake.scale = 0.2;
    snowflake.scaleRange = 0.5;
    
    //    缩放比列速度
    snowflake.scaleSpeed = 0.005;
    
    //    粒子参数的速度乘数因子；
    snowflake.birthRate		= 20.0;
    
    //生命周期
    snowflake.lifetime		= 60.0;
    
    //    粒子速度
    snowflake.velocity		= 20;				// falling down slowly
    snowflake.velocityRange = 10;
    //    粒子y方向的加速度分量
    snowflake.yAcceleration = 2;
    
    //    周围发射角度
    snowflake.emissionRange = 0.5 * M_PI;		// some variation in angle
    //    自动旋转
    snowflake.spinRange		= 0.25 * M_PI;		// slow spin
    
    snowflake.contents		= (id) [[UIImage imageNamed:@"snow1"] CGImage];
    snowflake.color			= [[UIColor colorWithRed:0.600 green:0.658 blue:0.743 alpha:1.000] CGColor];
    
    // Make the flakes seem inset in the background
    emitter.shadowOpacity = 1.0;
    emitter.shadowRadius  = 0.0;
    emitter.shadowOffset  = CGSizeMake(0.0, 1.0);
    emitter.shadowColor   = [[UIColor whiteColor] CGColor];
    
    // Add everything to our backing layer below the UIContol defined in the storyboard
    emitter.emitterCells = [NSArray arrayWithObject:snowflake];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    for (id layer in self.view.layer.sublayers) {
        if([layer isKindOfClass:[WMLayer class]])
        {
            [layer removeFromSuperlayer];
        }
    }
    
    [WMLayer createAnimationLayerWithString:@"殷婷，我爱你" andRect: CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.width) andView:self.view andFont:[UIFont boldSystemFontOfSize:40] andStrokeColor:[UIColor cyanColor]];
}
/**
 *  火花效果
 */
- (void)SetupEmitter
{
    // Cells spawn in the bottom, moving up
    CAEmitterLayer *fireworksEmitter = [CAEmitterLayer layer];
    CGRect viewBounds = self.view.layer.bounds;
    fireworksEmitter.emitterPosition = CGPointMake(viewBounds.size.width/2.0, viewBounds.size.height);
    fireworksEmitter.emitterSize	= CGSizeMake(1, 0.0);
    fireworksEmitter.emitterMode	= kCAEmitterLayerOutline;
    fireworksEmitter.emitterShape	= kCAEmitterLayerLine;
    fireworksEmitter.renderMode		= kCAEmitterLayerAdditive;
    //fireworksEmitter.seed = 500;//(arc4random()%100)+300;
    
    // Create the rocket
    CAEmitterCell* rocket = [CAEmitterCell emitterCell];
    
    rocket.birthRate		= 6.0;
    rocket.emissionRange	= 0.12 * M_PI;  // some variation in angle
    rocket.velocity			= 500;
    rocket.velocityRange	= 150;
    rocket.yAcceleration	= 0;
    rocket.lifetime			= 2.02;	// we cannot set the birthrate < 1.0 for the burst
    
    rocket.contents			= (id) [[UIImage imageNamed:@"ball"] CGImage];
    rocket.scale			= 0.2;
    //    rocket.color			= [[UIColor colorWithRed:1 green:0 blue:0 alpha:1] CGColor];
    rocket.greenRange		= 1.0;		// different colors
    rocket.redRange			= 1.0;
    rocket.blueRange		= 1.0;
    
    rocket.spinRange		= M_PI;		// slow spin
    
    
    
    // the burst object cannot be seen, but will spawn the sparks
    // we change the color here, since the sparks inherit its value
    CAEmitterCell* burst = [CAEmitterCell emitterCell];
    
    burst.birthRate			= 1.0;		// at the end of travel
    burst.velocity			= 0;
    burst.scale				= 2.5;
    burst.redSpeed			=-1.5;		// shifting
    burst.blueSpeed			=+1.5;		// shifting
    burst.greenSpeed		=+1.0;		// shifting
    burst.lifetime			= 0.35;
    
    // and finally, the sparks
    CAEmitterCell* spark = [CAEmitterCell emitterCell];
    
    spark.birthRate			= 666;
    spark.velocity			= 125;
    spark.emissionRange		= 2* M_PI;	// 360 deg
    spark.yAcceleration		= 75;		// gravity
    spark.lifetime			= 3;
    
    spark.contents			= (id) [[UIImage imageNamed:@"fire"] CGImage];
    spark.scale		        =0.5;
    spark.scaleSpeed		=-0.2;
    spark.greenSpeed		=-0.1;
    spark.redSpeed			= 0.4;
    spark.blueSpeed			=-0.1;
    spark.alphaSpeed		=-0.5;
    spark.spin				= 2* M_PI;
    spark.spinRange			= 2* M_PI;
    
    // putting it together
    fireworksEmitter.emitterCells	= [NSArray arrayWithObject:rocket];
    rocket.emitterCells				= [NSArray arrayWithObject:burst];
    burst.emitterCells				= [NSArray arrayWithObject:spark];
    [self.view.layer addSublayer:fireworksEmitter];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
