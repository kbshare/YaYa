//
//  KBSceondModelVc.m
//  YaYa
//
//  Created by KBMore on 2020/4/24.
//  Copyright © 2020 msxf. All rights reserved.
//

#import "KBSceondModelVc.h"
#import "UIViewController+Extra.h"

@interface KBSceondModelVc ()

@end

@implementation KBSceondModelVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [[UIViewController appVisibleViewController ] dismissViewControllerAnimated:NO completion:^{
        [[UIViewController appVisibleViewController ] dismissViewControllerAnimated:NO completion:nil];

    }];


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
