//
//  MineController.m
//  weixin
//
//  Created by zhiwei on 16/1/11.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MineController.h"
#import "SettingController.h"

@interface MineController ()

@end

@implementation MineController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.plistName = @"Mine";
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 100;
    }
    
    return 70;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 3 && indexPath.row == 0) {
        
        SettingController *setVC = [[SettingController alloc] init];
        setVC.navigationItem.title = @"设置";
        setVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:setVC animated:YES];
    }
}



@end
