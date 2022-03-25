//
//  NSTimer+KBCycleHelper.m
//  YaYa
//
//  Created by yawei.zhang on 2020/12/30.
//  Copyright © 2020 msxf. All rights reserved.
//

#import "NSTimer+KBCycleHelper.h"

@implementation NSTimer (KBCycleHelper)

+ (NSTimer *)kb_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)())block{
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(timerFunc:) userInfo:[block copy] repeats:repeats];
    return  timer;
    
}

+ (void)timerFunc:(NSTimer *)timer{
    if (timer.userInfo) {
        void (^block)() =  timer.userInfo;
        block();
    }
}

@end
