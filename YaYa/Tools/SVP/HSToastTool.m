//
//  HSToastTool.m
//  YaYa
//
//  Created by a58 on 2021/12/29.
//  Copyright © 2021 msxf. All rights reserved.
//

#import "HSToastTool.h"
#import "UIView+HSToast.h"
#import "UIViewController+Extra.h"
#import "UIImage+KBGif.h"


@interface HSToastTool()
@property (nonatomic, assign) HSToastToolPositionType lastPositionType;
@property (nonatomic, weak) UIView *lastShowToastView;

@end

@implementation HSToastTool

+ (instancetype)sharedTool {
    static HSToastTool *_sharedTool = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedTool = [[self alloc] init];
    });
    return _sharedTool;
}

+ (void)makeToast:(NSString *)message{
    [self makeToast:message status:HSToastToolStatusDefault];
}

+ (void)makeToast:(NSString *)message status:(HSToastToolStatusType)status{
    [self makeToast:message  status:status  position:HSToastToolPositionTypeBottom];
}


+ (void)makeToast:(NSString *)message status:(HSToastToolStatusType)status position:(HSToastToolPositionType)position{
    [self makeToast:message  status:status position:position duration:2];
}

+ (void)makeToast:(NSString *)message status:(HSToastToolStatusType)status position:(HSToastToolPositionType)position duration:(NSTimeInterval)duration{
    [self makeToast:message image:nil status:status position:position duration:duration];
}

+ (void)makeToast:(NSString *)message image:(UIImage *)image status:(HSToastToolStatusType)status position:(HSToastToolPositionType)position duration:(NSTimeInterval)duration{
    
    [self makeToast:message image:image status:status position:position duration:duration style:[self hsToastStyle]];
}


+ (void)makeToast:(NSString *)message image:(UIImage *)image status:(HSToastToolStatusType)status position:(HSToastToolPositionType)position duration:(NSTimeInterval)duration style:(HSToastStyle *)style{
    
    UIImage *contentImage;
    if (image) {
        contentImage = image;
    }else{
        contentImage = [self imageFromStatus:status];
    }
    
    if (status == HSToastToolStatusDefault) {
        contentImage = nil;
    }
    
    UIViewController *vc = [UIViewController appVisibleViewController];
    
    HSToastTool *tool = [self sharedTool];
    if (tool.lastPositionType == position && tool.lastShowToastView == vc.view) {
        [vc.view hideAllToasts];
    }
    tool.lastPositionType = position;
    tool.lastShowToastView = vc.view;
    
    if (vc) {
        [vc.view makeToast:message duration:duration position:[self HSToastPositionWithType:position] title:nil image:contentImage style:style completion:nil];
    }
}


