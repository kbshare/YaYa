//
//  UIView+ActivityView.m
//  msd
//
//  Created by shangguanxin on 2016/11/24.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "UIView+ActivityView.h"

#define activityViewTag         0x401
#define aViewTag                0x402

@implementation UIView (ActivityView)

- (void)createActivityViewAtCenter:(UIActivityIndicatorViewStyle)style
{
    static NSInteger size = 30;
    UIView* aView = [[UIView alloc] init];
    aView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 50/2, ([UIScreen mainScreen].bounds.size.height-113) /2 - 50/2, 50, 50);
    aView.backgroundColor = [UIColor blackColor];
    aView.layer.cornerRadius = 5;
    aView.layer.masksToBounds = YES;
    aView.tag = aViewTag;
    aView.alpha = 0.5;
    
    UIActivityIndicatorView* activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:style];
    activityView.frame = CGRectMake(10, 10, size, size);
    activityView.tag = activityViewTag;
    [aView addSubview:activityView];
    
    [self addSubview:aView];
    [self bringSubviewToFront: aView];
    
    
}

- (UIActivityIndicatorView*)getActivityViewAtCenter
{
    for (UIView *view in [self subviews]) {
        if (view.tag == aViewTag) {
            [self bringSubviewToFront:view];
            for (UIView *inview in [view subviews])
            {
                if (inview != nil && [inview isKindOfClass:[UIActivityIndicatorView class]]){
                    return (UIActivityIndicatorView*)inview;
                }
                
            }
        }
        
        
    }
    return nil;
}

- (void)showActivityViewAtCenter
{
    
//    [SVProgressHUD showWithStatus:@"加载中..."];
   
//    UIActivityIndicatorView* activityView = [self getActivityViewAtCenter];
//    if (activityView == nil){
//        [self createActivityViewAtCenter:UIActivityIndicatorViewStyleWhiteLarge];
//        activityView = [self getActivityViewAtCenter];
//    }
//    
//    [activityView startAnimating];
    

}
- (void)hideActivityViewAtCenter
{
//    UIActivityIndicatorView* activityView = [self getActivityViewAtCenter];
//    if (activityView != nil){
//        [activityView stopAnimating];
//    }
//    for (UIView *view in [self subviews]) {
//        if (view != nil && view.tag == aViewTag){
//            [view removeFromSuperview];
//            return;
//        }
//    }
    
//    [SVProgressHUD dismiss];
    
}

@end
