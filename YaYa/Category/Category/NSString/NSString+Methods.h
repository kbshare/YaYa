//
//  NSString+Methods.h
//  weixin
//
//  Created by administrator on 2018/8/29.
//  Copyright © 2018年 msxf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Methods)
#pragma mark - 正则等判断
/**
 是否Email
 
 @return value
 */
-(BOOL)isEmail;


/**
 是否只有中文

 @return value
 */
- (BOOL) isOnlyChinese;

/**
 身份证

 @return vaule
 */
- (BOOL) isValidIdentifyID;


/**
 数字

 @return 四位数字
 */
- (BOOL) isValidVerifyCode;

/**
 * 由英文、字母或数字组成 6-18位
 *
 * @return YES 验证成功 NO 验证失败
 */
- (BOOL)isPassword;

/**
 * 匹配数字
 *
 * @return YES 成功 NO 失败
 */ - (BOOL)isNumbers;

/**
 * 匹配英文字母
 *
 * @return YES 成功 NO 失败
 */
- (BOOL)isLetter;

/**
 * 匹配大写英文字母
 *
 * @return YES 成功 NO 失败
 */
- (BOOL)isCapitalLetter;

/**
 * 匹配小写英文字母
 *
 * @return YES 成功 NO 失败
 */
- (BOOL)isSmallLetter;

/**
 * 匹配英文字母数字
 *
 * @return YES 成功 NO 失败
 */
- (BOOL)isLetterAndNumbers;

#pragma mark - 散列函数
/**
 *  计算MD5散列结果
 *
 *  终端测试命令：
 *  @code
 *  md5 -s "string"
 *  @endcode
 *
 *  <p>提示：随着 MD5 碰撞生成器的出现，MD5 算法不应被用于任何软件完整性检查或代码签名的用途。<p>
 *
 *  @return 32个字符的MD5散列字符串
 */
- (NSString *)md5String;

/**
 *  计算SHA1散列结果
 *
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl sha -sha1
 *  @endcode
 *
 *  @return 40个字符的SHA1散列字符串
 */
- (NSString *)sha1String;

/**
 *  计算SHA256散列结果
 *
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl sha -sha256
 *  @endcode
 *
 *  @return 64个字符的SHA256散列字符串
 */
- (NSString *)sha256String;

/**
 *  计算SHA 512散列结果
 *
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl sha -sha512
 *  @endcode
 *
 *  @return 128个字符的SHA 512散列字符串
 */
- (NSString *)sha512String;

#pragma mark - HMAC 散列函数
/**
 *  计算HMAC MD5散列结果
 *
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl dgst -md5 -hmac "key"
 *  @endcode
 *
 *  @return 32个字符的HMAC MD5散列字符串
 */
- (NSString *)hmacMD5StringWithKey:(NSString *)key;

/**
 *  计算HMAC SHA1散列结果
 *
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl sha -sha1 -hmac "key"
 *  @endcode
 *
 *  @return 40个字符的HMAC SHA1散列字符串
 */
- (NSString *)hmacSHA1StringWithKey:(NSString *)key;

/**
 *  计算HMAC SHA256散列结果
 *
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl sha -sha256 -hmac "key"
 *  @endcode
 *
 *  @return 64个字符的HMAC SHA256散列字符串
 */
- (NSString *)hmacSHA256StringWithKey:(NSString *)key;

/**
 *  计算HMAC SHA512散列结果
 *
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl sha -sha512 -hmac "key"
 *  @endcode
 *
 *  @return 128个字符的HMAC SHA512散列字符串
 */
- (NSString *)hmacSHA512StringWithKey:(NSString *)key;

#pragma mark - 文件散列函数

/**
 *  计算文件的MD5散列结果
 *
 *  终端测试命令：
 *  @code
 *  md5 file.dat
 *  @endcode
 *
 *  @return 32个字符的MD5散列字符串
 */
- (NSString *)fileMD5Hash;

/**
 *  计算文件的SHA1散列结果
 *
 *  终端测试命令：
 *  @code
 *  openssl sha -sha1 file.dat
 *  @endcode
 *
 *  @return 40个字符的SHA1散列字符串
 */
- (NSString *)fileSHA1Hash;

/**
 *  计算文件的SHA256散列结果
 *
 *  终端测试命令：
 *  @code
 *  openssl sha -sha256 file.dat
 *  @endcode
 *
 *  @return 64个字符的SHA256散列字符串
 */
- (NSString *)fileSHA256Hash;

