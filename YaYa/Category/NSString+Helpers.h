//
//  NSString+Helpers.h
//  
//
//  Created by xlg on 15/6/2.
//  Copyright (c) 2015年 jsfu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Helpers)
- (void)printName;

- (NSString *)md5;

- (NSString *)base64String;

- (NSString *)fromBase64String;

/**
 * 获取URL字符串中指定参数的值
 */
- (NSString *)valueWithURLParamName:(NSString *)paramName;

- (NSString *)decode;

- (NSString *)URLEncode;

+ (NSString *)jsonStringWithDictionary:(NSDictionary *)dictionary;

+ (NSString *)jsonStringWithArray:(NSArray *)array;

+ (NSString *)jsonStringWithString:(NSString *) string;

+ (NSString *)jsonStringWithObject:(id) object;

+ (NSString *)genUUID;

- (NSString*)trim;

+(BOOL)isNotNULLOrNotNilOrNotEmpty:(NSString *)string;

+ (NSString *)avoidNull:(NSString*)str;

/**
 * 银行卡卡号显示    8888 **** **** 8888
 *
 */
- (NSString*)bankcardNoDisplay;

/**
 * 银行卡卡号显示最后四位    8888
 *
 */
- (NSString *)bankcardNoDisplayLastLength;

+ (CGSize)labelAutoCalculateRectWith:(NSString*)text FontSize:(CGFloat)fontSize MaxSize:(CGSize)maxSize;

// 时间戳转时间字符串
- (NSString *)dateStringWithTimeStamp;

//获取用户的ip地址
+ (NSString *)getIPAddress;

/**
 * num  随机字符串位数
 *
 */
+ (NSString *)getRandomStringWithNum:(NSInteger)num;


+ (NSString *)pathFromString:(NSString *)string;

+ (NSString *)userNameFromString:(NSString *)string;

+ (NSString *)stringDeletePoint: (NSString *)string;

@end
