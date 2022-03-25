//
// NSString+Matches.h
//
// Copyright (c) 2014年 Zēng Liàng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Matches)

// 电话判断:手机/座机
//
// Return true/false
- (BOOL)isTelephone;

// 手机号判断
- (BOOL)isMobile;

// 数字判断
- (BOOL)isScalar;

// 邮箱判断
- (BOOL)isMail;

//判断是否是金钱
- (BOOL)isMoney;
// 身份证判断
- (BOOL)isIdentityCard;

// 密码有效性判定
- (BOOL)isPassword;

// 验证码有效性判定
- (BOOL)isCaptcha;

// 中文名有效性判定
- (BOOL)isChineseName;

// 验证码有效性判定
- (BOOL)isFormValid;

// 数字有效性判定
- (BOOL)isNum;

// 中文姓名有效性判断
- (BOOL)isValidName;

// 身份证ID长度验证
- (BOOL)isValidIDCardRange:(NSRange)range;

// 交易密码是否相各位相同
- (BOOL)isSimplePWD;

// 判定是不是固定电话短区号
- (BOOL)isShortAreaCode;

// 判定学校名称或者工作单位是否有效，不少于4位汉字，可以有字母
- (BOOL) isSchoolName;

// 判断学制 输入1-8的整数
- (BOOL) isLengthOfSchool;

// 部门，1-20位汉字
- (BOOL) isempDepartment;

//不低于3个汉字，不能有除#、横杠之外的特殊字符，可以包含数字、字母
- (BOOL) isempAddr;

//3-4位区号加7-8位号码，根据单位i地址自动获取区号
- (BOOL) isempPhone;

//联系人 2到20位汉字，必须为汉字,支持少数民族姓名的▪（▪为特殊符号）
- (BOOL) iscontactName;

//联系人地址 长度8到60位汉字,提供“同现居地”按钮，如果选择，自动赋值现居住地址
- (BOOL) iscontactAddress;


//少数名族分隔符兼容
- (NSString *)getRightFormatChineseName;
@end
