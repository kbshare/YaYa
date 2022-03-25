//
//  NSString+KBFilePath.m
//  HMObjcSugar
//
//  Created by administrator on 2016/11/4.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "NSString+KBFilePath.h"

@implementation NSString (KBFilePath)
- (NSString *)kb_documentDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:self];
}

- (NSString *)kb_cacheDirecotry {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:self];
}

- (NSString *)kb_tmpDirectory {
    return [NSTemporaryDirectory() stringByAppendingPathComponent:self];
}
@end
