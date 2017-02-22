//
//  PromptBoxView.h
//  CustomPromptBox
//
//  Created by bihu_Mac on 2017/2/22.
//  Copyright © 2017年 initial. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BHSCREEN_W [UIScreen mainScreen].bounds.size.width
#define BHSCREEN_H [UIScreen mainScreen].bounds.size.height
@interface PromptBoxView : UIView

/*
 * 
 * titleString   展示的文字
 *
 * titleColor   文字的颜色
 * number     透明du 0~1
 *
 * XYZ     展示view 的位置
 * promptViewColor  展示view 的颜色
 *
 * time  动画时长
 */




-(instancetype)initWithFrame:(CGRect)frame WithTitle:(NSString *)titleString andTitleColor:(UIColor *)titleColor andPromptViewAlpha:(CGFloat)number addpromptViewY:(CGFloat )XYZ andpromptViewColor:(UIColor *)promptViewColor andAnimateShowTime:(NSInteger)time;


@end
