//
//  HSToastTool.h
//  YaYa
//
//  Created by a58 on 2021/12/29.
//  Copyright © 2021 msxf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView+HSToast.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, HSToastToolPositionType) {
    HSToastToolPositionTypeCenter = 0,
    HSToastToolPositionTypeTop,
    HSToastToolPositionTypeBottom,
};

typedef NS_ENUM(NSInteger, HSToastToolStatusType) {
    HSToastToolStatusSuccess = 0,
    HSToastToolStatusFail,
    HSToastToolStatusInfo,
    HSToastToolStatusDefault,
    HSToastToolStatusLoading,


};

@interface HSToastTool : NSObject

+ (void)makeToast:(NSString *)message;
+ (void)makeToast:(NSString *)message status:(HSToastToolStatusType)status;
+ (void)makeToast:(NSString *)message status:(HSToastToolStatusType)status position:(HSToastToolPositionType)position;
+ (void)makeToast:(NSString *)message status:(HSToastToolStatusType)status position:(HSToastToolPositionType)position duration:(NSTimeInterval)duration;

+ (void)makeToast:(NSString *)message image:(UIImage *)image status:(HSToastToolStatusType)status position:(HSToastToolPositionType)position duration:(NSTimeInterval)duration;

+ (void)makeToast:(NSString *)message image:(UIImage *)image status:(HSToastToolStatusType)status position:(HSToastToolPositionType)position duration:(NSTimeInterval)duration style:(HSToastStyle *)style;
@end

NS_ASSUME_NONNULL_END
