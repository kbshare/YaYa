//
//  CommonMacro.h
//  ayh
//
//  Created by administrator on 16/5/10.
//  Copyright © 2016年 administrator. All rights reserved.
//

#ifndef CommonMacro_h
#define CommonMacro_h

// 主题颜色
#define THEME_COLOR   HEXRGBCOLOR(0x4c7ee9)
// 间隔线
#define LINE_COLOR    HEXRGBCOLOR(0xeeeeee)

// 占位文字
#define PLACEHOLDER_COLOR    HEXRGBCOLOR(0xcccccc)

//Label
#define DEFAULTLBEL_COLOR    HEXRGBCOLOR(0x444444)


// 背景色
#define BACKGROUND_COLOR HEXRGBCOLOR(0xf7f7f7)
//白色
#define WHITE_COLOR [UIColor whiteColor]
//黑色
#define BLACK_COLOR  [UIColor blackColor]


//颜色
#define RGBCOLOR(r,g,b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBACOLOR(r,g,b,a)  [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
// 16进制颜色
#define HEXRGBCOLOR(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0]
#define HEXRGBACOLOR(h,a)   RGBACOLOR(((h>>16)&0xFF), ((h>>8)&0xFF), (h&0xFF), a)

//获取图片资源

#define kGetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]


#define APP ((AppDelegate*)([UIApplication sharedApplication].delegate))

#define AYHKEYCHINSTANCE [AYHKeychainManager sharedInstance]

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self
#define SS(strongSelf)  __strong __typeof(self) strongSelf = weakSelf;
// 屏幕尺寸
#define SCREEN_RECT         [UIScreen mainScreen].bounds
#define SCREEN_SIZE         [UIScreen mainScreen].bounds.size
#define SCREEN_WIDTH        (SCREEN_SIZE.width)
#define SCREEN_HEIGHT       (SCREEN_SIZE.height)
#define SCREEN_SCALE        [UIDevice currentDevice].screenScale
#define STATUSBAR_HEIGHT    ((IS_IPHONEX) ? (44) : (20))
#define NAVIGATIONBAR_HEIGHT (STATUSBAR_HEIGHT + 44)
#define TABBAR_HEIGHT  49
#define TABLE_HEIGHT (SCREEN_HEIGHT - NAVIGATIONBAR_HEIGHT)
#define SAFE_AREA_HEIGH ((IS_IPHONEX) ? (34) : (0))
#define kSCREEN_RATE (CGRectGetWidth([UIScreen mainScreen].bounds)/375.0f)

#define FIT(__value) ((__value) * kSCREEN_RATE)
#define FIT_Number(__value) @(((__value) * kSCREEN_RATE))

#define FIT14 FIT(14)
#define AYHFont(value) [UIFont systemFontOfSize:(value)]
#define AYHFontFIT(value) [UIFont systemFontOfSize:FIT(value)]
#define AYHFontFIT14 AYHFontFIT(14)


#define  GetBundlePath(x,y)   [[NSBundle mainBundle] pathForResource:x  ofType:y]


#define DEFAULTAS [NSUserDefaults standardUserDefaults]

//日志
#if  TEST
    #define NSLog(fmt, ...) NSLog((fmt), ##__VA_ARGS__);
#elif  DEBUG
    #define NSLog(fmt, ...) NSLog((fmt), ##__VA_ARGS__);
#else
    #define NSLog(fmt, ...)
#endif

#define alert(title,msg)  UIAlertView*alert =[[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];\
[alert show]


#define tableViewViewForFooter()\
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {\
    return nil;\
}
#define tableViewViewForHeader()\
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {\
return nil;\
}
#define tableViewViewForFooterAndHeader()\
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {\
return nil;\
}\
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {\
return nil;\
}


//线程安全
#define ayh_dispatch_main_sync_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_sync(dispatch_get_main_queue(), block);\
}

//延时操作
#define ayh_deipatch_after(time,block)\
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), block)


#define ayh_dispatch_main_async_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}
//网络错误
#define NETWORK_ERROR_NOTICE @"网络异常，请稍后重试"


/*--------------------------Device相关---------------------------*/
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

//设备判断
#define IOSVERSION [[[UIDevice currentDevice] systemVersion] doubleValue]
#define IS_IPHONE4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

// 1125/2001 6p的放大屏幕尺寸
#define IS_IPHONE6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) ||CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_IPHONE6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size): NO)

#define IS_IPHONEX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size): NO)


#endif /* CommonMacro_h */
