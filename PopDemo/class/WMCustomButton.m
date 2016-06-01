//
//  WMCustomButton.m
//  PopDemo
//
//  Created by David on 16/6/1.
//  Copyright © 2016年 WM. All rights reserved.
//

#import "WMCustomButton.h"

@implementation WMCustomButton

// 原生自带的titleLabel 字居中
- (void)setUp
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
//    self.titleLabel.textColor = [UIColor whiteColor];
//    self.titleLabel.backgroundColor = [UIColor orangeColor];
}
// 通过代码创建
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

// 通过xib创建
- (void)awakeFromNib
{
    [self setUp];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    // 调整图片
    CGRect frame = self.imageView.frame;
    
    frame.origin.x = 0;
    frame.origin.y = 0;
    frame.size.width = self.frame.size.width;
    frame.size.height = self.imageView.frame.size.height;
    
    self.imageView.frame = frame;
    
    // 调整文字
    frame.origin.x = 0;
    frame.origin.y = self.imageView.frame.size.height;
    frame.size.width = self.frame.size.width;
    frame.size.height = self.frame.size.height - self.imageView.frame.size.height;
    self.titleLabel.frame = frame;
}



@end
