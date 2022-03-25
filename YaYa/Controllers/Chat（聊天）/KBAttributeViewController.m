//
//  KBAttributeViewController.m
//  YaYa
//
//  Created by yawei.zhang on 2020/12/2.
//  Copyright © 2020 msxf. All rights reserved.
//

#import "KBAttributeViewController.h"
#import "YYText.h"
@interface KBAttributeViewController ()

@end

@implementation KBAttributeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WHITE_COLOR;
    [self setUI];
    
}


- (void)setUI{
//    NSMutableParagraphStyle *ParagraphStyle =  [[NSMutableParagraphStyle alloc] init];
//        ParagraphStyle.lineHeightMultiple = 1;
//        ParagraphStyle.lineSpacing = 0;
//        ParagraphStyle.paragraphSpacing = 0;
//        ParagraphStyle.paragraphSpacingBefore = 0;
        
 
    NSDictionary *dic1 = @{NSFontAttributeName:[UIFont systemFontOfSize:15],
                              NSForegroundColorAttributeName:[UIColor blackColor],
                              NSBackgroundColorAttributeName:[UIColor yellowColor],
                              NSBaselineOffsetAttributeName:@(([UIFont systemFontOfSize:30].lineHeight - [UIFont systemFontOfSize:15].lineHeight)/2 + (([UIFont systemFontOfSize:30].descender - [UIFont systemFontOfSize:15].descender))),
//                              NSParagraphStyleAttributeName:ParagraphStyle
                              };
        NSDictionary *dic2 = @{NSFontAttributeName:[UIFont systemFontOfSize:30],
                               NSForegroundColorAttributeName:[UIColor redColor],
                               NSBackgroundColorAttributeName:[UIColor yellowColor],
//                               NSBaselineOffsetAttributeName:@0,
//                               NSParagraphStyleAttributeName:ParagraphStyle
                               };
        
        NSDictionary *dic3 = @{NSFontAttributeName:[UIFont systemFontOfSize:30],
                               NSForegroundColorAttributeName:[UIColor blueColor],
                               NSBackgroundColorAttributeName:[UIColor yellowColor],
//                               NSBaselineOffsetAttributeName:@0,
//                               NSParagraphStyleAttributeName:ParagraphStyle
                               };
        NSMutableAttributedString *attributeStr1 =  [[NSMutableAttributedString alloc] initWithString:@"柯晓琪" attributes:dic1];
        NSAttributedString *attributeStr2 =  [[NSAttributedString alloc] initWithString:@" 1234567890" attributes:dic2];
        NSAttributedString *attributeStr3 =  [[NSAttributedString alloc] initWithString:@" 😆jqLvQ" attributes:dic3];
        [attributeStr1 appendAttributedString:attributeStr3];
        [attributeStr1 appendAttributedString:attributeStr2];
        
//        NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
//        attachment.image = [UIImage imageNamed:@"tsj"];
//        attachment.bounds = CGRectMake(0,0,[UIFont systemFontOfSize:30].ascender,[UIFont systemFontOfSize:30].ascender);
//
//        [attributeStr1 appendAttributedString:[NSAttributedString attributedStringWithAttachment:attachment]];
////
//        CGRect rect = [attributeStr1 boundingRectWithSize:CGSizeMake(600, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:NULL];
////
//        NSLog(@"lineHeight : %f",[UIFont systemFontOfSize:30].lineHeight);
//        NSLog(@"pointSize : %f",[UIFont systemFontOfSize:30].pointSize);
//        NSLog(@"descender : %f",[UIFont systemFontOfSize:30].descender);
//        NSLog(@"ascender : %f",[UIFont systemFontOfSize:30].ascender);
//        NSLog(@"leading : %f",[UIFont systemFontOfSize:30].leading);
////
//        NSLog(@"descender + ascender + leading = %f",[UIFont systemFontOfSize:30].ascender - [UIFont systemFontOfSize:30].descender + [UIFont systemFontOfSize:30].leading);
//        NSLog(@"boundingRectWithSizeHeight : %f",rect.size.height);
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 600, 100)];
        label.attributedText = attributeStr1;
        label.numberOfLines = 0;
        [self.view addSubview:label];


    /*

    2018-03-12 14:00:34.619455+0800 JQ_textView[13941:5472023] lineHeight : 35.800781
    2018-03-12 14:00:34.619537+0800 JQ_textView[13941:5472023] pointSize : 30.000000
    2018-03-12 14:00:34.619556+0800 JQ_textView[13941:5472023] descender : -7.236328
    2018-03-12 14:00:34.619573+0800 JQ_textView[13941:5472023] ascender : 28.564453
    2018-03-12 14:00:34.619596+0800 JQ_textView[13941:5472023] leading : 0.000000
    2018-03-12 14:00:34.619614+0800 JQ_textView[13941:5472023] descender + ascender + leading = 35.800781
    2018-03-12 14:00:34.619627+0800 JQ_textView[13941:5472023] boundingRectWithSizeHeight : 35.800781

    */
