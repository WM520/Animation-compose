//
//  Transform3DViewController.m
//  PopDemo
//
//  Created by David on 16/5/31.
//  Copyright © 2016年 WM. All rights reserved.
//

#import "Transform3DViewController.h"

@interface Transform3DViewController ()

@end

@implementation Transform3DViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"20140628142758_Bckm4"].CGImage);
    self.title = @"3D旋转";
}
- (IBAction)transform:(id)sender {
    
    [self rotate3D];
}

- (void)rotate3D
{
    UIView * view = [self createMaskView];
    CATransform3D transform = CATransform3DIdentity;
    
    transform.m34 = -1.0/600;//透视投影  改变z轴的透视点 -1/z dangz 无限大  即m34 = 0 时就没有效果了
    
    UIView * imageView = [view viewWithTag:111];
    
    [UIView animateWithDuration:5 animations:^{
        
        imageView.layer.transform =  CATransform3DRotate(transform,M_PI * 0.4, 1, 0, 1);
        
    }completion:^(BOOL finished) {
        
    }];
}

- (UIView *)createMaskView
{
    UIView * bgView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    bgView.backgroundColor = [UIColor blackColor];
    bgView.tag = 101;
    
    [bgView addSubview:[self captureScreenContext]];
    
    [self.navigationController.view addSubview:bgView];
    
    //AddGs
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [bgView addGestureRecognizer:tap];
    return bgView;
}

- (void)tapAction:(id)sender
{
    UIView * bgView = [self.navigationController.view viewWithTag:101];
    [UIView animateWithDuration:3 animations:^{
        
        [bgView viewWithTag:111].layer.transform = CATransform3DIdentity;
        
    }completion:^(BOOL finished) {
        [bgView removeFromSuperview];
    }];
}

- (UIView *)captureScreenContext
{
    UIGraphicsBeginImageContextWithOptions([UIApplication sharedApplication].keyWindow.frame.size, NO, 0.0f);
    
    [[UIApplication sharedApplication].keyWindow.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    imageView.image = image;
    imageView.tag = 111;
    
    return imageView;
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
