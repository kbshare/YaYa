//
//  KBJS.h
//  YaYa
//
//  Created by KBMore on 2019/10/17.
//  Copyright © 2019 msxf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

NS_ASSUME_NONNULL_BEGIN

@protocol KBJS <JSExport>

JSExportAs(toAppLogin,-(void)toAppLogin:(id)sender);
JSExportAs(multiplyAAndB,-(void)multiplyA:(id)sender andB:(id)sender2);
@property (nonatomic, copy) NSString  *text;
@property (nonatomic, copy) UIButton  *btn;

//@property (nonatomic, strong) UILabel *label;
@end

NS_ASSUME_NONNULL_END
