//
//  DiscoverController.m
//  weixin
//
//  Created by zhiwei on 16/1/11.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "DiscoverController.h"
#import "FriendsController.h"

@interface DiscoverController ()

@end

@implementation DiscoverController


- (void)viewDidLoad {
    [super viewDidLoad];
    [UINavigationBar appearance].barTintColor = BLACK_COLOR;
    [UINavigationBar appearance].translucent = NO;
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSFontAttributeName:AYHFont(18),NSForegroundColorAttributeName:[UIColor whiteColor]
                                                           }];
   self.plistName = @"Discover";
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        FriendsController *friendsVC = [[FriendsController alloc] init];
        
        friendsVC.hidesBottomBarWhenPushed = YES;
        
        [self.navigationController pushViewController:friendsVC animated:YES];
    }
}


@end
