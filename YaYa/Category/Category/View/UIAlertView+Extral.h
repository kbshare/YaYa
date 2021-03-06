//
//  Created by shangguanxin on 2016/10/30.
//  Copyright © 2016年 MaShang Consumer Finance. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (Extral)

/**
 显示alert,button顺序:actionTitles(包含destrctive) -> cancel
 
 @param title            标题
 @param message          信息
 @param completion       回调
 @param actionTitles     取消标题
 @param cancelTitle      其他标题
 @warning 推荐iOS 8以下使用
 **/
+  (UIAlertView *)alertWithTitle:(NSString *)title
               message:(NSString *)message
            completion:(void (^)(NSUInteger actionIndex))completion
          actionTitles:(NSArray<NSString *> *)actionTitles
           cancelTitle:(NSString *)cancelTitle;
@end

