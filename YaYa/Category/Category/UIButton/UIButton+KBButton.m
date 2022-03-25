//
//  UIButton+KBButton.m
//  Finance
//
//  Created by administrator on 16/9/30.
//  Copyright © 2016年 MaShang Consumer Finance. All rights reserved.
//

#import "UIButton+KBButton.h"

@implementation UIButton (KBButton)

///构造button:  frame    标题. 字体颜色 背景图片. 字体大小.   监听者 方法
+ (instancetype)buttonWithFrame:(CGRect)frame buttonWithTitle:(NSString *)title KB_colortitleColorString:(NSString *)KB_colortitleColorString BackgroundImage:(NSString *)backgroundimg TitleFontSize:(CGFloat)fontsize Target:(id)target Action:(SEL)action{
   UIButton *btn = [UIButton buttonWithTitle:title KB_colortitleColorString:KB_colortitleColorString BackgroundImage:backgroundimg TitleFontSize:fontsize Target:target Action:action];
    
    btn.frame = frame;
    return btn;
    
}

///构造button: 标题. 字体颜色 背景图片. 字体大小.   监听者 方法
+ (instancetype)buttonWithTitle:(NSString *)title KB_colortitleColorString:(NSString *)KB_colortitleColorString BackgroundImage:(NSString *)backgroundimg TitleFontSize:(CGFloat)fontsize Target:(id)target Action:(SEL)action{
    UIButton *barbutton = [[UIButton alloc] init];
    [barbutton setTitle:title forState:UIControlStateNormal];
    
    if(backgroundimg)[barbutton setBackgroundImage:[UIImage imageNamed:backgroundimg] forState:UIControlStateNormal];
    barbutton.clipsToBounds = NO;
    if(title){
        [barbutton setTitle:title forState:UIControlStateNormal];
        [barbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [barbutton setTitleColor:nil forState:UIControlStateHighlighted];
        barbutton.titleLabel.font = [UIFont systemFontOfSize:fontsize *kSCREEN_RATE ? fontsize : 12.0 *kSCREEN_RATE];
    }
    
    if (KB_colortitleColorString) {
        [barbutton setTitleColor:[UIColor kb_colorWithHexString:KB_colortitleColorString] forState:UIControlStateNormal];
    }
    CGSize titlesize = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontsize ? fontsize : 12.0*kSCREEN_RATE]} context:nil].size;
    
    
    CGRect frame = barbutton.frame;
    frame.size.height = barbutton.currentImage.size.height + titlesize.height;
    frame.size.width = title&&titlesize.width > barbutton.currentImage.size.width ? titlesize.width : barbutton.currentImage.size.width ;
    barbutton.frame = frame;
    
    
    [barbutton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    barbutton.imageEdgeInsets = UIEdgeInsetsMake(0, (barbutton.frame.size.width - barbutton.currentImage.size.width) * 0.5, titlesize.height, 0);
    barbutton.titleEdgeInsets = UIEdgeInsetsMake(barbutton.currentImage.size.height,-barbutton.currentImage.size.width + (barbutton.frame.size.width - titlesize.width) * 0.5, 0, 0);
    [barbutton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return barbutton;
}

///  frame  图片 高亮图片 标题 字体大小 监听者 事件
+ (instancetype)buttonWithFrame:(CGRect)frame buttonWithImage:(NSString *)img HighImg:(NSString *)highimg Title:(NSString *)title TitleFontSize:(CGFloat)fontsize Target:(id)target Action:(SEL)action{

    UIButton *btn = [self buttonWithImage:img HighImg:highimg Title:title TitleFontSize:fontsize Target:target Action:action];
    
    btn.frame = frame;
    return btn;
}
///图片 高亮图片 标题 字体大小 监听者 事件
+ (instancetype)buttonWithImage:(NSString *)img HighImg:(NSString *)highimg Title:(NSString *)title TitleFontSize:(CGFloat)fontsize Target:(id)target Action:(SEL)action{
    UIButton *barbutton = [[UIButton alloc] init];
    [barbutton setTitle:title forState:UIControlStateNormal];
    [barbutton setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    if(highimg)[barbutton setImage:[UIImage imageNamed:highimg] forState:UIControlStateHighlighted];
    barbutton.clipsToBounds = NO;
    if(title){
        [barbutton setTitle:title forState:UIControlStateNormal];
        [barbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [barbutton setTitleColor:nil forState:UIControlStateHighlighted];
        barbutton.titleLabel.font = [UIFont systemFontOfSize:fontsize ? fontsize : 12.0*kSCREEN_RATE];
    }
    CGSize titlesize = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontsize ? fontsize : 12.0*kSCREEN_RATE]} context:nil].size;
    
    
    CGRect frame = barbutton.frame;
    frame.size.height = barbutton.currentImage.size.height + titlesize.height;
    frame.size.width = title&&titlesize.width > barbutton.currentImage.size.width ? titlesize.width : barbutton.currentImage.size.width ;
    barbutton.frame = frame;
    
    
    [barbutton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    barbutton.imageEdgeInsets = UIEdgeInsetsMake(0, (barbutton.frame.size.width - barbutton.currentImage.size.width) * 0.5, titlesize.height, 0);
    barbutton.titleEdgeInsets = UIEdgeInsetsMake(barbutton.currentImage.size.height,-barbutton.currentImage.size.width + (barbutton.frame.size.width - titlesize.width) * 0.5, 0, 0);
    [barbutton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return barbutton;
}
@end
