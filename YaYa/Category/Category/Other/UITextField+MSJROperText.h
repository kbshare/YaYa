//
//  UITextField+MSJROperText.h
//  Finance
//
//  Created by xialv on 16/9/20.
//  Copyright © 2016年 MaShang Consumer Finance. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CanState <NSObject>
-(void)CanState:(BOOL)state and:(UITextField*)field;
@end
@interface UITextField (MSJROperText)
-(void)handleTarget:(id)Target andOpera:(UITextField*)oper andControlMax:(NSString*)Maxlen andControlMin:(NSString*)minLen;
@property(nonatomic,strong)NSString* minLength;
@property(nonatomic,strong)NSString* MaxLength;
@property(nonatomic,assign)id<CanState>oper;
@end
