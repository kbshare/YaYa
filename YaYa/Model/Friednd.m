//
//  Friednd.m
//  weixin
//
//  Created by zhiwei on 16/1/11.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "Friednd.h"

@implementation Friednd


-(instancetype)initWithDic:(NSDictionary *)dic{
    
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}

+(instancetype)friendsModelWithDic:(NSDictionary *)dic{
    
    return [[self alloc] initWithDic:dic];
}

@end
