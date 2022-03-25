//
//  MBProgressHUD+MBPHelper.m
//  ayh
//
//  Created by administrator on 2017/2/22.
//  Copyright © 2017年 com.msxf. All rights reserved.
//

#import "MBProgressHUD+MBPHelper.h"
NSString * const kBWMMBProgressHUDMsgLoading = @"正在加载...";
NSString * const kBWMMBProgressHUDMsgLoadError = @"加载失败";
NSString * const kBWMMBProgressHUDMsgLoadSuccessful = @"加载成功";
NSString * const kBWMMBProgressHUDMsgNoMoreData = @"没有更多数据了";
NSTimeInterval kBWMMBProgressHUDHideTimeInterval = 1.2f;
static CGFloat FONT_SIZE = 13.0f;
static CGFloat OPACITY = 0.85;
@implementation MBProgressHUD (MBPHelper)



//
//
//+ (MBProgressHUD *)bwm_showHUDAddedTo:(UIView *)view title:(NSString *)title animated:(BOOL)animated {
//    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:animated];
////    HUD.labelFont = [UIFont systemFontOfSize:FONT_SIZE];
////    HUD.detailsLabelText = title;
////    HUD.opacity = OPACITY;
//    return HUD;
//}
//
//+ (MBProgressHUD *)bwm_showHUDAddedTo:(UIView *)view title:(NSString *)title {
//    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
////    HUD.labelFont = [UIFont systemFontOfSize:FONT_SIZE];
////    HUD.detailsLabelText = title;
////    HUD.opacity = OPACITY;
//    return HUD;
//}
//
//- (void)bwm_hideWithTitle:(NSString *)title hideAfter:(NSTimeInterval)afterSecond {
//    if (title) {
//        self.detailsLabelText = title;
//        self.mode = MBProgressHUDModeText;
//    }
//    [self hide:YES afterDelay:afterSecond];
//}
//
//- (void)bwm_hideAfter:(NSTimeInterval)afterSecond {
//    [self hide:YES afterDelay:afterSecond];
//}
//
//- (void)bwm_hideWithTitle:(NSString *)title
//                hideAfter:(NSTimeInterval)afterSecond
//                  msgType:(BWMMBProgressHUDMsgType)msgType {
//    self.detailsLabelText = title;
//    self.mode = MBProgressHUDModeCustomView;
//    self.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[[self class ]p_imageNamedWithMsgType:msgType]]];
//    [self hide:YES afterDelay:afterSecond];
//}
//
//+ (MBProgressHUD *)bwm_showTitle:(NSString *)title toView:(UIView *)view hideAfter:(NSTimeInterval)afterSecond {
//    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
//    HUD.mode = MBProgressHUDModeText;
//    HUD.labelFont = [UIFont systemFontOfSize:FONT_SIZE];
//    HUD.detailsLabelText = title;
//    HUD.opacity = OPACITY;
//    [HUD hide:YES afterDelay:afterSecond];
//    return HUD;
//}
//
//+ (MBProgressHUD *)bwm_showTitle:(NSString *)title
//                          toView:(UIView *)view
//                       hideAfter:(NSTimeInterval)afterSecond
//                         msgType:(BWMMBProgressHUDMsgType)msgType {
//
//    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
//    HUD.labelFont = [UIFont systemFontOfSize:FONT_SIZE];
//
//    NSString *imageNamed = [self p_imageNamedWithMsgType:msgType];
//
//    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageNamed]];
//    HUD.detailsLabelText = title;
//    HUD.opacity = OPACITY;
//    HUD.mode = MBProgressHUDModeCustomView;
//    [HUD hide:YES afterDelay:afterSecond];
//    return HUD;
//
//}
//
//+ (NSString *)p_imageNamedWithMsgType:(BWMMBProgressHUDMsgType)msgType {
//    NSString *imageNamed = nil;
//    if (msgType == BWMMBProgressHUDMsgTypeSuccessful) {
//        imageNamed = @"bwm_hud_success";
//    } else if (msgType == BWMMBProgressHUDMsgTypeError) {
//        imageNamed = @"bwm_hud_error";
//    } else if (msgType == BWMMBProgressHUDMsgTypeWarning) {
//        imageNamed = @"bwm_hud_warning";
//    } else if (msgType == BWMMBProgressHUDMsgTypeInfo) {
//        imageNamed = @"bwm_hud_info";
//    }
//    return imageNamed;
//}
//
//+ (MBProgressHUD *)bwm_showDeterminateHUDTo:(UIView *)view {
//    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
//    HUD.mode = MBProgressHUDModeDeterminateHorizontalBar;
//    HUD.animationType = MBProgressHUDAnimationZoom;
//    HUD.detailsLabelText = kBWMMBProgressHUDMsgLoading;
//    HUD.labelFont = [UIFont systemFontOfSize:FONT_SIZE];
//    return HUD;
//}
//
//+ (void)bwm_setHideTimeInterval:(NSTimeInterval)second fontSize:(CGFloat)fontSize opacity:(CGFloat)opacity {
//    kBWMMBProgressHUDHideTimeInterval = second;
//    FONT_SIZE = fontSize;
//    OPACITY = opacity;
//}
//
//
//
//
//
//
//#pragma mark ======== <#neiRong#> ========
///**
// *  显示信息
// *
// *  @param text 信息内容
// *  @param icon 图标
// *  @param view 显示的视图
// */
//+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
//{
//    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
//    // 快速显示一个提示信息
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
//    hud.label.text = text;
//
//    // 设置图片
//    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:icon]];
//    // 再设置模式
//    hud.mode = MBProgressHUDModeCustomView;
//
//    // 隐藏时候从父控件中移除
//    hud.removeFromSuperViewOnHide = YES;
//
//    // 1秒之后再消失
//    [hud hideAnimated:YES afterDelay:1.0];
//}
//
///**
// *  显示成功信息
// *
// *  @param success 信息内容
// */
//+ (void)showSuccess:(NSString *)success
//{
//    [self showSuccess:success toView:nil];
//}
//
///**
// *  显示成功信息
// *
// *  @param success 信息内容
// *  @param view    显示信息的视图
// */
//+ (void)showSuccess:(NSString *)success toView:(UIView *)view
//{
//    [self show:success icon:@"success.png" view:view];
//}
//
///**
// *  显示错误信息
// *
// */
//+ (void)showError:(NSString *)error
//{
//    [self showError:error toView:nil];
//}
//
///**
// *  显示错误信息
// *
// *  @param error 错误信息内容
// *  @param view  需要显示信息的视图
// */
//+ (void)showError:(NSString *)error toView:(UIView *)view{
//    [self show:error icon:@"37x-Checkmark" view:view];
//}
//
///**
// *  显示错误信息
// *
// *  @param message 信息内容
// *
// *  @return 直接返回一个MBProgressHUD，需要手动关闭
// */
//+ (MBProgressHUD *)showMessage:(NSString *)message
//{
//    return [self showMessage:message toView:nil];
//}
//
///**
// *  显示一些信息
// *
// *  @param message 信息内容
// *  @param view    需要显示信息的视图
// *
// *  @return 直接返回一个MBProgressHUD，需要手动关闭
// */
//+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
//    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
//    // 快速显示一个提示信息
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
//    hud.label.text = message;
//    // 隐藏时候从父控件中移除
//    hud.removeFromSuperViewOnHide = YES;
//    // YES代表需要蒙版效果
//    hud.dimBackground = YES;
//    return hud;
//}
//
///**
// *  手动关闭MBProgressHUD
// */
//+ (void)hideHUD
//{
//    [self hideHUDForView:nil];
//}
//
///**
// *  手动关闭MBProgressHUD
// *
// *  @param view    显示MBProgressHUD的视图
// */
//+ (void)hideHUDForView:(UIView *)view
//{
//    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
//    [self hideHUDForView:view animated:YES];
//}

@end
