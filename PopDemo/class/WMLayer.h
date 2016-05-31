//
//  WMLayer.h
//  PopDemo
//
//  Created by David on 16/5/31.
//  Copyright © 2016年 WM. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

@interface WMLayer : CALayer

+(void)createAnimationLayerWithString:(NSString*)string andRect:(CGRect)rect andView:(UIView*)view andFont:(UIFont*)ui_font andStrokeColor:(UIColor*)color;

@end
