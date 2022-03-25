//
//  UITextField+Limit.m
//  Finance
//
//  Created by admin on 16/3/18.
//  Copyright © 2016年 MSFINANCE. All rights reserved.
//

#import "UITextField+Limit.h"
#import <objc/runtime.h>

static void *TextFieldLength = &TextFieldLength;
static void *TextFieldRex = &TextFieldRex;
static void *TextFieldLast = &TextFieldLast;
static void *TextFieldBlock = &TextFieldBlock;

typedef BOOL(^RexBlock)(NSString *);

@implementation UITextField (Limit)

- (void)limitWitLength:(int)length {
    objc_setAssociatedObject(self, TextFieldLength, @(length), OBJC_ASSOCIATION_RETAIN);
    [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

- (void)textFieldDidChange:(UITextField *)textField {
    NSString  *lang = [[textField textInputMode] primaryLanguage];
    if ([lang isEqualToString:@"zh-Hans"]) {
        UITextRange *selectedRange = [textField markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        if (!position) {
            NSNumber *length = objc_getAssociatedObject(self, TextFieldLength);
            if (textField.text.length > [length integerValue]) {
                textField.text = [textField.text substringToIndex:[length integerValue]];
            }
        }
    } else {
        NSNumber *length = objc_getAssociatedObject(self, TextFieldLength);
        if (textField.text.length > [length integerValue]) {
            textField.text = [textField.text substringToIndex:[length integerValue]];
        }
    }
}

- (void)limitWitRex:(NSString *)rex {
    objc_setAssociatedObject(self, TextFieldRex, rex, OBJC_ASSOCIATION_COPY);
    objc_setAssociatedObject(self, TextFieldLast, @"", OBJC_ASSOCIATION_COPY);
    [self addTarget:self action:@selector(textFieldDidChangeForRex:) forControlEvents:UIControlEventEditingChanged];
    
}

- (void)textFieldDidChangeForRex:(UITextField *)textField {
    NSString  *lang = [[textField textInputMode] primaryLanguage];
    if ([lang isEqualToString:@"zh-Hans"]) {
        UITextRange *selectedRange = [textField markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        if (!position) {
            NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", objc_getAssociatedObject(self, TextFieldRex)];
            if ([numberPre evaluateWithObject:textField.text]) {
                objc_setAssociatedObject(self, TextFieldLast, textField.text, OBJC_ASSOCIATION_COPY);
            } else {
                textField.text = objc_getAssociatedObject(self, TextFieldLast);
            }
        }
    } else {
        NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", objc_getAssociatedObject(self, TextFieldRex)];
        if ([numberPre evaluateWithObject:textField.text]) {
            objc_setAssociatedObject(self, TextFieldLast, textField.text, OBJC_ASSOCIATION_COPY);
        } else {
            textField.text = objc_getAssociatedObject(self, TextFieldLast);
        }
    }


}

- (void)dylimitWithRex:(BOOL(^)(NSString *str))block {
    objc_setAssociatedObject(self, TextFieldBlock, block, OBJC_ASSOCIATION_COPY);
    [self addTarget:self action:@selector(dytextFieldDidChangeForRex:) forControlEvents:UIControlEventEditingChanged];
}

- (void)dytextFieldDidChangeForRex:(UITextField *)textField {
    RexBlock block = objc_getAssociatedObject(self, TextFieldBlock);
    BOOL isValid =  block(textField.text);
    if (isValid) {
        objc_setAssociatedObject(self, TextFieldLast, textField.text, OBJC_ASSOCIATION_COPY);
    } else {
        textField.text = objc_getAssociatedObject(self, TextFieldLast);
    }
}

@end
