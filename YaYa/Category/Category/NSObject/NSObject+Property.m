//
//  NSObject+Property.m
//  ayh
//
//  Created by administrator on 2016/11/4.
//  Copyright © 2016年 MaShang Consumer Finance. All rights reserved.
//

#import "NSObject+Property.h"
#import <objc/runtime.h>

static char  * propertyKey = "NSObjectPropertyKey";

@implementation NSObject (Property)

- (void)setAssociatedProperty:(id)associatedProperty
{
    objc_setAssociatedObject(self, propertyKey, associatedProperty, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)associatedProperty
{
    return objc_getAssociatedObject(self, propertyKey);
}

@end
