//
//  UIDevice+Help.m
//  
//
//  Created by administrator on 16/8/16.
//  Copyright © 2016年 whadun. All rights reserved.
//

#import "UIDevice+Help.h"

@implementation UIDevice (Help)

- (NSString *)isJailbroken {
    NSString *jailbroken = @"F";
    NSString *cydiaPath = @"/Applications/Cydia.app";
    NSString *aptPath = @"/private/var/lib/apt/";
    if([[NSFileManager defaultManager] fileExistsAtPath:cydiaPath]) {
            jailbroken = @"T";
        }
    if([[NSFileManager defaultManager] fileExistsAtPath:aptPath]) {
            jailbroken = @"T";
        }
    return jailbroken;
}

@end
