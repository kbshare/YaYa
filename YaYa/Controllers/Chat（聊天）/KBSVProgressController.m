//
//  KBSVProgressController.m
//  YaYa
//
//  Created by a58 on 2021/12/21.
//  Copyright © 2021 msxf. All rights reserved.
//

#import "KBSVProgressController.h"
#import "AYHSVProgressHUD.h"
#import "UIView+HSToast.h"
#import "HSToastTool.h"
#import <SDWebImage/UIImage+Gif.h>
#import <SDWebImage/SDWebImageCompat.h>
#import "UIImage+KBGif.h"


@interface KBSVProgressController ()
@property (nonatomic, strong) UIImageView *gifImage;
@property (nonatomic, strong) UIImageView  *gifImageview;


@end

@implementation KBSVProgressController


- (void)injected{
    [self viewDidLoad];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addBtnTitle:@"toastBtm" action:@selector(toastmessage) frame:CGRectMake(30, 60, 360, 40)];
    [self addBtnTitle:@"toastStatus" action:@selector(toastStatus) frame:CGRectMake(30, 120, 360, 40)];
    [self addBtnTitle:@"toastStatusPosition" action:@selector(toastStatusPosition) frame:CGRectMake(30, 180, 360, 40)];
    
    [self addBtnTitle:@"toastmessageLong" action:@selector(toastmessageLong) frame:CGRectMake(30, 240, 360, 40)];
    [self addBtnTitle:@"toastStatuslong" action:@selector(toastStatuslong) frame:CGRectMake(30, 300, 360, 40)];
    [self addBtnTitle:@"警告" action:@selector(info) frame:CGRectMake(30, 360, 360, 40)];
    
    [self addBtnTitle:@"toastBtm 超长文字" action:@selector(toastAtBtmlong) frame:CGRectMake(30, 420, 360, 40)];
    [self addBtnTitle:@"Toast 单行文字提示-中间" action:@selector(errorAtMid) frame:CGRectMake(30, 480, 360, 40)];
    [self addBtnTitle:@"Toast 单行文字提示-顶部" action:@selector(infoAtTop) frame:CGRectMake(30, 540, 360, 40)];
    
    [self addBtnTitle:@"Toast animationImage" action:@selector(animationImage) frame:CGRectMake(30, 600, 360, 40)];
    
    UIButton *btn = [UIButton buttonWithFrame:CGRectMake(0, 650, 40, 40)  buttonWithTitle:@"使用缓存flutter engine" KB_colortitleColorString:@"#ffffff" BackgroundImage:nil TitleFontSize:18 Target:self Action:@selector(huancunClick)];
    btn.backgroundColor = UIColor.blueColor;
    [self.view addSubview:btn];
    
   
    
//    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        [UIView animateWithDuration:3 animations:^{
//            btn.frame = CGRectMake(200, 200, 40, 40);
//        }];
//        NSLog(@"---------");
//    }];
//    
    
    
    UIImageView *gifImageV = [[UIImageView alloc]init];
    _gifImage = gifImageV;
    [self.gifImage setFrame:CGRectMake(30, 640,60, 40)];
    [self.view addSubview:self.gifImage];

    [gifImageV setImage:[UIImage animatedGIFNamed:@"angle-mask"]];
    
//    NSString *imagePath =  [[NSBundle mainBundle] pathForResource:@"a.gif" ofType:nil];
//    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    

    
//   NSArray *arr = [self breakGifWithName:@"a"];
//    self.gifImage.animationImages = arr;
//    self.gifImage.animationRepeatCount = 0;
//    self.gifImage.animationDuration = 0.016*arr.count;
//    [ self.gifImage startAnimating];
    
    
    
