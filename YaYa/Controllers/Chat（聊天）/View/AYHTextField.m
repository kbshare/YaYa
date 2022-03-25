//
//  AYHTextField.m
//  ayh
//
//  Created by KBMore on 2019/8/26.
//  Copyright © 2019 com.msxf. All rights reserved.
//

#import "AYHTextField.h"
#import "UIView+Frame.h"
@implementation AYHTextField

//- (CGRect)leftViewRectForBounds:(CGRect)bounds {
//    CGRect leftRect = [super leftViewRectForBounds:bounds];
//    leftRect.origin.x = self.width - self.rightView.width - self.leftView.width - FIT(26);
//    return leftRect;
//}
//
//- (CGRect)rightViewRectForBounds:(CGRect)bounds {
//    CGRect rightRect = [super rightViewRectForBounds:bounds];
//    rightRect.origin.x -= FIT(6); //左边偏10
//    return rightRect;
//}
//
//
//
////UITextField 文字与输入框的距离
//- (CGRect)textRectForBounds:(CGRect)bounds{
//    return CGRectInset(bounds, 0, 0);
//
//}
////控制编辑文本的位置
//- (CGRect)editingRectForBounds:(CGRect)bounds{
//    return CGRectInset(bounds, 0, 0);
//}

- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin.x += 15; //向右边偏15
    return iconRect;
}


- (CGRect)rightViewRectForBounds:(CGRect)bounds
{
    CGRect iconRect = [super rightViewRectForBounds:bounds];
    iconRect.origin.x -= 50; //向右边偏15
    return iconRect;
}

//UITextField 文字与输入框的距离
- (CGRect)textRectForBounds:(CGRect)bounds{
    
    return CGRectInset(bounds, 50, 0);
    
}

//控制文本的位置
- (CGRect)editingRectForBounds:(CGRect)bounds{
    
    return CGRectInset(bounds, 90, 0);
}



@end
