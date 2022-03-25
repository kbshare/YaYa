//
//  KBPlistFileViewController.m
//  YaYa
//
//  Created by administrator on 2018/12/7.
//  Copyright © 2018年 msxf. All rights reserved.
//

#import "KBPlistFileViewController.h"
#import "YYText.h"
@interface KBPlistFileViewController ()

@end

@implementation KBPlistFileViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *path = [[NSBundle mainBundle] pathForResource:@"EvnPlist" ofType:@"plist"];
    NSData * certData =[NSData dataWithContentsOfFile:path];
    [NSDictionary dictionaryWithContentsOfURL:nil];
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    NSLog(@"%@",arr);

    YYLabel *lab =[[YYLabel alloc]initWithFrame:CGRectMake(FIT(16),FIT(16),SCREEN_WIDTH - FIT(32), FIT(44))];
    lab.numberOfLines = 0;
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:FIT(14)], NSForegroundColorAttributeName: [UIColor blueColor]};
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"注册及登录即代表您同意我们的《隐私政策》及《注册协议》" attributes:attributes];
    //设置高亮色和点击事件
    [text yy_setTextHighlightRange:[[text string] rangeOfString:@"《注册协议》"] color:[UIColor blueColor] backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        NSLog(@"点击了《注册协议》");
    }];
    
    
    
    //设置高亮色和点击事件
    [text yy_setTextHighlightRange:[[text string] rangeOfString:@"《隐私政策》"] color:[UIColor blueColor] backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        NSLog(@"点击了《隐私政策》");
        
    }];
    lab.userInteractionEnabled = YES;
    lab.attributedText = text;
    [self.view addSubview:lab];
    
    
    
    
    
    NSString *titleString = @"您有专项额度20000元，点击领取";
    NSMutableAttributedString *maTitleString = [[NSMutableAttributedString alloc] initWithString:titleString];
    //创建一个小标签的Label
    NSString *aa = @"优选标签";
    CGFloat aaW = 9*aa.length +4;
    UILabel *aaL = [[UILabel alloc]init];
    aaL.frame = CGRectMake(0, 0, aaW*3, 14*3);
    aaL.text = aa;
    aaL.font = [UIFont systemFontOfSize:9 * 3];
    aaL.textColor = [UIColor whiteColor];
    aaL.backgroundColor = [UIColor clearColor];
    aaL.layer.masksToBounds = YES;
    aaL.layer.borderColor = [UIColor whiteColor].CGColor;
    aaL.layer.borderWidth = 1;
    aaL.clipsToBounds = YES;
    
    aaL.layer.cornerRadius = 9*3;
    aaL.textAlignment = NSTextAlignmentCenter;
    //调用方法，转化成Image
    UIImage *image = [self imageWithUIView:aaL];
    //创建Image的富文本格式
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.bounds = CGRectMake(0, -2.5, aaW, 16); //这个-2.5是为了调整下标签跟文字的位置
    attach.image = image;
    //添加到富文本对象里
    NSAttributedString * imageStr = [NSAttributedString attributedStringWithAttachment:attach];
    [maTitleString insertAttributedString:imageStr atIndex:0];//加入文字前面
    //[maTitleString appendAttributedString:imageStr];//加入文字后面
    //[maTitleString insertAttributedString:imageStr atIndex:4];//加入文字第4的位置
    
    //注意 ：创建这个Label的时候，frame，font，cornerRadius要设置成所生成的图片的3倍，也就是说要生成一个三倍图，否则生成的图片会虚，同学们可以试一试。
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.frame = CGRectMake(50, 200,350, 30);
    titleLabel.backgroundColor = [UIColor blueColor];
    titleLabel.numberOfLines = 0;
    [self.view addSubview:titleLabel];
    titleLabel.attributedText = maTitleString;
    
    
    
    
//    UIButton *hotBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 300, 60, 60)];
//    hotBtn.titleLabel.font = AYHFont(8);
//    hotBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
//    [hotBtn setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
//    [hotBtn setBackgroundColor:[UIColor blackColor]];
//    hotBtn.titleEdgeInsets = UIEdgeInsetsMake(0, FIT(3), 0, FIT(3));
//    [self.view addSubview:hotBtn];
//    //        hotBtn.hidden = YES;
//
//    CGFloat radius = 13.0f;
//    UIBezierPath * patah = [UIBezierPath bezierPathWithRoundedRect:hotBtn.bounds byRoundingCorners:UIRectCornerTopRight | UIRectCornerTopLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(radius, radius)];
//    CAShapeLayer * mask  = [[CAShapeLayer alloc]init];
//    mask.lineWidth = 1;
//    mask.strokeColor = [UIColor purpleColor].CGColor;
//    mask.fillColor = [UIColor yellowColor].CGColor;
//    mask.path = patah.CGPath;
//
//    hotBtn.layer.mask = mask;
//    [hotBtn setTitle:@"sdfasf" forState:UIControlStateNormal];
//
    
    
}
//view转成image
- (UIImage*) imageWithUIView:(UIView*) view{
    UIGraphicsBeginImageContext(view.bounds.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:ctx];
    UIImage* tImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tImage;
}


@end
