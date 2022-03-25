//
//  CZBaseController.m
//  weixin
//
//  Created by zhiwei on 16/1/11.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "CZBaseController.h"

@interface CZBaseController ()



@end

@implementation CZBaseController

-(NSArray *)plistArray{
    
    if (_plistArray == nil) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:self.plistName ofType:@"plist"];
        _plistArray = [NSArray arrayWithContentsOfFile:path];
    }
    
    return _plistArray;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        return [super initWithStyle:UITableViewStyleGrouped];
    }
    return self;
}


#pragma mark - UITableView代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.plistArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray *rowArray = self.plistArray[section];
    
    return rowArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    NSArray *rowArray = self.plistArray[indexPath.section];
    
    NSDictionary *dic = rowArray[indexPath.row];
    
    cell.textLabel.text = dic[@"name"];
    
    if (dic[@"icon"]) {
        cell.imageView.image = [UIImage imageNamed:dic[@"icon"]];
    }
    
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 70;
}

@end
