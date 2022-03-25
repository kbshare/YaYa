//
//  CZTabbarController.m
//  weixin
//
//  Created by zhiwei on 16/1/11.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "CZTabbarController.h"

#import "ChatController.h"
#import "LinkManController.h"
#import "DiscoverController.h"
#import "MineController.h"
#import "CZNavController.h"

@interface CZTabbarController ()

@end

@implementation CZTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ChatController *chatVC = [[ChatController alloc] init];
    [self addChildVC:chatVC imageName:@"tabbar_mainframe" selectImage:@"tabbar_mainframeHL" title:@"聊天"];
    
    
    LinkManController *linkMan = [[LinkManController alloc] init];
    [self addChildVC:linkMan imageName:@"tabbar_contacts" selectImage:@"tabbar_contactsHL" title:@"通讯录"];
    
    DiscoverController *discover = [[DiscoverController alloc] init];
    [self addChildVC:discover imageName:@"tabbar_discover" selectImage:@"tabbar_discoverHL" title:@"发现"];
    
    MineController *mine = [[MineController alloc] init];
    [self addChildVC:mine imageName:@"tabbar_me" selectImage:@"tabbar_meHL" title:@"我"];
    
    
    
    
    
    
}


#pragma mark - 给tabbarController添加子控制器
-(void)addChildVC:(UIViewController *)childVC imageName:(NSString *)imageName selectImage:(NSString *)selectImageName title:(NSString *)title{
    
    childVC.title = title;
    
    //设置tabbaritem文字的颜色
    [childVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:14/255.0 green:180/255.0 blue:0/255.0 alpha:1.0]} forState:UIControlStateSelected];
    
    //图片
    childVC.tabBarItem.image = [UIImage imageNamed:imageName];
    
    //不让图片渲染成蓝色
    UIImage *selectImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //选中后的图片
    childVC.tabBarItem.selectedImage = selectImage;
    
    CZNavController *nav = [[CZNavController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];
}










@end
