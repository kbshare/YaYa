//
//  LinkManController.m
//  weixin
//
//  Created by zhiwei on 16/1/11.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LinkManController.h"
#import "KBBaseViewController.h"
@interface LinkManController ()
@property (nonatomic, strong) NSArray *plist;
@end

@implementation LinkManController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.plistName = @"LinkMan";
}
-(NSArray *)plistArray{
    if (_plist== nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:self.plistName ofType:@"plist"];
        _plist = [NSArray arrayWithContentsOfFile:path];
    }
    
    return _plist;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
        KBBaseViewController *vc = [[KBBaseViewController alloc]init];
        vc.title = _plist[indexPath.section][indexPath.row][@"name"];
        [self.navigationController pushViewController:vc animated:YES];
    
}

@end
