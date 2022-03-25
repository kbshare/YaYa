//
//  AYHBaseCell.m
//  ayh
//
//  Created by administrator on 2017/2/22.
//  Copyright © 2017年 com.msxf. All rights reserved.
//

#import "AYHBaseCell.h"

@interface AYHBaseCell()

@end
@implementation AYHBaseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor whiteColor];
    self.selectionStyle  = UITableViewCellSelectionStyleNone;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle  = UITableViewCellSelectionStyleNone;
    }
    return  self;
}
- (void)refreshCellWithModel:(id)model
                      params:(NSDictionary *)params
                   indexPath:(NSIndexPath  *)indexPath
                    delegate:(id)delegate{
    _model     = model;
    _params    = params;
    _indexPath = indexPath;
    _delegate  = delegate;
    
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)layoutSubviews{
    [super layoutSubviews];
    //[self refreshCellWithModel:_model params:_params indexPath:_indexPath delegate:_delegate];
}
@end
