//
//  PopViewController.m
//  PopDemo
//
//  Created by David on 16/6/1.
//  Copyright © 2016年 WM. All rights reserved.
//

#import "PopViewController.h"
#import "pop.h"

@interface PopViewController ()

@property (nonatomic, strong) CALayer *popLayer;

@end

@implementation PopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
