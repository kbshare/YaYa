//
//  KBBView.m
//  YaYa
//
//  Created by KBMore on 2020/1/19.
//  Copyright © 2020 msxf. All rights reserved.
//

#import "KBBView.h"

@implementation KBBView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *view = [super hitTest:point withEvent:event];

    NSLog(@"%@",[self class]);
    return view;
    
//    UIView *view = [super hitTest:point withEvent:event];
//    if (view == self) {
//        return nil;
//    }
//    return view;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
