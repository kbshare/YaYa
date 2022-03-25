//
//  KBTapGes.m
//  YaYa
//
//  Created by yawei.zhang on 2021/2/19.
//  Copyright © 2021 msxf. All rights reserved.
//

#import "KBTapGes.h"

@implementation KBTapGes

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//
//
//}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    
    NSLog(@"手势");
    return YES;
}
@end
