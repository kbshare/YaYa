//
//  KBTestTextfiledControllerViewController.m
//  YaYa
//
//  Created by KBMore on 2021/3/17.
//  Copyright © 2021 msxf. All rights reserved.
//

#import "KBTestTextfiledControllerViewController.h"
#import "AYHTextField.h"

@interface KBTestTextfiledControllerViewController ()

@end

@implementation KBTestTextfiledControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    AYHTextField *textfiel = [[AYHTextField alloc]initWithFrame:CGRectMake(20, 50, 370, 30)];
    textfiel.placeholder = @"哒哒哒哒哒哒";
    [self.view addSubview:textfiel];
    textfiel.leftViewMode= UITextFieldViewModeAlways;
    textfiel.rightViewMode = UITextFieldViewModeAlways;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    view.backgroundColor = UIColor.redColor;
    textfiel.leftView = view;
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    view1.backgroundColor = UIColor.blueColor;
    textfiel.rightView = view1;
    textfiel.clearButtonMode = UITextFieldViewModeWhileEditing;

    
//    [textfiel editingRectForBounds: CGRectInset(textfiel.bounds, 90, 0)];
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
