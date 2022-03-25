//
//  KBMBProgressViewController.m
//  YaYa
//
//  Created by KBMore on 2020/5/6.
//  Copyright © 2020 msxf. All rights reserved.
//

#import "KBMBProgressViewController.h"
#import "UIButton+KBButton.h"
#import "MBProgressHUD+MBPHelper.h"
#import "SVProgressHUD.h"
#import "KBDrawRectView.h"
@interface KBMBProgressViewController ()

@end

@implementation KBMBProgressViewController


+ (void)load{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginfo) name:noti object:nil];

}
- (void)viewDidLoad {
    [super viewDidLoad];

    

    
    UIButton *btn = [UIButton buttonWithTitle:@"showError" KB_colortitleColorString:nil BackgroundImage:nil TitleFontSize:20 Target:self Action:@selector(showError:)];
    [self.view addSubview:btn];
    [btn setFrame:CGRectMake(100, 30, 200, 30)];
    
    
    UIButton *btn1 = [UIButton buttonWithTitle:@"showSuccess" KB_colortitleColorString:nil BackgroundImage:nil TitleFontSize:20 Target:self Action:@selector(showSuccess:)];
      [self.view addSubview:btn1];
    [btn1 setFrame:CGRectMake(100, 80, 200, 30)];

    
    UIButton *btn2 = [UIButton buttonWithTitle:@"showMessage" KB_colortitleColorString:nil BackgroundImage:nil TitleFontSize:20 Target:self Action:@selector(showMessage:)];
    [self.view addSubview:btn2];
    [btn2 setFrame:CGRectMake(100, 130, 200, 30)];


    UIButton *btn3 = [UIButton buttonWithTitle:@"showInfo" KB_colortitleColorString:nil BackgroundImage:nil TitleFontSize:20 Target:self Action:@selector(showInfo:)];
      [self.view addSubview:btn3];
    [btn2 setFrame:CGRectMake(100, 180, 200, 30)];


    UIButton *btn4 = [UIButton buttonWithTitle:@"svpShowInfo" KB_colortitleColorString:nil BackgroundImage:nil TitleFontSize:20 Target:self Action:@selector(svpShowInfo:)];
      [self.view addSubview:btn4];
    [btn4 setFrame:CGRectMake(100, 230, 200, 30)];
    
    
    UIButton *btn5 = [UIButton buttonWithTitle:@"svpShowErro" KB_colortitleColorString:nil BackgroundImage:nil TitleFontSize:20 Target:self Action:@selector(svpShowErro:)];
         [self.view addSubview:btn5];
       [btn5 setFrame:CGRectMake(100, 280, 200, 30)];
    
    UIButton *btn6 = [UIButton buttonWithTitle:@"svpShowSuccess" KB_colortitleColorString:nil BackgroundImage:nil TitleFontSize:20 Target:self Action:@selector(svpShowSuccess:)];
         [self.view addSubview:btn6];
       [btn6 setFrame:CGRectMake(100, 330, 200, 30)];
    
    
    KBDrawRectView *view = [[KBDrawRectView alloc]init];
    [view setFrame:CGRectMake(100, 400, 200, 40)];
    [self.view addSubview:view];
}



+ (void)loginfo{
    for (int i = 0; i<100; i++) {
        NSLog(@"通知通知");
    }
}

- (void)showError:(UIButton *)sender{
    [MBProgressHUD showError:@"酸辣粉就沙发沙发"];
}

- (void)showSuccess:(UIButton *)sender{
    [MBProgressHUD showSuccess:@"酸辣粉就沙发沙发"];

}



- (void)showMessage:(UIButton *)sender{
    [MBProgressHUD showMessage:@"酸辣粉就沙发沙发"];

}

- (void)showInfo:(UIButton *)sender{
    
    UIView *view = [[UIApplication sharedApplication].windows lastObject];
   // 快速显示一个提示信息
   MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.contentColor = [UIColor whiteColor];
    hud.label.text = @"快速显示一个提示信息";
    UIView *cusV =[[UIView alloc]initWithFrame:CGRectMake(10, 10, 80, 80)];
    cusV.backgroundColor = [UIColor redColor];
    hud.customView =cusV;
   // 再设置模式
   hud.mode = MBProgressHUDModeCustomView;
   
   // 隐藏时候从父控件中移除
   hud.removeFromSuperViewOnHide = YES;
   
   // 1秒之后再消失
   [hud hideAnimated:YES afterDelay:2.0];

}

- (void)svpShowInfo:(UIButton *)sender{
    [SVProgressHUD setMaximumDismissTimeInterval:20.0];
    //    [SVProgressHUD setInfoImage:[UIImage imageNamed:@""]];
        [SVProgressHUD setForegroundColor:WHITE_COLOR];
        [SVProgressHUD setImageViewSize:CGSizeZero];
        [SVProgressHUD setBackgroundColor:HEXRGBACOLOR(0x000000, 0.75)];
        [SVProgressHUD setFont:AYHFont(14)];
        [SVProgressHUD setMinimumSize:CGSizeMake(FIT(120), FIT(40))];
        [SVProgressHUD setCornerRadius:FIT(6)];
    [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"飞飞飞"];


}
- (void)svpShowErro:(UIButton *)sender{
    [SVProgressHUD setMaximumDismissTimeInterval:2.0];

    [SVProgressHUD setForegroundColor:WHITE_COLOR];
    [SVProgressHUD setBackgroundColor:HEXRGBACOLOR(0x000000, 0.75)];
    [SVProgressHUD setFont:AYHFont(14)];
    [SVProgressHUD setMinimumSize:CGSizeMake(FIT(120), FIT(120))];

    [SVProgressHUD setCornerRadius:FIT(6)];
    [SVProgressHUD showImage:[UIImage imageNamed:@"2"] status:@"飞飞否飞飞飞飞飞飞飞"];

}
- (void)svpShowSuccess:(UIButton *)sender{
    [SVProgressHUD setMaximumDismissTimeInterval:2.0];

       [SVProgressHUD setForegroundColor:WHITE_COLOR];
    [SVProgressHUD setBackgroundColor:HEXRGBACOLOR(0x000000, 0.75)];
    [SVProgressHUD setFont:AYHFont(14)];
    [SVProgressHUD setMinimumSize:CGSizeMake(FIT(120), FIT(120))];
    [SVProgressHUD setCornerRadius:FIT(6)];

    [SVProgressHUD showImage:[UIImage imageNamed:@"37x-Checkmark"] status:@"设置成功"];
//    [SVProgressHUD showErrorWithStatus:@"发送飞洒是否"];
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
