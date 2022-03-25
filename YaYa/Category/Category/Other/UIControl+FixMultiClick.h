//
//  UIControl+FixMultiClick.h
//  ayh
//
//  Created by administrator on 2017/2/23.
//  Copyright © 2017年 com.msxf. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIControl (FixMultiClick)

///设置允许重复点击时间的间隔
@property (nonatomic, assign) NSTimeInterval cs_acceptEventInterval;

@property (nonatomic, assign) NSTimeInterval cs_acceptEventTime;
@end
