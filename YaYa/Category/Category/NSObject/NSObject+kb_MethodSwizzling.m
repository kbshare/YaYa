//
//  NSObject+kb_MethodSwizzling.m
//  runtimeMethodSwizzled
//
//  Created by administrator on 2016/11/24.
//  Copyright © 2016年 zhangyawei. All rights reserved.
//

#import "NSObject+kb_MethodSwizzling.h"
#import <objc/runtime.h>
@implementation NSObject (kb_MethodSwizzling)
+ (void)kb_methodSwizzlingWithOriginalSelector:(SEL)originalSelector bySwizzledSelector:(SEL)swizzledSelector{
    Class class = [self class];
    //原有方法
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    //新方法
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    //尝试给SEL添加IMP,这里避免源SEL没有实现IMP的情况
    BOOL didAddMethod = class_addMethod(class,originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {//添加成功:源SEL没有实现IMP,将源SEL的IMP替换到交换SEL的IMP
        class_replaceMethod(class,swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {//添加失败:如果源SEL已经有IMP,直接将两个SEL的IMP交换
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }

}
@end
