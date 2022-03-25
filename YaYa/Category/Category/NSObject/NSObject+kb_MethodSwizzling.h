//
//  NSObject+kb_MethodSwizzling.h
//  runtimeMethodSwizzled
//
//  Created by administrator on 2016/11/24.
//  Copyright © 2016年 zhangyawei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (kb_MethodSwizzling)

/**
load中dispatch调用一次方法交换
 */
+ (void)kb_methodSwizzlingWithOriginalSelector:(SEL)originalSelector bySwizzledSelector:(SEL)swizzledSelector;
@end
