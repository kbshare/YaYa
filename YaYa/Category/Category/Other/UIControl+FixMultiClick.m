//
//  UIControl+FixMultiClick.m
//  ayh
//
//  Created by administrator on 2017/2/23.
//  Copyright © 2017年 com.msxf. All rights reserved.
//

#import "UIControl+FixMultiClick.h"
#import <objc/runtime.h>

@implementation UIControl (FixMultiClick)

// 因category不能添加属性，只能通过关联对象的方式。
static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";

- (NSTimeInterval)cs_acceptEventInterval {
    return  [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}

- (void)setCs_acceptEventInterval:(NSTimeInterval)cs_acceptEventInterval {
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(cs_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

static const char *UIControl_acceptEventTime = "UIControl_acceptEventTime";

- (NSTimeInterval)cs_acceptEventTime {
    return  [objc_getAssociatedObject(self, UIControl_acceptEventTime) doubleValue];
}

- (void)setCs_acceptEventTime:(NSTimeInterval)cs_acceptEventTime {
    objc_setAssociatedObject(self, UIControl_acceptEventTime, @(cs_acceptEventTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


// 在load时执行hook
+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(sendAction:to:forEvent:);
        SEL swizzledSelector = @selector(cs_sendAction:to:forEvent:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (success) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}
- (void)cs_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if ([NSDate date].timeIntervalSince1970 - self.cs_acceptEventTime < self.cs_acceptEventInterval) {
        return;
    }
    
    if (self.cs_acceptEventInterval > 0) {
        self.cs_acceptEventTime = [NSDate date].timeIntervalSince1970;
    }
    
    [self cs_sendAction:action to:target forEvent:event];
}

@end
