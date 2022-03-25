//
//  UIScrollView+AYHTableAddHeaderOrFooterRefush.h
//  ayh
//
//  Created by xialv on 2017/3/9.
//  Copyright © 2017年 com.msxf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (MJRefresh)
//添加此方法控制器默认refush
-(void)addHeader:(void(^)())FetchData;
-(void)addFooter:(void(^)())FetchData;
-(void)addHeaderForAysh:(void(^)())FetchData;//安逸生活


@end
