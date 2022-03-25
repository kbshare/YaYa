//
//  SettingController.m
//  weixin
//
//  Created by zhiwei on 16/1/11.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "SettingController.h"
#import "AboutController.h"
@interface SettingController ()

@end

@implementation SettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.plistName = @"Setting";
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 2 && indexPath.row == 0) {
        
        AboutController *aboutVC = [[AboutController alloc] init];
        aboutVC.navigationItem.title = @"关于微信";
        aboutVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:aboutVC animated:YES];
        
    }
    if (indexPath.section == 2 && indexPath.row == 1) {
        
//        [AYHUMShareManager share:@"sdfsfdsdf"];
        
    }
}





@end
