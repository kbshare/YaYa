//
//  KBDrawRectView.m
//  YaYa
//
//  Created by yawei.zhang on 2021/1/29.
//  Copyright © 2021 msxf. All rights reserved.
//

#import "KBDrawRectView.h"

@implementation KBDrawRectView

-(instancetype)init{
    
    if (self = [super init]) {
        [self setUI];
    }
    return self;
}


- (void)setUI{
    UIButton *btn = [UIButton buttonWithTitle:@"showError" KB_colortitleColorString:nil BackgroundImage:nil TitleFontSize:20 Target:self Action:@selector(showError:)];
    [self addSubview:btn];
    [btn setFrame:CGRectMake(0, 0, 30, 30)];
    btn.backgroundColor = UIColor.blueColor;
    self.backgroundColor = UIColor.redColor;
    
}

- (void)showError:(UIButton *)sender{
    NSLog(@"ShowError");
}
- (void)drawRect:(CGRect)rect{
    
    NSLog(@"KBDrawRectView iii  drawRect");
}

- (void)setNeedsDisplay{
    NSLog(@"setNeedsDisplay iii  drawRect");

    
}
@end
