//
// NSString+Matches.m
//
// Copyright (c) 2014年 Zēng Liàng. All rights reserved.
//

#import "NSString+Matches.h"
#import "NSCharacterSet+MSFCharacterSetAdditions.h"

@implementation NSString (Matches)

- (BOOL)isMobile {
	if (self.length == 0) return NO;
	if (self.length != 11) return NO;
  /**
   *  手机号的限制
   *
   *  @param 0 中国移动 134、135、136、137、138、139 147 150、151、152、157、158、159 178 
                        182、183、184、187、188
   *  @param 1 中国联通  130、131、132、145、155、156、176、185、186
   *
   *  @param 2 中国电信  133、149、153、173、177、180、181、189
     虚拟运营商号码  170,171
   */
//	NSString *mobile = @"^1(3[0-9]|5[0-35-9]|8[0-9]|4[579]|7[013768])\\d{8}$";
    
    NSString *mobile = @"^1\\d{10}$";
    NSPredicate *regextestmobile =[NSPredicate predicateWithFormat:@"SELF MATCHES %@",mobile];
    if ([regextestmobile evaluateWithObject:self]) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)isScalar {
	NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
	[nf setNumberStyle:NSNumberFormatterNoStyle];
	
	NSNumber *number = [nf numberFromString:self];
	
	if (number) {
		return YES;
	} else {
		return NO;
	}
}

- (BOOL)isMoney {
    NSString *moneylRegex1 = @"[0-9]{0,}";
    NSString *moneylRegex2 = @"[0-9]+[\\.][0-9]{1,}";
    NSPredicate *moneyTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", moneylRegex1];
  
    
    if ([moneyTest evaluateWithObject:self]) {
        return YES;
    }
    moneyTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", moneylRegex2];
    if ([moneyTest evaluateWithObject:self]) {
        return YES;
    }
    return NO;
}

- (BOOL)isMail {
	BOOL stricterFilter = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
	NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
	NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
	NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
	NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
	
	return [emailTest evaluateWithObject:self];
}

- (BOOL)isTelephone {
    NSString *ALLMOBILE = @"^1\\d{10}";
//	NSString *MOBILE = @"^1(3[0-9]|5[0-35-9]|8[0125-9])\\d{8}$";
//	NSString *CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
//	NSString *CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
//	NSString *CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
//	NSString *PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
	
    NSPredicate *regextestAllMobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", ALLMOBILE];
//	NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
//	NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
//	NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
//	NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
//	NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
	
	if (([regextestAllMobile evaluateWithObject:self] == YES)
//          || ([regextestmobile evaluateWithObject:self] == YES)
//			|| ([regextestcm evaluateWithObject:self] == YES)
//			|| ([regextestct evaluateWithObject:self] == YES)
//			|| ([regextestcu evaluateWithObject:self] == YES)
//			|| ([regextestphs evaluateWithObject:self] == YES)
        ) {
		return YES;
	} else {
		return NO;
	}
}

- (BOOL)isIdentityCard {
	BOOL flag;
	if (self.length <= 0) {
		flag = NO;
		
		return flag;
	}
	NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
	NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex2];
	
	return [identityCardPredicate evaluateWithObject:self];
}

- (BOOL)isPassword {
	BOOL lengValid = self.length > 7 && self.length < 17;
	if (!lengValid) {
		return NO;
	}
	
	BOOL formValid = [self isFormValid];
	return lengValid && formValid;
}

