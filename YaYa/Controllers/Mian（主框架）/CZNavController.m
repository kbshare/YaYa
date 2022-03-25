//
//  CZNavController.m
//  weixin
//
//  Created by zhiwei on 16/1/11.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "CZNavController.h"

@interface CZNavController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@end

@implementation CZNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //navigationBar背景图片
//    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"topbarbg_ios7"] forBarMetrics:UIBarMetricsDefault];
    
    //navigationBar 的titlte颜色
//    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor greenColor]}];
//
//    //左右两侧item的颜色
//    [self.navigationBar setTintColor:[UIColor whiteColor]];
//
    [UINavigationBar appearance].barTintColor = THEME_COLOR;
      [UINavigationBar appearance].translucent = NO;
      [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                             NSFontAttributeName:AYHFont(18),NSForegroundColorAttributeName:[UIColor whiteColor]
                                                             }];
      
      if (@available(iOS 9, *)) {
             [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[UIImagePickerController.class]] setTintColor:WHITE_COLOR];
      } else {
          [[UIBarButtonItem appearanceWhenContainedIn:UIImagePickerController.class, nil] setTintColor:WHITE_COLOR];
      }


}
- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if(self.viewControllers.count){
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];

}

#pragma mark UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animate
{
    // Enable the gesture again once the new controller is shown
    
//    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
//        self.interactivePopGestureRecognizer.enabled = YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([self.viewControllers count] == 1 && [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        return NO;
    }
    return YES;
}



@end
