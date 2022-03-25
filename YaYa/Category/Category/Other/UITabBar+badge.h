//
//  UITabBar+badge.h
//  ayh
//
//  Created by xialv on 2017/7/28.
//  Copyright © 2017年 com.msxf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (badge)
- (void)showBadgeOnItemIndex:(int)index;
- (void)hideBadgeOnItemIndex:(int)index;
-(BOOL)haveMsg:(int)index;
@end
