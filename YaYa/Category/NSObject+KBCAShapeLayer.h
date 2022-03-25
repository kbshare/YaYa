//
//  NSObject+KBCAShapeLayer.h
//  YaYa
//
//  Created by administrator on 2018/11/26.
//  Copyright © 2018年 msxf. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (KBCAShapeLayer)
+ (instancetype)createMaskLayerWithView : (UIView *)view;
@end

NS_ASSUME_NONNULL_END
