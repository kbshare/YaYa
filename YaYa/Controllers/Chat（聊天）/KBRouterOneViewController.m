//
//  KBRouterOneViewController.m
//  YaYa
//
//  Created by KBMore on 2020/8/21.
//  Copyright © 2020 msxf. All rights reserved.
//

#import "KBRouterOneViewController.h"

@interface KBRouterOneViewController ()

@end

@implementation KBRouterOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.redColor;
    self.title = @"One红色";
    
       UIButton *btn = [UIButton buttonWithTitle:@"跳3" KB_colortitleColorString:nil BackgroundImage:nil TitleFontSize:20 Target:self Action:@selector(showError)];
       [self.view addSubview:btn];
       [btn setFrame:CGRectMake(100, 30, 200, 30)];
       
       
       UIButton *btn1 = [UIButton buttonWithTitle:@"跳2" KB_colortitleColorString:nil BackgroundImage:nil TitleFontSize:20 Target:self Action:@selector(showSuccess)];
         [self.view addSubview:btn1];
       [btn1 setFrame:CGRectMake(100, 80, 200, 30)];

       
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
}


- (void)showError{
    
}

- (void)showSuccess{
    
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
