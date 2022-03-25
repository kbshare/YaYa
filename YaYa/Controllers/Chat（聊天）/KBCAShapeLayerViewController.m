//
//  KBCAShapeLayerViewController.m
//  YaYa
//
//  Created by administrator on 2018/11/26.
//  Copyright © 2018年 msxf. All rights reserved.
//

#import "KBCAShapeLayerViewController.h"
#import "NSObject+KBCAShapeLayer.h"
#import "KBAView.h"
#import "KBBView.h"
#import "KBFirstModelVC.h"

@interface KBCAShapeLayerViewController ()
@property (nonatomic, strong) UIView *dynamicView;
@property (nonatomic, strong) CAShapeLayer *indicateLayer;
@end

@implementation KBCAShapeLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"fff";

    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 80, 100)];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    self.view.backgroundColor = WHITE_COLOR;
    
    //from: 使用CAShapeLayer实现复杂的View的遮罩效果
    //http://www.code4app.com/blog-969295-47109.html
    CAShapeLayer *layer = [CAShapeLayer createMaskLayerWithView:view];
    view.layer.mask = layer;
    
    [self addDynamicView];
    [self addVoiceBtn];
    [self refreshUIWithVoicePower:20];
    
    
    KBAView *a = [[KBAView alloc]initWithFrame:CGRectMake(200, 300, 175, 200)];
    [self.view addSubview:a];
    a.backgroundColor = [UIColor redColor];
    KBBView *b = [[KBBView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    b.backgroundColor = [UIColor blueColor];
    [a addSubview:b];
    
}

#pragma - event response
- (void)changeVoice:(UIButton *)sender{
//        int x = arc4random() % 100;
//
//            [self refreshUIWithVoicePower:x];
    [self presentViewController:[[KBFirstModelVC alloc]init] animated:YES completion:nil];


}

#pragma - UI
- (void)addDynamicView{
 
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, 200, 40, 100)];
    view.backgroundColor = [UIColor whiteColor];
    view.layer.borderColor = [UIColor grayColor].CGColor;
    view.layer.borderWidth = 2;
    self.dynamicView = view;
    view.layer.cornerRadius = FIT(20);
    view.layer.masksToBounds = YES;
    [self.view addSubview:view];
}
- (void)addVoiceBtn{
    
//     from :  http://www.code4app.com/blog-969295-47112.html 使用CAShapeLayer实现一个音量大小动态改变的控件
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(60, 200, 100, 40)];
    [btn setTitle:@"点我改变音量图形" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(changeVoice:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

-(void)refreshUIWithVoicePower : (NSInteger)voicePower{
    CGFloat height = (voicePower)*(CGRectGetHeight(_dynamicView.frame)/100);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, CGRectGetHeight(_dynamicView.frame)-height, CGRectGetWidth(_dynamicView.frame), height) cornerRadius:0];
    self.indicateLayer.path = path.CGPath;
    self.indicateLayer.fillColor = [UIColor grayColor].CGColor;
    [_dynamicView.layer addSublayer:_indicateLayer];
}

- (CAShapeLayer *)indicateLayer{
    if (!_indicateLayer) {
        CAShapeLayer *layer = [CAShapeLayer layer];
        _indicateLayer = layer;
    }
    return _indicateLayer;
    
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
