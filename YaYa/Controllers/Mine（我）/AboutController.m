//
//  AboutController.m
//  weixin
//
//  Created by zhiwei on 16/1/11.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "AboutController.h"
#import "AboutHeaderView.h"

@interface AboutController ()



@end

@implementation AboutController





- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.plistName = @"About";
    
    
    //去除底部多余的表格线
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    
    //设置table头部视图
    AboutHeaderView *headView = [[AboutHeaderView alloc] init];
    self.tableView.tableHeaderView = headView;
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        return [super initWithStyle:UITableViewStylePlain];
    }
    return self;
}


#pragma mark - Table view data source


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.plistArray.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
       
    NSDictionary *dic = self.plistArray[indexPath.row];
    
    cell.textLabel.text = dic[@"name"];
    
    
    return cell;
}



@end