//    NSMutableParagraphStyle *ParagraphStyle =  [[NSMutableParagraphStyle alloc] init];
//        ParagraphStyle.lineHeightMultiple = 1;
//        ParagraphStyle.lineSpacing = 0;
//        ParagraphStyle.paragraphSpacing = 0;
//        ParagraphStyle.paragraphSpacingBefore = 0;
    
    
    UIFont *specFont = [UIFont fontWithName:@"DINAlternate-Bold" size:FIT(20)];
    UIColor *whiteCusColor =  [UIColor kb_colorWithHexString:@"#FFFFFF" alpha:0.7];
    UIColor *yellowCusColor =  [UIColor kb_colorWithHexString:@"#FFCD00"];
    
    
    NSDictionary *normalAttributes  = @{
        NSForegroundColorAttributeName: [UIColor kb_colorWithHexString:@"#FFFFFF" alpha:0.7],
        NSBaselineOffsetAttributeName:@6
    };
    
    NSDictionary *whiteAttributes  = @{
        NSFontAttributeName:[UIFont fontWithName:@"DINAlternate-Bold" size:FIT14],
        NSForegroundColorAttributeName: [UIColor kb_colorWithHexString:@"#FFFFFF" alpha:0.7],
    };

    NSDictionary *yellowAttribute = @{
        NSFontAttributeName:[UIFont fontWithName:@"DINAlternate-Bold" size:FIT14],
        NSForegroundColorAttributeName: [UIColor kb_colorWithHexString:@"#FFCD00"],
    };
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString: @"旧时月色,算几番照我,梅边吹笛?唤起玉人,不管清寒与攀摘.何逊而今渐老,都忘却,春风词笔."];
    
    [attrStr yy_setFont:specFont range:NSMakeRange(4, 4)];
    [attrStr yy_setColor:yellowCusColor range:NSMakeRange(4, 4)];
            [attrStr yy_setAttribute:NSBaselineOffsetAttributeName value:@(-20) range:NSMakeRange(4, 4)];
//            totalAmountStr yy_setLineHeightMultiple:<#(CGFloat)#> range:<#(NSRange)#>
//    [attrStr yy_setBaselineOffset:@10 range:NSMakeRange(4, 4)];
//    attrStr.yy_color = [UIColor blueColor];
//    attrStr.yy_font = [UIFont boldSystemFontOfSize:20.0];
    
//    YYTextLinePositionSimpleModifier *modifier = [[YYTextLinePositionSimpleModifier alloc] init];
//    modifier.fixedLineHeight = -10;

    YYLabel *label1 = [[YYLabel alloc] init];
    label1.numberOfLines = 0;
    label1.frame = CGRectMake(0.0, 64.0, self.view.bounds.size.width, 500.0);
//    label1.linePositionModifier = modifier;
    label1.attributedText = attrStr;
    [self.view addSubview:label1];


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
