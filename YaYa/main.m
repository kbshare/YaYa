//
//  main.m
//  weixin
//
//  Created by zhiwei on 16/1/11.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface Sark : NSObject
@end
@implementation Sark
@end

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        BOOL resl = [(id)[NSObject class] isKindOfClass:[NSObject class]];
        BOOL res2 = [(id)[NSObject class] isMemberOfClass:[NSObject class]];
        BOOL res3 = [(id)[Sark class] isKindOfClass:[Sark class]];
        BOOL res4 = [(id)[Sark class] isMemberOfClass :[Sark class]];
        NSLog(@"%d %d %d %d", resl, res2, res3, res4);
        
        
        BOOL res5 = [[NSObject class] isKindOfClass:[NSObject class]];
        BOOL res6 = [[NSObject class] isMemberOfClass:[NSObject class]];
        BOOL res7 = [[Sark class] isKindOfClass:[Sark class]];
        BOOL res8 = [[Sark class] isMemberOfClass :[Sark class]];
        NSLog(@"%d %d %d %d", resl, res2, res3, res4);

        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}





