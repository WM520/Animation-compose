//
//  CAEmitterLayerViewController.m
//  PopDemo
//
//  Created by David on 16/5/31.
//  Copyright © 2016年 WM. All rights reserved.
//

#import "CAEmitterLayerViewController.h"
#import "CAEmitterLayerView.h"
#import "Rain.h"
#import "Snow.h"


@interface CAEmitterLayerViewController ()

@end

@implementation CAEmitterLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *alphaView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 300)];
    alphaView1.image        = [UIImage imageNamed:@"alpha"];
    
    UIImageView *alphaView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 300)];
    alphaView2.image        = [UIImage imageNamed:@"alpha"];
    
    
    // 添加下雪效果
    CAEmitterLayerView *snowView = [[Snow alloc] initWithFrame:CGRectMake(100, 64, 200, 300)];
    snowView.maskView            = alphaView1;
    [self.view addSubview:snowView];
    [snowView show];
    
    
    
    // 添加下雨效果
    CAEmitterLayerView *rainView = [[Rain alloc] initWithFrame:CGRectMake(100, 64 + 310, 200, 300)];
    rainView.maskView            = alphaView2;
    [self.view addSubview:rainView];
    [rainView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
