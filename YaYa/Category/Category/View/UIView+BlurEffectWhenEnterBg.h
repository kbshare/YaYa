//
//  UIView+BlurEffectWhenEnterBg.h
//  msg
//
//  Created by msxf on 16/11/10.
//  Copyright © 2016年 msxf. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 app退到后台模糊效果
 */
@interface UIView (BlurEffectWhenEnterBg)

+ (void)createBlurView;
+ (void)removeBlurView;

@end
