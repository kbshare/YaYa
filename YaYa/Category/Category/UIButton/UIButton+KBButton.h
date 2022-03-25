//
//  UIButton+KBButton.h
//  Finance
//
//  Created by administrator on 16/9/30.
//  Copyright © 2016年 MaShang Consumer Finance. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+KBUIColor.h"
#define kSCREEN_RATE (CGRectGetWidth([UIScreen mainScreen].bounds)/375.0f)
@interface UIButton (KBButton)
///构造button: 标题. 字体颜色 背景图片. 字体大小.   监听者 方法
+ (instancetype)buttonWithTitle:(NSString *)title KB_colortitleColorString:(NSString *)KB_colortitleColorString BackgroundImage:(NSString *)backgroundimg TitleFontSize:(CGFloat)fontsize Target:(id)target Action:(SEL)action;
///构造button:  frame    标题. 字体颜色 背景图片. 字体大小.   监听者 方法
+ (instancetype)buttonWithFrame:(CGRect)frame buttonWithTitle:(NSString *)title KB_colortitleColorString:(NSString *)KB_colortitleColorString BackgroundImage:(NSString *)backgroundimg TitleFontSize:(CGFloat)fontsize Target:(id)target Action:(SEL)action;

///  frame  图片 高亮图片 标题 字体大小 监听者 事件
+ (instancetype)buttonWithFrame:(CGRect)frame buttonWithImage:(NSString *)img HighImg:(NSString *)highimg Title:(NSString *)title TitleFontSize:(CGFloat)fontsize Target:(id)target Action:(SEL)action;
///图片 高亮图片 标题 字体大小 监听者 事件
+ (instancetype)buttonWithImage:(NSString *)img HighImg:(NSString *)highimg Title:(NSString *)title TitleFontSize:(CGFloat)fontsize Target:(id)target Action:(SEL)action;
@end
