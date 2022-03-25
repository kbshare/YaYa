//
//  NSString+Methods.m
//  weixin
//
//  Created by administrator on 2018/8/29.
//  Copyright © 2018年 msxf. All rights reserved.
//

#import "NSString+Methods.h"
//引入IOS自带密码库
#import <CommonCrypto/CommonCrypto.h>
#import <CommonCrypto/CommonDigest.h>

//ip相关
#import <ifaddrs.h>
#import <arpa/inet.h>

#define     LocalStr_None           @""
static const char encodingTable[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

@implementation NSString (Methods)

/**
 是否Email
 
 @return value
 */
-(BOOL)isEmail{
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTestPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [emailTestPredicate evaluateWithObject:self];
}

/**
 是否只有中文
 
 @return value
 */
- (BOOL) isOnlyChinese{
    NSString * chineseTest=@"^[\u4e00-\u9fa5]{0,}$";
    NSPredicate*chinesePredicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",chineseTest];
    return [chinesePredicate evaluateWithObject:self];
}

/**
 身份证
 
 @return vaule
 */
- (BOOL) isValidIdentifyID{
    NSString * identifyTest=@"^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$";
    NSPredicate*identifyPredicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",identifyTest];
    return [identifyPredicate evaluateWithObject:self];
}
/**
 * 由英文、字母或数字组成 6-18位
 *
 * @return YES 验证成功 NO 验证失败
 */
- (BOOL)isPassword {
    NSString * regex = @"^[A-Za-z0-9_]{6,18}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
    
}

/**
 * 匹配数字
 *
 * @return YES 成功 NO 失败
 */ - (BOOL)isNumbers {
     NSString *regEx = @"^-?\\d+.?\\d?";
     NSPredicate *pred= [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regEx];
     return [pred evaluateWithObject:self];
     
 }

/**
 * 匹配英文字母
 *
 * @return YES 成功 NO 失败
 */
- (BOOL)isLetter {
    NSString *regEx = @"^[A-Za-z]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regEx];
    return [pred evaluateWithObject:self];
    
}
/**
 * 匹配大写英文字母
 *
 * @return YES 成功 NO 失败
 */
- (BOOL)isCapitalLetter {
    NSString *regEx = @"^[A-Z]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regEx];
    return [pred evaluateWithObject:self];
    
}

/**
 * 匹配小写英文字母
 *
 * @return YES 成功 NO 失败
 */
- (BOOL)isSmallLetter {
    NSString *regEx = @"^[a-z]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regEx];
    return [pred evaluateWithObject:self];
    
}

/**
 * 匹配英文字母数字
 *
 * @return YES 成功 NO 失败
 */
- (BOOL)isLetterAndNumbers {
    NSString *regEx = @"^[A-Za-z0-9]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regEx];
    return [pred evaluateWithObject:self];
    
}


/**
 匹配url  (http https)
 
 @return value
 */
- (BOOL)isUrl {
    NSString *regex = @"http(s)?:\\/\\/([\\w-]+\\.)+[\\w-]+(\\/[\\w- .\\/?%&=]*)?";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
    
}



#pragma mark ======== 汉字转拼音 ========
+ (NSString *)transform:(NSString *)chinese
{
    if (!chinese || ![chinese isKindOfClass:[NSString class]]) return @"";
    
    NSMutableString *pinyin = [chinese mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    NSLog(@"%@", pinyin);
    return [pinyin uppercaseString];
}

#pragma mark ======== 字符串转银行卡格式========
+(NSString *)formatterBankCardNum:(NSString *)string
{
    if (!string || ![string isKindOfClass:[NSString class]]) return @"";
    
    NSString *tempStr= string;
    NSInteger size = (tempStr.length / 4);
    NSMutableArray *tmpStrArr = [[NSMutableArray alloc] init];
    
    for (int i = 0; i< size; i++) {
        [tmpStrArr addObject:[tempStr substringWithRange:NSMakeRange(i*4, 4)]];
    }
    
    [tmpStrArr addObject:[tempStr substringWithRange:NSMakeRange(size*4, (tempStr.length % 4))]
     ];
    tempStr = [tmpStrArr componentsJoinedByString:@" "];
    return tempStr;
}

#pragma mark ======== 字符串去空格和换行符========
+ (NSString *)delSpaceAndNewline:(NSString *)string{
    
    if (!string || ![string isKindOfClass:[NSString class]]) return @"";
    
    NSMutableString *mutStr = [NSMutableString stringWithString:string];
    
    NSRange range = {0,mutStr.length};
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
}


#pragma mark - 散列函数
- (NSString *)md5String {
    const char *str = self.UTF8String;
    uint8_t buffer[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(str, (CC_LONG)strlen(str), buffer);
    
    return [self stringFromBytes:buffer length:CC_MD5_DIGEST_LENGTH];
}

- (NSString *)sha1String {
    const char *str = self.UTF8String;
    uint8_t buffer[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(str, (CC_LONG)strlen(str), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA1_DIGEST_LENGTH];
}

- (NSString *)sha256String {
    const char *str = self.UTF8String;
    uint8_t buffer[CC_SHA256_DIGEST_LENGTH];
    
    CC_SHA256(str, (CC_LONG)strlen(str), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA256_DIGEST_LENGTH];
}

- (NSString *)sha512String {
    const char *str = self.UTF8String;
    uint8_t buffer[CC_SHA512_DIGEST_LENGTH];
    
    CC_SHA512(str, (CC_LONG)strlen(str), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA512_DIGEST_LENGTH];
}

#pragma mark - HMAC 散列函数
- (NSString *)hmacMD5StringWithKey:(NSString *)key {
    const char *keyData = key.UTF8String;
    const char *strData = self.UTF8String;
    uint8_t buffer[CC_MD5_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgMD5, keyData, strlen(keyData), strData, strlen(strData), buffer);
    
    return [self stringFromBytes:buffer length:CC_MD5_DIGEST_LENGTH];
}

- (NSString *)hmacSHA1StringWithKey:(NSString *)key {
    const char *keyData = key.UTF8String;
    const char *strData = self.UTF8String;
    uint8_t buffer[CC_SHA1_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgSHA1, keyData, strlen(keyData), strData, strlen(strData), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA1_DIGEST_LENGTH];
}

- (NSString *)hmacSHA256StringWithKey:(NSString *)key {
    const char *keyData = key.UTF8String;
    const char *strData = self.UTF8String;
    uint8_t buffer[CC_SHA256_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgSHA256, keyData, strlen(keyData), strData, strlen(strData), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA256_DIGEST_LENGTH];
}

- (NSString *)hmacSHA512StringWithKey:(NSString *)key {
    const char *keyData = key.UTF8String;
    const char *strData = self.UTF8String;
    uint8_t buffer[CC_SHA512_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgSHA512, keyData, strlen(keyData), strData, strlen(strData), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA512_DIGEST_LENGTH];
}

#pragma mark - 文件散列函数

#define FileHashDefaultChunkSizeForReadingData 4096

- (NSString *)fileMD5Hash {
    NSFileHandle *fp = [NSFileHandle fileHandleForReadingAtPath:self];
    if (fp == nil) {
        return nil;
    }
    
    CC_MD5_CTX hashCtx;
    CC_MD5_Init(&hashCtx);
    
    while (YES) {
        @autoreleasepool {
            NSData *data = [fp readDataOfLength:FileHashDefaultChunkSizeForReadingData];
            
            CC_MD5_Update(&hashCtx, data.bytes, (CC_LONG)data.length);
            
            if (data.length == 0) {
                break;
            }
        }
    }
    [fp closeFile];
    
    uint8_t buffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(buffer, &hashCtx);
    
    return [self stringFromBytes:buffer length:CC_MD5_DIGEST_LENGTH];
}

- (NSString *)fileSHA1Hash {
    NSFileHandle *fp = [NSFileHandle fileHandleForReadingAtPath:self];
    if (fp == nil) {
        return nil;
    }
    
    CC_SHA1_CTX hashCtx;
    CC_SHA1_Init(&hashCtx);
    
    while (YES) {
        @autoreleasepool {
            NSData *data = [fp readDataOfLength:FileHashDefaultChunkSizeForReadingData];
            
            CC_SHA1_Update(&hashCtx, data.bytes, (CC_LONG)data.length);
            
            if (data.length == 0) {
                break;
            }
        }
    }
    [fp closeFile];
    
    uint8_t buffer[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1_Final(buffer, &hashCtx);
    
    return [self stringFromBytes:buffer length:CC_SHA1_DIGEST_LENGTH];
}

- (NSString *)fileSHA256Hash {
    NSFileHandle *fp = [NSFileHandle fileHandleForReadingAtPath:self];
    if (fp == nil) {
        return nil;
    }
    
    CC_SHA256_CTX hashCtx;
    CC_SHA256_Init(&hashCtx);
    
    while (YES) {
        @autoreleasepool {
            NSData *data = [fp readDataOfLength:FileHashDefaultChunkSizeForReadingData];
            
            CC_SHA256_Update(&hashCtx, data.bytes, (CC_LONG)data.length);
            
            if (data.length == 0) {
                break;
            }
        }
    }
    [fp closeFile];
    
    uint8_t buffer[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256_Final(buffer, &hashCtx);
    
    return [self stringFromBytes:buffer length:CC_SHA256_DIGEST_LENGTH];
}

- (NSString *)fileSHA512Hash {
    NSFileHandle *fp = [NSFileHandle fileHandleForReadingAtPath:self];
    if (fp == nil) {
        return nil;
    }
    
    CC_SHA512_CTX hashCtx;
    CC_SHA512_Init(&hashCtx);
    
    while (YES) {
        @autoreleasepool {
            NSData *data = [fp readDataOfLength:FileHashDefaultChunkSizeForReadingData];
            
            CC_SHA512_Update(&hashCtx, data.bytes, (CC_LONG)data.length);
            
            if (data.length == 0) {
                break;
            }
        }
    }
    [fp closeFile];
    
    uint8_t buffer[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512_Final(buffer, &hashCtx);
    
    return [self stringFromBytes:buffer length:CC_SHA512_DIGEST_LENGTH];
}

#pragma mark - 助手方法
/**
 *  返回二进制 Bytes 流的字符串表示形式
 *
 *  @param bytes  二进制 Bytes 数组
 *  @param length 数组长度
 *
 *  @return 字符串表示形式
 */
- (NSString *)stringFromBytes:(uint8_t *)bytes length:(int)length {
    NSMutableString *strM = [NSMutableString string];
    
    for (int i = 0; i < length; i++) {
        [strM appendFormat:@"%02x", bytes[i]];
    }
    
    return [strM copy];
}


- (NSString *)base64String
{
    if (self && ![self isEqualToString:LocalStr_None]) {
        NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
        return [self base64EncodedStringFrom:data];
    }
    else {
        return LocalStr_None;
    }
}

- (NSString *)fromBase64String
{
    if (self && ![self isEqualToString:LocalStr_None]) {
        NSData *data = [self dataWithBase64EncodedString:self];
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    else {
        return LocalStr_None;
    }
}

/******************************************************************************
 函数名称 : + (NSString *)base64EncodedStringFrom:(NSData *)data
 函数描述 : 文本数据转换为base64格式字符串
 输入参数 : (NSData *)data
 输出参数 : N/A
 返回参数 : (NSString *)
 备注信息 :
 ******************************************************************************/
- (NSString *)base64EncodedStringFrom:(NSData *)data
{
    if ([data length] == 0)
        return @"";
    
    char *characters = malloc((([data length] + 2) / 3) * 4);
    if (characters == NULL)
        return nil;
    NSUInteger length = 0;
    
    NSUInteger i = 0;
    while (i < [data length])
    {
        char buffer[3] = {0,0,0};
        short bufferLength = 0;
        while (bufferLength < 3 && i < [data length])
            buffer[bufferLength++] = ((char *)[data bytes])[i++];
        
        //  Encode the bytes in the buffer to four characters, including padding "=" characters if necessary.
        characters[length++] = encodingTable[(buffer[0] & 0xFC) >> 2];
        characters[length++] = encodingTable[((buffer[0] & 0x03) << 4) | ((buffer[1] & 0xF0) >> 4)];
        if (bufferLength > 1)
            characters[length++] = encodingTable[((buffer[1] & 0x0F) << 2) | ((buffer[2] & 0xC0) >> 6)];
        else characters[length++] = '=';
        if (bufferLength > 2)
            characters[length++] = encodingTable[buffer[2] & 0x3F];
        else characters[length++] = '=';
    }
    
    return [[NSString alloc] initWithBytesNoCopy:characters length:length encoding:NSASCIIStringEncoding freeWhenDone:YES];
}
/******************************************************************************
 函数名称 : + (NSData *)dataWithBase64EncodedString:(NSString *)string
 函数描述 : base64格式字符串转换为文本数据
 输入参数 : (NSString *)string
 输出参数 : N/A
 返回参数 : (NSData *)
 备注信息 :
 ******************************************************************************/
- (NSData *)dataWithBase64EncodedString:(NSString *)string
{
    if (string == nil)
        [NSException raise:NSInvalidArgumentException format:@""];
    if ([string length] == 0)
        return [NSData data];
    
    static char *decodingTable = NULL;
    if (decodingTable == NULL)
    {
        decodingTable = malloc(256);
        if (decodingTable == NULL)
            return nil;
        memset(decodingTable, CHAR_MAX, 256);
        NSUInteger i;
        for (i = 0; i < 64; i++)
            decodingTable[(short)encodingTable[i]] = i;
    }
    
    const char *characters = [string cStringUsingEncoding:NSASCIIStringEncoding];
    if (characters == NULL)     //  Not an ASCII string!
        return nil;
    char *bytes = malloc((([string length] + 3) / 4) * 3);
    if (bytes == NULL)
        return nil;
    NSUInteger length = 0;
    
    NSUInteger i = 0;
    while (YES)
    {
        char buffer[4];
        short bufferLength;
        for (bufferLength = 0; bufferLength < 4; i++)
        {
            if (characters[i] == '\0')
                break;
            if (isspace(characters[i]) || characters[i] == '=')
                continue;
            buffer[bufferLength] = decodingTable[(short)characters[i]];
            if (buffer[bufferLength++] == CHAR_MAX)      //  Illegal character!
            {
                free(bytes);
                return nil;
            }
        }
        
        if (bufferLength == 0)
            break;
        if (bufferLength == 1)      //  At least two characters are needed to produce one byte!
        {
            free(bytes);
            return nil;
        }
        
        //  Decode the characters in the buffer to bytes.
        bytes[length++] = (buffer[0] << 2) | (buffer[1] >> 4);
        if (bufferLength > 2)
            bytes[length++] = (buffer[1] << 4) | (buffer[2] >> 2);
        if (bufferLength > 3)
            bytes[length++] = (buffer[2] << 6) | buffer[3];
    }
    
    bytes = realloc(bytes, length);
    return [NSData dataWithBytesNoCopy:bytes length:length];
}

+(NSString *) compareCurrentTime:(NSTimeInterval) compareDate{
    NSDate *confromTimesp   = [NSDate dateWithTimeIntervalSince1970:compareDate/1000];
    
    NSTimeInterval  timeInterval = [confromTimesp timeIntervalSinceNow];
    timeInterval = -timeInterval;
    long temp = 0;
    NSString *result;
    
    NSCalendar *calendar     = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags      = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents*referenceComponents=[calendar components:unitFlags fromDate:confromTimesp];
    NSInteger referenceHour  =referenceComponents.hour;
    
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp= timeInterval/60) < 60){
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
    }
    
    else if((temp = timeInterval/3600) <24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    }
    else if ((temp = timeInterval/3600/24)==1)
    {
        result = [NSString stringWithFormat:@"昨天%ld时",(long)referenceHour];
    }
    else if ((temp = timeInterval/3600/24)==2)
    {
        result = [NSString stringWithFormat:@"前天%ld时",(long)referenceHour];
    }
    
    else if((temp = timeInterval/3600/24) <31){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }
    
    else if((temp = timeInterval/3600/24/30) <12){
        result = [NSString stringWithFormat:@"%ld个月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    
    return  result;
}
+ (NSString*) getDateStringWithTimestamp:(NSTimeInterval)timestamp{
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp/1000];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents*referenceComponents=[calendar components:unitFlags fromDate:confromTimesp];
    NSInteger referenceYear  =referenceComponents.year;
    NSInteger referenceMonth =referenceComponents.month;
    NSInteger referenceDay   =referenceComponents.day;
    
    return [NSString stringWithFormat:@"%ld年%ld月%ld日",referenceYear,(long)referenceMonth,(long)referenceDay];
}



+ (NSString*) getStringWithTimestamp:(NSTimeInterval)timestamp formatter:(NSString*)formatter{
    if ([NSString stringWithFormat:@"%@", @(timestamp)].length == 13) {
        timestamp /= 1000.0f;
    }
    NSDate*timestampDate = [NSDate dateWithTimeIntervalSince1970:timestamp];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    NSString *strDate = [dateFormatter stringFromDate:timestampDate];
    
    return strDate;
}

- (NSString *)valueWithURLParamName:(NSString *)paramName
{
    NSError *error;
    NSString *regTags=[[NSString alloc] initWithFormat:@"(^|&|\\?)+%@=+([^&]*)(&|$)",paramName];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regTags
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    
    NSArray *matches = [regex matchesInString:self options:0 range:NSMakeRange(0, [self length])];
    for (NSTextCheckingResult *match in matches) {
        NSString *tagValue = [self substringWithRange:[match rangeAtIndex:2]];
        return tagValue;
    }
    return nil;
}

-(NSString *)decode {
    
    CFStringRef ref = CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                              (__bridge CFStringRef) self,
                                                                              CFSTR(""),
                                                                              kCFStringEncodingUTF8);
    
    NSString *decodeStr = [NSString stringWithFormat:@"%@", ref];
    
    CFRelease(ref);
    
    return decodeStr;
    //    return (__bridge NSString *) CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
    //                                                                                         (__bridge CFStringRef) self,
    //                                                                                         CFSTR(""),
    //                                                                                         kCFStringEncodingUTF8);
}

- (NSString *)URLEncode
{
    NSString *encodedString = (__bridge NSString *)
    CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                            (CFStringRef)self,
                                            NULL,
                                            (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                            kCFStringEncodingUTF8);
    return encodedString;
}

+(NSString *) jsonStringWithString:(NSString *) string{
    return [NSString stringWithFormat:@"\"%@\"",
            [[string stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"] stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""]
            ];
}

+(NSString *) jsonStringWithArray:(NSArray *)array{
    NSMutableString *reString = [NSMutableString string];
    [reString appendString:@"["];
    NSMutableArray *values = [NSMutableArray array];
    for (id valueObj in array) {
        NSString *value = [NSString jsonStringWithObject:valueObj];
        if (value) {
            [values addObject:[NSString stringWithFormat:@"%@",value]];
        }
    }
    [reString appendFormat:@"%@",[values componentsJoinedByString:@","]];
    [reString appendString:@"]"];
    return reString;
}

+(NSString *) jsonStringWithDictionary:(NSDictionary *)dictionary{
    NSArray *keys = [dictionary allKeys];
    NSMutableString *reString = [NSMutableString string];
    [reString appendString:@"{"];
    NSMutableArray *keyValues = [NSMutableArray array];
    for (int i=0; i<[keys count]; i++) {
        NSString *name = [keys objectAtIndex:i];
        id valueObj = [dictionary objectForKey:name];
        NSString *value = [NSString jsonStringWithObject:valueObj];
        if (value) {
            [keyValues addObject:[NSString stringWithFormat:@"\"%@\":%@",name,value]];
        }
    }
    [reString appendFormat:@"%@",[keyValues componentsJoinedByString:@","]];
    [reString appendString:@"}"];
    return reString;
}

+(NSString *) jsonStringWithObject:(id) object{
    NSString *value = nil;
    if (!object) {
        return value;
    }
    if ([object isKindOfClass:[NSString class]]) {
        value = [NSString jsonStringWithString:object];
    }else if([object isKindOfClass:[NSDictionary class]]){
        value = [NSString jsonStringWithDictionary:object];
    }else if([object isKindOfClass:[NSArray class]]){
        value = [NSString jsonStringWithArray:object];
    }
    return value;
}

+(NSString *) genUUID
{
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    
    CFRelease(uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString*)uuid_string_ref];
    
    CFRelease(uuid_string_ref);
    
    uuid = [uuid stringByReplacingOccurrencesOfString: @"-" withString: @""];
    
    return uuid;
}
/**
 字符串去空格
 
 @return 字符串去换行符
 */
- (NSString*)trimLineFeed{
    
    return  [[self stringByReplacingOccurrencesOfString:@"\r" withString:@""] stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
}

/**
 字符串去空格
 
 @return vaule
 */
- (NSString*)trimWhiteSpace{
    
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

/**
 字符串去空格和换行符
 
 @return value
 */
- (NSString*)trimStr{
    return [[self trimLineFeed] trimWhiteSpace];
    
}


- (BOOL)isNotEmpty{
    if (self && [self isKindOfClass:[NSString class]] && self.length > 0) {
        return  [self isEqualToString:@"<null>"]? NO:YES;
    }
    return NO;
}

+ (CGSize)labelAutoCalculateRectWith:(NSString*)text FontSize:(CGFloat)fontSize MaxSize:(CGSize)maxSize
{
    
    NSMutableParagraphStyle* paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    
    paragraphStyle.lineBreakMode=NSLineBreakByWordWrapping;
    
    NSDictionary* attributes =@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize],NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGSize labelSize = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;
    
    labelSize.height=ceil(labelSize.height);
    
    labelSize.width=ceil(labelSize.width);
    
    return labelSize;
}

- (NSString *)dateStringWithTimeStamp
{
    NSTimeInterval time = [self doubleValue]/1000.00;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy/MM/dd";
    return [formatter stringFromDate:date];
}

- (NSString *)bankNoDesensitization {
    if (self.length>8) {
        
        return [NSString stringWithFormat:@"%@ **** **** %@", [self substringToIndex:3], [self substringFromIndex:self.length-4]];
    }
    return [self copy];
}

- (NSString*) phoneNoDesensitization{
    if (self.length==11) {
        NSMutableString *newStr = [NSMutableString stringWithString:self];
        NSRange range = NSMakeRange(3, 7);
        [newStr replaceCharactersInRange:range withString:@"*****"];
        return newStr;
    }
    return nil;
}

/**
 格式化手机号
 
 @param phoneNo 13333333333
 @return 133-3333-3333
 */
+ (NSString*) phoneNoFormat:(NSString *)phoneNo{
    if (phoneNo.length==11) {
        NSMutableString* value = [[NSMutableString alloc] initWithString:phoneNo];
        [value insertString:@"-" atIndex:3];
        [value insertString:@"-" atIndex:8];
        return value;
    }
    return nil;
}

#pragma mark ======== 字符串后几位展示 ========
- (NSString *)stringLastLength:(NSUInteger)num; {
    if (self.length>num) {
        
        return [NSString stringWithFormat:@"%@", [self substringFromIndex:self.length-num]];
    }
    return [self copy];
}



+ (NSString *)getIPAddress {
    
    NSString *address = @"";
    
    struct ifaddrs *interfaces = NULL;
    
    struct ifaddrs *temp_addr = NULL;
    
    int success = 0;
    
    // retrieve the current interfaces - returns 0 on success
    
    success = getifaddrs(&interfaces);
    
    if (success == 0) {
        
        // Loop through linked list of interfaces
        
        temp_addr = interfaces;
        
        while(temp_addr != NULL) {
            
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                
                // Check if interface is en0 which is the wifi connection on the iPhone
                
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    
                    // Get NSString from C String
                    
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
                
            }
            
            temp_addr = temp_addr->ifa_next;
            
        }
        
    }
    
    // Free memory
    
    freeifaddrs(interfaces);
    
    return address;
    
}
+ (NSString *)getRandomStringWithNum:(NSInteger)num{
    NSString *string = [[NSString alloc]init];
    for (int i = 0; i < num; i++) {
        int number = arc4random() % 36;
        if (number < 10) {
            int figure = arc4random() % 10;
            NSString *tempString = [NSString stringWithFormat:@"%d", figure];
            string = [string stringByAppendingString:tempString];
        }else {
            int figure = (arc4random() % 26) + 97;
            char character = figure;
            NSString *tempString = [NSString stringWithFormat:@"%c", character];
            string = [string stringByAppendingString:tempString];
        }
    }
    return string;
}

+ (NSMutableAttributedString *)makeMuAttributedStr:(NSString *)str fontSize:(CGFloat)fontSize color:(UIColor *)color{
    
    
    NSMutableAttributedString *ats = [[NSMutableAttributedString alloc]initWithString:str attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:fontSize],NSFontAttributeName,color,NSForegroundColorAttributeName, nil]];
    return ats;
}


+ (NSMutableAttributedString *)spacingWithStr:(NSString *)str characterSpac:(NSNumber  * _Nullable )spac lineSpac:(CGFloat )lineSpac{
    
    //设置字间距
    NSDictionary *dic = [NSDictionary dictionary];
    if (spac == NULL) {
        dic = @{NSKernAttributeName:@1.f};
    }else{
        dic = @{NSKernAttributeName:spac};
    };
    
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:str attributes:dic];
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:lineSpac];//行间距
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
    
    return attributedString;
}

#pragma mark - 计算字符串尺寸
-(CGFloat)heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width
{
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    return  [self boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size.height;
}

- (CGFloat) widthWithFontSize:(CGFloat)fontSize height:(CGFloat)maxHeight
{
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    return  [self boundingRectWithSize:CGSizeMake(0, maxHeight) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size.width;
}

#pragma mark - Emoji相关
/**
 *
 判断是否是Emoji
 *
 * @return YES 是 NO 不是
 */
- (BOOL)isEmoji {
    const unichar high = [self characterAtIndex: 0];
    // Surrogate pair (U+1D000-1F77F)
    if (0xd800 <= high && high <= 0xdbff) {
        const unichar low = [self characterAtIndex: 1];
        const int codepoint = ((high - 0xd800) * 0x400) + (low - 0xdc00) + 0x10000;
        return (0x1d000 <= codepoint && codepoint <= 0x1f77f);
        // Not surrogate pair (U+2100-27BF)
        
    } else {
        return (0x2100 <= high && high <= 0x27bf);
    }
    
}

/**
 * 判断字符串时候含有Emoji
 *
 * @return YES 是 NO 不是
 */ - (BOOL)isIncludingEmoji {
     BOOL __block result = NO;
     [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock: ^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop) {
         if ([substring isEmoji]) {
             *stop = YES;
             result = YES;
             
         }
         
     }];
     return result;
     
 }
/**
 * 移除掉字符串中得Emoji
 *
 * @return 得到移除Emoji后的string
 */ - (instancetype)removedEmojiString {
     NSMutableString* __block buffer = [NSMutableString stringWithCapacity:[self length]]; [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock: ^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop) {
         
         [buffer appendString:([substring isEmoji])? @"": substring];
         
     }];
     return buffer;
     
 }



@end

