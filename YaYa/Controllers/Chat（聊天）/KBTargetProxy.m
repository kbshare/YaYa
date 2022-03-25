//
//  KBTargetProxy.m
//  YaYa
//
//  Created by yawei.zhang on 2020/12/30.
//  Copyright © 2020 msxf. All rights reserved.
//

#import "KBTargetProxy.h"

@interface KBTargetProxy ()
@end

@implementation KBTargetProxy

+(KBTargetProxy *)proxyWithTarget:(id)target{
    KBTargetProxy *proxy =  [[KBTargetProxy alloc]initWithTarget:target];
    proxy.target = target;
    return proxy;
}

- (instancetype)initWithTarget:(id)target
{
    _target = target;
    return self;
}


#pragma mark -方案2  使用消息接受者重定向  methodSignatureForSelector forwardInvocation
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    if (self.target) {
        return [self.target methodSignatureForSelector:sel];
    }else{
        NSLog(@"收集bug");
    }
    return nil;
}

- (void)forwardInvocation:(NSInvocation *)invocation{
    if (self.target) {
        [self.target forwardInvocation:invocation];
    }else{
        NSLog(@"收集bug");
    }
}

#pragma mark -方案1  消息重定向  forwardingTargetForSelector
- (id) forwardingTargetForSelector:(SEL)sel{

    return nil;
}

@end
