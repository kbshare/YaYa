//
//  AYHBaseCell.h
//  ayh
//
//  Created by administrator on 2017/2/22.
//  Copyright © 2017年 com.msxf. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AYHBaseCell : UITableViewCell

@property(nonatomic,strong) id  model;
@property(nonatomic,strong) NSDictionary *  params;
@property(nonatomic,strong) NSIndexPath  *  indexPath;
@property(nonatomic,weak) id<UITableViewDelegate,UITableViewDataSource> delegate;

/** -----刷新Cell空方法，子类必须重写此方法-----
 *  @model    数据模型 @params
 *  @delegate 控制器
 */
- (void)refreshCellWithModel:(id)model
                      params:(NSDictionary *)params
                   indexPath:(NSIndexPath *)indexPath
                    delegate:(id)delegate;

@end
