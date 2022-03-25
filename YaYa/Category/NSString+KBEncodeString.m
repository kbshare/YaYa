//
//  NSString+KBEncodeString.m
//  YaYa
//
//  Created by KBMore on 2021/4/7.
//  Copyright © 2021 msxf. All rights reserved.
//

#import "NSString+KBEncodeString.h"

@implementation NSString (KBEncodeString)
- (NSString *) m80StringByURLEncoding{
    
    static NSString * const kM80LegalCharactersToBeEscaped = @"?!@#$^&%*+=,:;'\"`<>()[]{}/\\|~ ";
    
    return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                 (__bridge  CFStringRef)self,
                                                                                 NULL,
                                                                                 (__bridge CFStringRef)kM80LegalCharactersToBeEscaped,
                                                                                 kCFStringEncodingUTF8);
}
@end