//    NSArray*loadingArray= image.images;
//    self.gifImage.animationImages= loadingArray;
//    self.gifImage.animationDuration=5;//执行一次完整动画所需的时长
//    self.gifImage.animationRepeatCount =90;//动画重复次数
//    [_gifImage setImage:image];
//
//
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//    animation.toValue = [NSNumber numberWithFloat:M_PI * 2.0];
//    animation.duration = 2.0f;
//    animation.cumulative = YES;
//    animation.repeatCount = MAXFLOAT;
//    [self.gifImage.layer addAnimation:animation forKey:@"rotationAnimation"];
    

  
    
    
    

    
    [SVProgressHUD setMaximumDismissTimeInterval:2.0];
    [SVProgressHUD setForegroundColor:UIColor.whiteColor];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.75]];
    [SVProgressHUD setFont:[UIFont systemFontOfSize:14]];
    [SVProgressHUD setCornerRadius:6];
    
}




- (UIButton *)addBtnTitle:(NSString *)title action:(SEL)sel frame:(CGRect)frame{
    UIButton *btn = [[UIButton alloc]initWithFrame:frame];
    [btn setBackgroundColor:UIColor.lightGrayColor];
    [btn setTitleColor:UIColor.yellowColor forState:UIControlStateNormal];
    [btn addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:title forState:UIControlStateNormal];
    [self.view addSubview:btn];
    return  btn;
}

- (void)toastmessage{
    [HSToastTool makeToast:@"成功, 带图" status:HSToastToolStatusInfo];
    
//    NSString *imagePath =  [[NSBundle mainBundle] pathForResource:@"a.gif" ofType:nil];
//    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
//    [self.view makeToast:@"dddasdfa 阿萨德" duration:3 position:HSToastPositionCenter title:@"标题" image:image style:nil completion:nil];
    
}

- (void)toastStatus{
//    CSToastStyle *style = [[CSToastStyle alloc]initWithDefaultStyle];
//    style.imageSize = CGSizeMake(20, 20);
//    style.cornerRadius = 2;
//    style.messageFont = [UIFont systemFontOfSize:16];
//    style.backgroundColor =  [UIColor colorWithRed:61/255.0 green:61/255.0 blue:61/255.0 alpha:1/1.0];
//    [self.view makeToast:@"带图片" duration:2 position:CSToastPositionCenter title:nil image:[UIImage imageNamed:@"success"] style:style completion:nil];
    [HSToastTool makeToast:@"这是成功, 带图标" status:HSToastToolStatusLoading];
}
- (void)toastStatusPosition{
   
    [HSToastTool makeToast:@"是成功是成功是成功是功是成功是成功是功是成功是成功是功是成功是成功是功是成功是成功是成功" status:HSToastToolStatusFail position:HSToastToolPositionTypeCenter];
}

- (void)toastmessageLong{
    [HSToastTool makeToast:@"成功成功是成功是成功是成功是成功是成功是成功是成功是成功是成功是"];
}


- (void)toastStatuslong{
    [HSToastTool makeToast:@"成功成功是成功是成功是成功是成功是成功是成功是成功是成功是成功是" status:HSToastToolStatusInfo];

}


- (void)info{
    [AYHSVProgressHUD showInfoWithStatus:@"这是警告, 带图标"];
}


- (void)animationImage{
    [HSToastTool makeToast:@"是成功是成功是成功是成功" status:HSToastToolStatusLoading position:HSToastToolPositionTypeCenter];
}



- (void)progress{
 
    
}


-(NSMutableArray <UIImage *>*)breakGifWithName:(NSString *)gifName{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:gifName ofType:@"gif"];
    NSData *data = [NSMutableData dataWithContentsOfFile:path];
    CGImageSourceRef gifSource = CGImageSourceCreateWithData((__bridge CFDataRef)data, NULL);
    size_t count = CGImageSourceGetCount(gifSource);
    NSMutableArray *images = [[NSMutableArray alloc]init];
    for (size_t i = 0; i<count; i++) {
        CGImageRef cgImage = CGImageSourceCreateImageAtIndex(gifSource, i, NULL);
        UIImage *img = [UIImage imageWithCGImage:cgImage];
        [images addObject:img];
    }
    return images;
}

@end
