//
//  UIColor+KBUIColor.h
//  new
//
//  Created by zhangyawei on 16/9/6.
//  Copyright © 2016年 zhangyawei. All rights reserved.
//

#import <UIKit/UIKit.h>
// RGB颜色
#define KBCOLOR(r,g,b)     [UIColor colorWithRed:(r)/256.0 green:(g)/256.0 blue:(b)/256.0 alpha:1]
#define KBACOLOR(r,g,b,a)  [UIColor colorWithRed:(r)/256.0 green:(g)/256.0 blue:(b)/256.0 alpha:(a)]
@interface UIColor (KBUIColor)


///  根据无符号的 32 位整数转换成对应的 rgb 颜色，0xFF0000
///
///  @param hex hex
///
///  @return UIColor
+ (instancetype)kb_colorWithHex:(u_int32_t)hex;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

///  从十六进制字符串获取颜色，   color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
///
///  @param color
///
///  @return
+ (instancetype) kb_colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
///  从十六进制字符串获取颜色，   color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
///
///  @param color
///
///  @return
+ (UIColor *)kb_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
@end
