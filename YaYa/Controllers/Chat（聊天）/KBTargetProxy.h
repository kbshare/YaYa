//
//  KBTargetProxy.h
//  YaYa
//
//  Created by yawei.zhang on 2020/12/30.
//  Copyright © 2020 msxf. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KBTargetProxy : NSProxy
@property (nonatomic, weak) id target;


+(KBTargetProxy *)proxyWithTarget:(id)target;

- (instancetype)initWithTarget:(id)target;


@end

NS_ASSUME_NONNULL_END
