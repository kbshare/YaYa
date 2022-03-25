//
//  UIView+BlurEffectWhenEnterBg.m
//  msg
//
//  Created by msxf on 16/11/10.
//  Copyright © 2016年 msxf. All rights reserved.
//

#import "UIView+BlurEffectWhenEnterBg.h"
#import "AppDelegate.h"

#define APPDELEGATE ((AppDelegate*)[[UIApplication sharedApplication] delegate])

@implementation UIView (BlurEffectWhenEnterBg)

+ (void)createBlurView {
    //进入后台盖上view，实现模糊效果
    UIView* view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //获取当前视图控制器
    UIViewController *vc = [self getCurrentVC];
    //截取当前视图为图片
    UIImage *image = [self snapshot:vc.view];
    
    imageV.image = image;
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = imageV.bounds;
    [imageV addSubview:effectView];
    view.tag = 1111;
    [view addSubview:imageV];
    [APPDELEGATE.window addSubview:view];
}

+ (void)removeBlurView {
    //移除
    NSArray* array = [[UIApplication sharedApplication] keyWindow].subviews;
    for (id view in array) {
        if ([view isKindOfClass:[UIView class]]) {
            UIView* myView = view;
            if (myView.tag == 1111) {
                [myView removeFromSuperview];
            }
        }
    }
    UIView *view = [APPDELEGATE.window viewWithTag:1111];
    if (view) {
        [view removeFromSuperview];
    }
}

//获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentVC {
    UIViewController *result = nil;
    if (APPDELEGATE.window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                APPDELEGATE.window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[APPDELEGATE.window subviews] lastObject];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        result = nextResponder;
    }
    return result;
}

//截取当前视图为图片
+ (UIImage *)snapshot:(UIView *)view {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, 0);
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

//生成一张毛玻璃图片
+ (UIImage*)blur:(UIImage*)theImage
{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [CIImage imageWithCGImage:theImage.CGImage];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:[NSNumber numberWithFloat:20.0f] forKey:@"inputRadius"];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    
    CGImageRef cgImage = [context createCGImage:result fromRect:[inputImage extent]];
    
    UIImage *returnImage = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    return returnImage;
}

@end