/**
 *  计算文件的SHA512散列结果
 *
 *  终端测试命令：
 *  @code
 *  openssl sha -sha512 file.dat
 *  @endcode
 *
 *  @return 128个字符的SHA512散列字符串
 */
- (NSString *)fileSHA512Hash;


/**
 转base64

 @return  转base64
 */
- (NSString *)base64String;


/**
 base64转string

 @return base64转string
 */
- (NSString *)fromBase64String;



#pragma mark - 时间戳
/**
 通过时间戳计算时间差（几小时前、几天前
 
 @param compareDate NSTimeInterval
 @return 几小时前、几天前...
 */
+ (NSString *) compareCurrentTime:(NSTimeInterval) compareDate;

/**
 通过时间戳得出对应的时间
 
 @param timestamp 时间戳
 @return time
 */
+ (NSString *) getDateStringWithTimestamp:(NSTimeInterval)timestamp;

/**
 //通过时间戳显示时间
 @param timestamp 时间戳
 @param formatter 格式
 @return 时间
 */
+ (NSString *) getStringWithTimestamp:(NSTimeInterval)timestamp formatter:(NSString*)formatter;


// 时间戳转时间字符串
- (NSString *)dateStringWithTimeStamp;

#pragma mark - 字符串处理

/**
  字符串去空格

 @return 字符串去换行符
 */
- (NSString*)trimLineFeed;

/**
 字符串去空格

 @return vaule
 */
- (NSString*)trimWhiteSpace;

/**
 字符串去空格和换行符
 
 @return value
 */
- (NSString*)trimStr;

/**
 是否空字符串 (@"" nill null)

 @return value
 */
- (BOOL)isNotEmpty;

#pragma mark - 手机号、银行卡处理

/**
 * 银行卡脱敏    8888 **** **** 8888
 *
 */
- (NSString*)bankNoDesensitization;


/**
 手机号脱敏

 @return 133*****333
 */
- (NSString*)phoneNoDesensitization;


/**
 格式化手机号

 @param phoneNo 13333333333
 @return 133-3333-3333
 */
+ (NSString*) phoneNoFormat:(NSString *)phoneNo;

/**
 格式化银行卡

 @param NSString 62220222222222222222
 @return 622-34433-333....
 */
+(NSString *)formatterBankCardNum:(NSString *)string;

/**
 字符串后几位展示

 @param num 展示后几位位数
 @return value
 */
- (NSString *)stringLastLength:(NSUInteger)num;

/**
 获取随机字符串位数
 
 @param num 指定位数
 @return str
 */
+ (NSString *)getRandomStringWithNum:(NSInteger)num;

#pragma mark - 富文本

/**
 字号、颜色富文本

 @param str 需要调整的str
 @param fontSize 字号
 @param color 颜色
 @return 富文本
 */
+ (NSMutableAttributedString *)makeMuAttributedStr:(NSString *)str fontSize:(CGFloat)fontSize color:(UIColor *)color;


/**
 调整字符间距、行间距

 @param str 需要调整的str
 @param spac 字符间距
 @param lineSpac 行间距
 @return 富文本 结合 setAttributedText 使用
 */
+ (NSMutableAttributedString *)spacingWithStr:(NSString *)str characterSpac:(NSNumber *)spac lineSpac:(CGFloat)lineSpac;



#pragma mark - 计算字符串尺寸
/**
 计算文字高度
 
 @param fontSize 字体
 @param width 最大宽度
 @return value
 */
- (CGFloat  ) heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width;

/**
 计算文字宽度
 
 @param fontSize 字体
 @param maxHeight 最大高度
 @return value
 */
- (CGFloat  ) widthWithFontSize:(CGFloat)fontSize height:(CGFloat)maxHeight;


#pragma mark - 汉字转拼音
+ (NSString *)transform:(NSString *)chinese;



#pragma mark - Emoji相关
/**
 *
 判断是否是Emoji
 *
 * @return YES 是 NO 不是
 */
- (BOOL)isEmoji;

/**
 * 判断字符串时候含有Emoji
 *
 * @return YES 是 NO 不是
 */ - (BOOL)isIncludingEmoji;

/**
 * 移除掉字符串中得Emoji
 *
 * @return 得到移除Emoji后的string
 */ - (instancetype)removedEmojiString;



#pragma mark - 其他func

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


/**
 获取用户的ip地址
 
 @return ipstring
 */
+ (NSString *)getIPAddress;

@end
