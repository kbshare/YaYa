//
//  KBFirstModelVC.m
//  YaYa
//
//  Created by KBMore on 2020/4/24.
//  Copyright © 2020 msxf. All rights reserved.
//

#import "KBFirstModelVC.h"
#import "KBSceondModelVc.h"

@interface KBFirstModelVC ()

@end

@implementation KBFirstModelVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *l = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 200)];
    [self.view addSubview:l];
    l.text = @"第一个modelvc";
    l.backgroundColor = [UIColor redColor];

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self presentViewController:[[KBSceondModelVc alloc]init] animated:YES completion:^{
//        [self dismissViewControllerAnimated:YES completion:nil];
NSLog(@"当前控制器%@,当前控制器的presentingViewController%@ ", [self class], self.presentedViewController);
        
    }];
    
    NSLog(@"当前控制器%@,当前控制器的presentingViewController%@", [self class], self.presentedViewController );
//    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];

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
