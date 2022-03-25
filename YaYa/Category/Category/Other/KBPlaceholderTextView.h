//
//  KBPlaceholderTextView.h
//  文本输入框视图
//
//  Created by mac on 15/7/4.
//  Copyright © 2015年 zhangyawei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KBPlaceholderTextView : UITextView

/** 占位文字 */
@property (nonatomic, copy) NSString *placeholder;
/** 占位文字颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;


@end