- (BOOL)isFormValid {
	NSString *digitTrimming  = [self stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
	NSString *letter = [self stringByTrimmingCharactersInSet:[NSCharacterSet letterCharacterSet]];
	NSString *upper = [letter stringByTrimmingCharactersInSet:[NSCharacterSet uppercaseLetterCharacterSet]];
	//BOOL b =  digitTrimming.length > 0 && digitTrimming.length < self.length;
	if (digitTrimming.length > 0 && digitTrimming.length < self.length) {
		return YES;
	} else if (upper.length > 0 && upper.length < self.length) {
		return YES;
	} else if (digitTrimming.length == self.length && upper.length == self.length) {
		return YES;
	}
	return NO;
}

- (BOOL)isCaptcha {
	return self.length == 4 || self.length == 6;
}

- (BOOL)isChineseName {
	NSString *nameRegex = @"^([\\u4E00-\\u9FA5][·•．.‧・]?){1,19}[\\u4E00-\\u9FA5]$";
	NSPredicate *nameText = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
	return [nameText evaluateWithObject:self];
}

- (BOOL)isNum {
 NSScanner *scan = [NSScanner scannerWithString:self];
	int val;
	return[scan scanInt:&val] && [scan isAtEnd];
}

#pragma mark - Custom Accessors

- (BOOL)isValidName {
	NSCharacterSet *blockedCharacters = [[NSCharacterSet letterCharacterSet] invertedSet];
	NSCharacterSet *blockedCharatersSquared = [NSCharacterSet characterSetWithCharactersInString:@"➋➌➍➎➏➐➑➒"];
	return ([self rangeOfCharacterFromSet:blockedCharacters].location == NSNotFound) || ([self rangeOfCharacterFromSet:blockedCharatersSquared].location != NSNotFound);
}

- (BOOL)isValidIDCardRange:(NSRange)range {
	if (range.location > 17) return NO;
	if (range.location == 17) {
		NSCharacterSet *blockedCharacters = [[NSCharacterSet identifyCardCharacterSet] invertedSet];
		return ([self rangeOfCharacterFromSet:blockedCharacters].location == NSNotFound);
	}
	NSCharacterSet *blockedCharacters = [[NSCharacterSet numberCharacterSet] invertedSet];
	return ([self rangeOfCharacterFromSet:blockedCharacters].location == NSNotFound);
}

- (BOOL)isValidUsername {
	if (self.length == 0) return NO;
	if (self.length != 11) return NO;
	if (![[self substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"1"]) {
		return NO;
	}
	return YES;
}

- (BOOL)isValidPassword {
	BOOL lengValid = self.length > 7 && self.length < 17;
	BOOL formValid = NO;
	NSString *digitTrimming  = [self stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
	NSString *letter = [self stringByTrimmingCharactersInSet:[NSCharacterSet letterCharacterSet]];
	NSString *upper = [letter stringByTrimmingCharactersInSet:[NSCharacterSet uppercaseLetterCharacterSet]];
	if (digitTrimming.length > 0 && digitTrimming.length < self.length) {
		formValid = YES;
	} else if (upper.length > 0 && upper.length < self.length) {
		formValid = YES;
	} else if (digitTrimming.length == self.length && upper.length == self.length) {
		formValid = YES;
	}
	return lengValid && formValid;
}

- (BOOL)isValidCaptcha {
	return self.length == 4;
}

- (BOOL)isSimplePWD {
	NSMutableArray *array = [[NSMutableArray alloc] init];
	for (int i = 0; i<10; i++) {
		NSString *str = @"";
		for (int j = 0; j<6; j++) {
			str = [str stringByAppendingString:[NSString stringWithFormat:@"%d", i]];
		}
		[array addObject:str];
	}
	
	for (NSString *str in array) {
		if ([str isEqualToString:self]) {
			return YES;
			break;
		}
	}
	
	return NO;
}

- (BOOL)isShortAreaCode {
	if ([@[@"010", @"020", @"021" ,@"022" ,@"023" ,@"024" ,@"025" ,@"027" ,@"028", @"029"] containsObject:self]) {
		return YES;
	}
	return NO;
}
- (BOOL) isSchoolName {
  NSString *regex2 = @"^[\u4e00-\u9fa5a-zA-Z]{4,60}";
  NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex2];
  return [identityCardPredicate evaluateWithObject:self];
}

- (BOOL) isLengthOfSchool {
  NSString *regex2 = @"^[1-8]?";
  NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex2];
  return [identityCardPredicate evaluateWithObject:self];
}

- (BOOL) isempDepartment {
  NSString *regex2 = @"^[\u4e00-\u9fa5a-zA-Z0-9]{1,20}";
  NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex2];
  return [identityCardPredicate evaluateWithObject:self];
}

- (BOOL) isempAddr {
  NSString *regex2 = @"^[\u4e00-\u9fa5a-zA-Z0-9#\\-]{3,}";
  NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex2];
  return [identityCardPredicate evaluateWithObject:self];
}

- (BOOL) isempPhone {
  
  NSString *regex2 = @"\\d{3}\\d{8}|\\d{4}\\d{7,8}";
  NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex2];
  return [identityCardPredicate evaluateWithObject:self];
}
- (BOOL) iscontactName {
  NSString *regex2 = @"^[\u4e00-\u9fa5\\.]{2,20}";
  NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex2];
  return [identityCardPredicate evaluateWithObject:self];

}

- (BOOL) iscontactAddress {
  NSString *regex2 = @"^[\u4e00-\u9fa5a-zA-Z0-9]{8,60}";
  NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex2];
  return [identityCardPredicate evaluateWithObject:self];
}

- (NSString *)getRightFormatChineseName{
    NSRegularExpression *es = [[NSRegularExpression alloc] initWithPattern:@"[·•．.‧・]+" options:NSRegularExpressionCaseInsensitive error:nil];
    NSString *rightStr = [es stringByReplacingMatchesInString:self options:NSMatchingReportCompletion  range:NSMakeRange(0, self.length) withTemplate:@"·"];
    return rightStr;
}
@end
