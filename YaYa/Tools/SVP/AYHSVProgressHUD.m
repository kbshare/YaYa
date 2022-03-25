//
//  AYHSVProgressHUD.m


#import "AYHSVProgressHUD.h"
//#import "KJCircleStrokeSpin.h"

@implementation AYHSVProgressHUD


+ (void)showInfoWithStatus:(NSString *)status
{
    if (status.length < 1) {
        return;
    }
    UIVisualEffectView *effectView = [[SVProgressHUD sharedView] valueForKey:@"hudView"];
    if ([effectView.contentView viewWithTag:2020001]) {
        UIView *view = [effectView.contentView viewWithTag:2020001];
        [view removeFromSuperview];
    }
    [self showMessage:status];
}



+ (void)showLoading:(NSString *)status{
    [SVProgressHUD setImageViewSize:CGSizeMake(66, 66)];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setInfoImage:[UIImage imageNamed:@"logo_loading"]];
    [SVProgressHUD setMaximumDismissTimeInterval:8.0];
    [SVProgressHUD setForegroundColor:UIColor.whiteColor];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:0.0/256.0 green:0.0/256.0 blue:0.0/256.0 alpha:0.75]];
    [SVProgressHUD setFont:[UIFont systemFontOfSize:14]];
    [SVProgressHUD setCornerRadius:6];
    [SVProgressHUD setMinimumSize:CGSizeMake(120, 120)];
    [SVProgressHUD setStatus:status];
    UIVisualEffectView *effectView = [[SVProgressHUD sharedView] valueForKey:@"hudView"];
    if ([effectView.contentView viewWithTag:2020001]) {
        UIView *view = [effectView.contentView viewWithTag:2020001];
        [view removeFromSuperview];
    }
    UIImageView *svImgView = [[SVProgressHUD sharedView] valueForKey:@"imageView"];
    svImgView.contentMode = UIViewContentModeCenter;
    UIView *bgview = [[UIView alloc] initWithFrame:CGRectMake(svImgView.frame.origin.x + 5, svImgView.frame.origin.y + 5, 56, 56)];
    bgview.tag = 2020001;
    bgview.backgroundColor = [UIColor clearColor];

    [SVProgressHUD showInfoWithStatus:status];
}

+ (void)showMessage:(NSString *)status{
    if (status.length < 1) {
        return;
    }
    [SVProgressHUD setMaximumDismissTimeInterval:2.0];
    [SVProgressHUD setForegroundColor:UIColor.whiteColor];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:0.0/256.0 green:0.0/256.0 blue:0.0/256.0 alpha:0.75]];
    [SVProgressHUD setFont:[UIFont systemFontOfSize:14]];
    [SVProgressHUD setCornerRadius:6];
    [SVProgressHUD setMinimumSize:CGSizeMake(120, 40)];
    [SVProgressHUD setImageViewSize:CGSizeZero];

    [SVProgressHUD showImage:[UIImage imageNamed:@""] status:status];
}

+ (void)showError:(NSString *)status{
    if (status.length < 1) {
        return;
    }

    if (status.length > 7) {
        status =   [NSString stringWithFormat:@"%@\n%@", [status substringToIndex:6], [status substringFromIndex:6]];
    }
    UIVisualEffectView *effectView = [[SVProgressHUD sharedView] valueForKey:@"hudView"];
    if ([effectView.contentView viewWithTag:2020001]) {
        UIView *view = [effectView.contentView viewWithTag:2020001];
        [view removeFromSuperview];
    }
    [SVProgressHUD setMaximumDismissTimeInterval:2.0];
    [SVProgressHUD setForegroundColor:UIColor.whiteColor];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:0.0/256.0 green:0.0/256.0 blue:0.0/256.0 alpha:0.75]];
    [SVProgressHUD setFont:[UIFont systemFontOfSize:14]];
    [SVProgressHUD setMinimumSize:CGSizeMake(120, 120)];
    [SVProgressHUD setCornerRadius:6];
    [SVProgressHUD setImageViewSize:CGSizeMake(36, 36)];
    [SVProgressHUD showImage:[UIImage imageNamed:@"icon-toast失败"] status:status];
    
}
+ (void)showSuccess:(NSString *)status{
    if (status.length < 1) {
        return;
    }

    UIVisualEffectView *effectView = [[SVProgressHUD sharedView] valueForKey:@"hudView"];
    if ([effectView.contentView viewWithTag:2020001]) {
        UIView *view = [effectView.contentView viewWithTag:2020001];
        [view removeFromSuperview];
    }
    if (status.length > 7) {
        status =   [NSString stringWithFormat:@"%@\n%@", [status substringToIndex:6], [status substringFromIndex:6]];
    }
    [SVProgressHUD setForegroundColor:UIColor.whiteColor];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:0.0/256.0 green:0.0/256.0 blue:0.0/256.0 alpha:0.75]];
    [SVProgressHUD setFont:[UIFont systemFontOfSize:14]];
    [SVProgressHUD setMinimumSize:CGSizeMake(120, 120)];
    [SVProgressHUD setCornerRadius:6];
    [SVProgressHUD setImageViewSize:CGSizeMake(36, 36)];
    [SVProgressHUD showImage:[UIImage imageNamed:@"icon-toast成功"] status:status];
}


@end
