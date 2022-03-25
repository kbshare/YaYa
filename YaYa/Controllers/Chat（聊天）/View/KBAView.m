//
//  KBAView.m
//  YaYa
//
//  Created by KBMore on 2020/1/19.
//  Copyright © 2020 msxf. All rights reserved.
//

#import "KBAView.h"

@implementation KBAView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    UIView *view = [super hitTest:point withEvent:event];
//
//    NSLog(@"%@",[self class]);
//    return view;
    
    UIView *view = [super hitTest:point withEvent:event];
    if (view == self) {
        return nil;
    }
    return view;
}
//
//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
//
//
//}
@end
