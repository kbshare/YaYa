//
//  NSTimer+KBCycleHelper.h
//  YaYa
//
//  Created by yawei.zhang on 2020/12/30.
//  Copyright © 2020 msxf. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (KBCycleHelper)
+ (NSTimer *)kb_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)())block;
@end

NS_ASSUME_NONNULL_END
