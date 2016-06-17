//
//  WMAnimationViewController.m
//  PopDemo
//
//  Created by David on 16/6/2.
//  Copyright © 2016年 WM. All rights reserved.
//

#import "WMAnimationViewController.h"
#import "CAAnimation+WMAnimation.h"

@interface WMAnimationViewController ()
@property (weak, nonatomic) IBOutlet UIButton *scaleButton;
@property (weak, nonatomic) IBOutlet UIButton *opacityButton;
@property (weak, nonatomic) IBOutlet UIButton *shakeButton;
@property (weak, nonatomic) IBOutlet UIButton *composeButton;

@property (weak, nonatomic) IBOutlet UIButton *rorateButton;
@end

@implementation WMAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"111111111");
}
- (IBAction)scaleAnimation:(UIButton *)sender {
    [CAAnimation showScaleAnimationInView:self.scaleButton scaleValue:2 repeat:MAXFLOAT duration:2];
}
- (IBAction)opacityAnimation:(UIButton *)sender {
    [CAAnimation showOpacityAnimationInView:self.opacityButton alpha:0.2 repeat:MAXFLOAT duration:2];
}

- (IBAction)shakeAnimation:(UIButton *)sender {
    [CAAnimation showShakeAnimationInView:self.shakeButton offset:10 duration:1 repeat:MAXFLOAT derection:ShakeDerectionAxisX];
}

- (IBAction)rorateAnimation:(id)sender {
    [CAAnimation showRotateAnimationInView:self.rorateButton Degree:2 * M_PI axis:AxisY repeat:MAXFLOAT duration:1.5];
}

- (IBAction)composeAnimation:(id)sender {
    [CAAnimation showScaleAnimationInView:self.composeButton scaleValue:1.5 repeat:0 duration:0.8];
    [CAAnimation showOpacityAnimationInView:self.composeButton alpha:0.3 repeat:0 duration:1.0];
    [CAAnimation showMoveAnimationInView:self.composeButton Position:self.scaleButton.layer.position Repeat:0 Duration:1.0];
    [CAAnimation showRotateAnimationInView:self.composeButton Degree:2 * M_PI axis:AxisY repeat:0 duration:1.0];
}

- (void)dealloc
{
    [self.view.layer removeAllAnimations];
}

@end