+ (UIImage *)imageFromStatus:(HSToastToolStatusType)status{
    
    NSString *imageName = @"toast_success.png";
    switch (status) {
        case HSToastToolStatusSuccess:
            imageName = @"toast_success.png";
            break;
        case HSToastToolStatusFail:
            imageName = @"toast_fail.png";
            break;
        case HSToastToolStatusInfo:
            imageName = @"toast_info.png";
            break;
        case HSToastToolStatusLoading:
            imageName = @"toast_loading.gif";
            break;
            
        default:
            break;
    }
    
    
    
    
    NSBundle *bundle = [NSBundle mainBundle];
    
    NSBundle *resourceBundle = [NSBundle bundleWithPath:[bundle pathForResource:@"ToastResource" ofType:@"bundle"]];
    NSString *rePath = [resourceBundle pathForResource:imageName ofType:nil];
    NSURL *url  = [NSURL URLWithString:rePath];
    
    NSData *data = [NSData dataWithContentsOfFile:rePath];
    
    
//    NSURL *url = [bundle URLForResource:@"ToastResource" withExtension:@"bundle"];
//    bundle =  url ? [NSBundle bundleWithURL:url] : nil;
////  UIImage *img =  [UIImage imageNamed:@"toast_info" inBundle:bundle compatibleWithTraitCollection:nil];
////    NSURL *urlss = [NSURL URLWithString:[NSString stringWithFormat:@"%@/toast_success.png",[bundle resourcePath]]];
////  NSData *data =   [NSData dataWithContentsOfURL:urlss ];
////
////
//    NSURL *associateBundleURL = [[NSBundle mainBundle] URLForResource:@"ToastResource" withExtension:@"bundle"];
//    associateBundleURL = [associateBundleURL URLByAppendingPathComponent:@"MBProgressHUD"];
//    NSBundle *associateBunle = [NSBundle bundleWithURL:associateBundleURL];
////
////
////    NSString *bundlePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"ToastResource.bundle"];
////    NSString *image_path = [bundlePath stringByAppendingPathComponent:imageName];;
////    NSData *  imageOr = [NSData dataWithContentsOfFile:image_path];
////    UIImage *image = [UIImage animatedGIFWithData: imageOr];
//
//        NSString *imagePath = [NSString stringWithFormat:@"ToastResource.bundle/%@",imageName];
//        UIImage *image = [UIImage animatedGIFNamed:imagePath];
//    NSBundle *bundle = [self bundleWithBundleName:@"ToastResource" podName:@"MBProgressHUD"];
    
     UIImage *image  = [UIImage animatedGIFWithData:data];
    return image;
}

+ (NSBundle *)bundleWithBundleName:(NSString *)bundleName podName:(NSString *)podName{
    if (bundleName == nil && podName == nil) {
        @throw @"bundleName和podName不能同时为空";
    }else if (bundleName == nil ) {
        bundleName = podName;
    }else if (podName == nil) {
        podName = bundleName;
    }
    
    
    if ([bundleName containsString:@".bundle"]) {
        bundleName = [bundleName componentsSeparatedByString:@".bundle"].firstObject;
    }
    //没使用framwork的情况下
    NSURL *associateBundleURL = [[NSBundle mainBundle] URLForResource:bundleName withExtension:@"bundle"];
    //使用framework形式
    if (!associateBundleURL) {
        associateBundleURL = [[NSBundle mainBundle] URLForResource:@"Frameworks" withExtension:nil];
        associateBundleURL = [associateBundleURL URLByAppendingPathComponent:podName];
        associateBundleURL = [associateBundleURL URLByAppendingPathExtension:@"framework"];
        NSBundle *associateBunle = [NSBundle bundleWithURL:associateBundleURL];
        associateBundleURL = [associateBunle URLForResource:bundleName withExtension:@"bundle"];
    }
    
    NSAssert(associateBundleURL, @"取不到关联bundle");
    //生产环境直接返回空
    return associateBundleURL?[NSBundle bundleWithURL:associateBundleURL]:nil;
}
+ (NSString *)HSToastPositionWithType:(HSToastToolPositionType)position{
    NSString *csPosition = @"";
    switch (position) {
        case HSToastToolPositionTypeTop:
            csPosition = HSToastPositionTop;
            break;
        case HSToastToolPositionTypeBottom:
            csPosition = HSToastPositionBottom;
            break;
        default:
            csPosition = HSToastPositionCenter;
            break;
    }
    return csPosition;
}


+ (HSToastStyle *)hsToastStyle{
    HSToastStyle *style = [[HSToastStyle alloc]initWithDefaultStyle];
    style.imageSize = CGSizeMake(20, 20);
    style.cornerRadius = 3;
    style.messageFont = [UIFont systemFontOfSize:16];
    style.backgroundColor =  [UIColor colorWithRed:61/255.0 green:61/255.0 blue:61/255.0 alpha:1/1.0];
    style.maxWidthPercentage = 0.8;//0.68;
    style.verticalPadding = 15;
    style.horizontalPadding = 15;
    return style;
}


@end
