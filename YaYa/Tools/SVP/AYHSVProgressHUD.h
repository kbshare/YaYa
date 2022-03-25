//
//  AYHSVProgressHUD.h
//  ayh
//
//  Created by  张豹 on 2019/12/24.
//  Copyright © 2019 com.msxf. All rights reserved.
//

#import "SVProgressHUD.h"


@interface AYHSVProgressHUD : SVProgressHUD

+ (void)showInfoWithStatus:(NSString *)status;

+ (void)showLoading:(NSString *)status;
+ (void)showMessage:(NSString *)status;
+ (void)showError:(NSString *)status;
+ (void)showSuccess:(NSString *)status;

@end


@interface SVProgressHUD ()

+ (SVProgressHUD*)sharedView;

@end
