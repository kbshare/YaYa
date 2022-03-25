//
//  UITextField+MSJROperText.m
//  Finance
//
//  Created by xialv on 16/9/20.
//  Copyright © 2016年 MaShang Consumer Finance. All rights reserved.
//

#import "UITextField+MSJROperText.h"
#import <objc/runtime.h>
static const char *Maxlen ="MaxRG";
static const char *Minlen ="MinRG";
static const char *opera  ="Opera";
@implementation UITextField (MSJROperText)
@dynamic MaxLength;
@dynamic minLength;
@dynamic oper;

-(void)handleTarget:(id)Target andOpera:(UITextField*)oper andControlMax:(NSString*)Maxlen andControlMin:(NSString*)minLen{
    oper.MaxLength = Maxlen;
    oper.minLength = minLen;
    oper.oper = Target;
    [self addTarget:oper  action:@selector(valueChange) forControlEvents:UIControlEventEditingChanged];
}
-(void)valueChange{
    
    //有范围的调用方法
    if (!([self.minLength intValue] ==0)) {
        if (self.text.length >[self.MaxLength intValue]) {
            self.text = [self.text substringToIndex:[self.MaxLength intValue]];
        }
        if (self.text.length >=[self.minLength intValue] &&self.text.length <= [self.MaxLength intValue]){

            //正则表达式
            if ([self.oper respondsToSelector:@selector(CanState:and:)]) {
                         [self.oper CanState:YES and:self];
            }
   
        }else{
            NSLog(@"%@",self.oper);
            if ([self.oper respondsToSelector:@selector(CanState:and:)]) {
                      [self.oper CanState:NO and:self];
            }
        }
    }else{
        //无范围有最大值
        if (self.text.length > [self.MaxLength intValue]) {
            self.text =[self.text substringToIndex:[self.MaxLength intValue]];
        }
        if (self.text.length == [self.MaxLength intValue]) {
            if ([self.oper respondsToSelector:@selector(CanState:and:)]) {
                          [self.oper CanState:YES and:self];
            }
        }else{
            if ([self.oper respondsToSelector:@selector(CanState:and:)]) {
                            [self.oper CanState:NO and:self];
            }
        }
    }
}
-(void)setMaxLength:(NSString*)MaxLength{
    objc_setAssociatedObject(self, Maxlen, MaxLength, OBJC_ASSOCIATION_RETAIN);
}
-(NSString*)MaxLength{
    return objc_getAssociatedObject(self, Maxlen);
}
-(void)setMinLength:(NSString*)minLength{
    objc_setAssociatedObject(self, Minlen, minLength, OBJC_ASSOCIATION_RETAIN);
}
-(NSString*)minLength{
    return objc_getAssociatedObject(self , Minlen);
}
-(void)setOper:(id<CanState>)oper{
    objc_setAssociatedObject(self ,opera, oper, OBJC_ASSOCIATION_ASSIGN);
}
-(id<CanState>)oper{
    return objc_getAssociatedObject(self, opera);
}

@end
