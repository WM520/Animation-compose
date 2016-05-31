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
    [self snow];
}

- (void)snow
{
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.borderWidth = 10.0f;
    emitter.borderColor = [UIColor redColor].CGColor;
    // 粒子图层的大小
    emitter.frame = CGRectMake(100, 100, 200, 200);
    // 发射点
    emitter.position = CGPointMake(0, 0);
    // 发射模式
    emitter.renderMode = kCAEmitterLayerPoints;
    // 发射形状
    emitter.emitterShape = kCAEmitterLayerLine;
    
    [self.view.layer addSublayer:emitter];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    for (id layer in self.view.layer.sublayers) {
        if([layer isKindOfClass:[WMLayer class]])
        {
            [layer removeFromSuperlayer];
        }
    }
    
    [WMLayer createAnimationLayerWithString:@"cherry，我爱你" andRect: CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.width) andView:self.view andFont:[UIFont boldSystemFontOfSize:40] andStrokeColor:[UIColor cyanColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
