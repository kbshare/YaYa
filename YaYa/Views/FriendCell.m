//
//  FriendCell.m
//  weixin
//
//  Created by zhiwei on 16/1/11.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "FriendCell.h"
#import "Friednd.h"

@interface FriendCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (weak, nonatomic) IBOutlet UIImageView *pictureImage;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *picW;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *picH;

@end


@implementation FriendCell

- (void)awakeFromNib {
    
    //设置圆形头像
    self.iconImage.clipsToBounds = YES;
    self.iconImage.layer.cornerRadius = self.iconImage.image.size.width/2;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    
    [self.pictureImage addGestureRecognizer:tap];
    
}

#pragma mark - 点击图片
-(void)tapClick{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pictureClick" object:nil userInfo:@{@"picName":self.friendModel.picture,@"tapView":self.pictureImage}];
}


-(void)setFriendModel:(Friednd *)friendModel{
    
    _friendModel = friendModel;
    
    self.iconImage.image = [UIImage imageNamed:_friendModel.headImg];
    self.nickNameLabel.text = _friendModel.nickname;
    self.contentLabel.text = _friendModel.content;
    
    if (_friendModel.picture) {
        self.pictureImage.image = [UIImage imageNamed:_friendModel.picture];
        self.picW.constant = self.pictureImage.image.size.width;
        self.picH.constant = self.pictureImage.image.size.height;
        
    }else{
        
        self.picH.constant = 0;
        self.pictureImage.image = nil;
    }
    
}





@end
