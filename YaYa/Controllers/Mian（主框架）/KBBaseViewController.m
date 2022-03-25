//
//  KBBaseViewController.m
//  weixin
//
//  Created by administrator on 2018/8/29.
//  Copyright © 2018年 itcast. All rights reserved.
//

#import "KBBaseViewController.h"

@interface KBBaseViewController ()

@end

@implementation KBBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = self.title;
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
