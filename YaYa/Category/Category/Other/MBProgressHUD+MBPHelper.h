//
//  MBProgressHUD+MBPHelper.h
//  ayh
//
//  Created by administrator on 2017/2/22.
//  Copyright © 2017年 com.msxf. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>


extern NSString * const kBWMMBProgressHUDMsgLoading;
extern NSString * const kBWMMBProgressHUDMsgLoadError;
extern NSString * const kBWMMBProgressHUDMsgLoadSuccessful;
extern NSString * const kBWMMBProgressHUDMsgNoMoreData;
extern NSTimeInterval kBWMMBProgressHUDHideTimeInterval;

typedef NS_ENUM(NSUInteger, BWMMBProgressHUDMsgType) {
    BWMMBProgressHUDMsgTypeSuccessful,
    BWMMBProgressHUDMsgTypeError,
    BWMMBProgressHUDMsgTypeWarning,
    BWMMBProgressHUDMsgTypeInfo
};

@interface MBProgressHUD (MBPHelper)


/**
 *  @brief  添加一个带菊花的HUD
 *
 *  @param view  目标view
 *  @param title 标题
 *
 *  @return MBProgressHUD
 */
+ (MBProgressHUD *)bwm_showHUDAddedTo:(UIView *)view title:(NSString *)title;
/** 添加一个带菊花的HUD */
+ (MBProgressHUD *)bwm_showHUDAddedTo:(UIView *)view
                                title:(NSString *)title
                             animated:(BOOL)animated;

/**
 *  @brief  隐藏指定的HUD
 *
 *  @param afterSecond 多少秒后
 */
- (void)bwm_hideAfter:(NSTimeInterval)afterSecond;
/** 隐藏指定的HUD */
- (void)bwm_hideWithTitle:(NSString *)title
                hideAfter:(NSTimeInterval)afterSecond;
/** 隐藏指定的HUD */
- (void)bwm_hideWithTitle:(NSString *)title
                hideAfter:(NSTimeInterval)afterSecond
                  msgType:(BWMMBProgressHUDMsgType)msgType;

/**
 *  @brief  显示一个自定的HUD
 *
 *  @param title       标题
 *  @param view        目标view
 *  @param afterSecond 持续时间
 *
 *  @return MBProgressHUD
 */
+ (MBProgressHUD *)bwm_showTitle:(NSString *)title
                          toView:(UIView *)view
                       hideAfter:(NSTimeInterval)afterSecond;
/** 显示一个自定的HUD */
+ (MBProgressHUD *)bwm_showTitle:(NSString *)title
                          toView:(UIView *)view
                       hideAfter:(NSTimeInterval)afterSecond
                         msgType:(BWMMBProgressHUDMsgType)msgType;

/**
 *  @brief  显示一个渐进式的HUD
 *
 *  @param view 目标view
 *
 *  @return MBProgressHUD
 */
+ (MBProgressHUD *)bwm_showDeterminateHUDTo:(UIView *)view;

/** 配置本扩展的默认参数 */
+ (void)bwm_setHideTimeInterval:(NSTimeInterval)second fontSize:(CGFloat)fontSize opacity:(CGFloat)opacity;












+ (void)showSuccess:(NSString *)success;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

+ (void)showError:(NSString *)error;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message;
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;

+ (void)hideHUD;
+ (void)hideHUDForView:(UIView *)view;





@end
