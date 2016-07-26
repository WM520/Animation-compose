//
//  PopViewController.m
//  PopDemo
//
//  Created by David on 16/6/1.
//  Copyright © 2016年 WM. All rights reserved.
//

#import "PopViewController.h"
#import "POPSpringAnimation+WM.h"
#import "WMCustomButton.h"

@interface PopViewController ()

@property (nonatomic, strong) CALayer *popLayer;

@end

@implementation PopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"POP动画";
    // 数据
    NSArray *images = @[@"publish-video", @"publish-picture", @"publish-text", @"publish-audio", @"publish-review", @"publish-offline"];
    NSArray *titles = @[@"发视频", @"发图片", @"发段子", @"发声音", @"审帖", @"离线下载"];
    
    // 中间的6个按钮
    int maxCols = 3;
    CGFloat buttonW = 72;
    CGFloat buttonH = buttonW + 30;
    CGFloat buttonStartY = ([UIScreen mainScreen].bounds.size.width - 2 * buttonH) * 0.5;
    CGFloat buttonStartX = 20;
    CGFloat xMargin = ([UIScreen mainScreen].bounds.size.width - 2 * buttonStartX - maxCols * buttonW) / (maxCols - 1);
    for (int i = 0; i<images.count; i++) {
        WMCustomButton *button = [[WMCustomButton alloc] init];
//        button.backgroundColor = [UIColor redColor];
        button.tag = i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        // 设置内容
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        
        // 计算X\Y
        int row = i / maxCols;
        int col = i % maxCols;
        CGFloat buttonX = buttonStartX + col * (xMargin + buttonW);
        CGFloat buttonEndY = buttonStartY + row * buttonH + 20;
        CGFloat buttonBeginY = buttonEndY - [UIScreen mainScreen].bounds.size.height;
        
        // 按钮动画
        POPSpringAnimation *animation = [POPSpringAnimation createAnimationfromValue:CGRectMake(buttonX, buttonBeginY, buttonW, buttonH) withToValue:CGRectMake(buttonX, buttonEndY, buttonW, buttonH) withSpringBounciness:10 withSpringSpeed:10 withBeginTime:CACurrentMediaTime() + 1 * i];
        NSLog(@"%f", CACurrentMediaTime() + 1 * i);
        [button pop_addAnimation:animation forKey:nil];
    }
    
    [self initPOPLayer];
    [self performSelector:@selector(addPOPSpringAnimation) withObject:nil];
}

- (void)initPOPLayer
{
    self.popLayer = [CALayer layer];
    self.popLayer.frame = CGRectMake(100, 500, 100, 100);
    self.popLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.popLayer];
}

- (void)addPOPSpringAnimation
{
    POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
    springAnimation.springSpeed = 1;
    springAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)];
    [self.popLayer pop_addAnimation:springAnimation forKey:nil];
}

- (void)buttonClick:(UIButton *)btn
{
    
}

@end
