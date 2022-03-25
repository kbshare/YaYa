//
//  UIScrollView+AYHTableAddHeaderOrFooterRefush.m
//  ayh
//
//  Created by xialv on 2017/3/9.
//  Copyright © 2017年 com.msxf. All rights reserved.
//

#import "UIScrollView+MJRefresh.h"
#import <MJRefresh.h>
@implementation UIScrollView (MJRefresh)
-(void)addHeader:(void(^)())FetchData{
    MJRefreshGifHeader *mjHeader = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        FetchData();
        
    }];
    NSMutableArray *images = [NSMutableArray array];
    for (int i = 0; i< 4; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"anim_%d",i]];
        if (image) {
            [images addObject:image];
        }
    }
    [mjHeader setImages:images duration:1.0 forState:MJRefreshStatePulling];
    mjHeader.stateLabel.textColor = [UIColor whiteColor];
    mjHeader.lastUpdatedTimeLabel.textColor = [UIColor whiteColor];
    self.mj_header = mjHeader;
    self.showsVerticalScrollIndicator = NO;
    mjHeader.backgroundColor =[UIColor clearColor];
}
-(void)addFooter:(void(^)())FetchData{
        MJRefreshBackGifFooter*mjFooter =[MJRefreshBackGifFooter footerWithRefreshingBlock:^{
        FetchData();
    }];

    NSMutableArray *images = [NSMutableArray array];
    for (int i = 0; i< 4; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"anim_%d",i]];
        [images addObject:image];
    }
    
    [mjFooter setImages:images duration:1.0 forState:MJRefreshStateRefreshing];
    self.mj_footer = mjFooter;
    self.mj_footer.ignoredScrollViewContentInsetBottom = 0;
    self.showsVerticalScrollIndicator = NO;
}
-(void)addHeaderForAysh:(void(^)())FetchData;{
    MJRefreshGifHeader *mjHeader = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        FetchData();
        
    }];
    NSMutableArray *images = [NSMutableArray array];
    for (int i = 0; i< 4; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"anim_%d",i]];
        if (image) {
            [images addObject:image];
        }
    }
    [mjHeader setImages:images duration:1.0 forState:MJRefreshStatePulling];
    mjHeader.stateLabel.textColor = HEXRGBCOLOR(0x999999);
    mjHeader.lastUpdatedTimeLabel.textColor = HEXRGBCOLOR(0x999999);
    self.mj_header = mjHeader;
    self.showsVerticalScrollIndicator = NO;
    mjHeader.backgroundColor =[UIColor clearColor];
}
@end
