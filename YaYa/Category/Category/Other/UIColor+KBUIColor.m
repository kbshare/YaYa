//
//  UIColor+KBUIColor.m
//  new
//
//  Created by zhangyawei on 16/9/6.
//  Copyright © 2016年 zhangyawei. All rights reserved.
//

#import "UIColor+KBUIColor.h"

@implementation UIColor (KBUIColor)


+ (instancetype)kb_colorWithHex:(u_int32_t)hex {
    
    // 0xFFAA99
    int red = (hex & 0xFF0000) >> 16;
    // 0x00FF00
    // => 0x00AA00 => 0x0000AA
    int green = (hex & 0x00FF00) >> 8;
    // 0x1111 1111 AA 1001 1001
    // 0x0000 0000 00 1111 1111
    int blue = hex & 0x0000FF;
    
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1.0];
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


+ (instancetype) kb_colorWithHexString:(NSString *)color
{
    return [self kb_colorWithHexString:color alpha:1.0f];
}

+ (UIColor *)kb_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
    
}
@end
