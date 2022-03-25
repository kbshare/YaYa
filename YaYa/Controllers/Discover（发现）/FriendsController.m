//
//  FriendsController.m
//  weixin
//
//  Created by zhiwei on 16/1/11.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "FriendsController.h"
#import "Friednd.h"
#import "FriendCell.h"

#import "XHImageViewer.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
#define HeadImageH   200
#define Margin  10
#define UserIconWH 80
#define TableHeadViewH 250

@interface FriendsController ()

//头部背景图片
@property (nonatomic,weak)UIImageView *headImage;

//模型数组
@property (nonatomic,strong) NSArray *models;

//cell
@property (nonatomic,strong) FriendCell *proCell;


@property (nonatomic,strong) UIImageView *coverView;




@end

@implementation FriendsController


#pragma mark - 懒加载
-(NSArray *)models{
    
    if (_models == nil) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends" ofType:@"plist"];
        NSArray *plistArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dic in plistArray) {
            
            Friednd *model = [Friednd friendsModelWithDic:dic];
            [tempArray addObject:model];
        }
        
        _models = tempArray;
    }
    
    return _models;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //点击图片监听通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pictureClick:) name:@"pictureClick" object:nil];
    
    
    //头部图片拉伸效果
    [self setupBackgroundView];
    
    //用户本身配置信息（头像、用户名）
    [self setupUserConfig];
    
    
    //注册cell
    UINib *cellNib = [UINib nibWithNibName:@"FriendCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"cell"];
    
    self.proCell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
  
}


-(UIImageView *)coverView{
    
    if (_coverView == nil) {
        
        _coverView = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    
    return _coverView;
}

-(void)pictureClick:(NSNotification *)noti{
    NSString *imgName = noti.userInfo[@"picName"];
    UIImageView *tapView = noti.userInfo[@"tapView"];
    
    
    
    self.coverView.image = [UIImage imageNamed:imgName];
    XHImageViewer *imageViewer = [[XHImageViewer alloc] init];
    
    [imageViewer showWithImageViews:@[self.coverView
                                      ] selectedView:tapView];
    
    
}


#pragma mark - 头部图片拉伸效果
-(void)setupBackgroundView{
    
    //设置头部背景图片
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH)];
    
    UIImageView *headImage = [[UIImageView alloc] init];
    headImage.image = [UIImage imageNamed:@"headerImage1"];
    headImage.frame = CGRectMake(0, 0, ScreenW, 200);
    //适应图片框的大小
    headImage.contentMode = UIViewContentModeScaleAspectFill;
    [bgView addSubview:headImage];
    self.headImage = headImage;
    self.tableView.backgroundView = bgView;
    
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
//    NSLog(@"%@",NSStringFromCGPoint(scrollView.contentOffset));
    
    CGRect frame = self.headImage.frame;

    if (scrollView.contentOffset.y < 0) {
        frame.origin.y = 0;
        frame.size.height = 200 - scrollView.contentOffset.y;
    }else{
        
        frame.origin.y =  -scrollView.contentOffset.y;

    }
    
    self.headImage.frame = frame;

}

#pragma mark - 用户本身配置信息（头像、用户名）
-(void)setupUserConfig{
    
    //table头部视图
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, TableHeadViewH)];
    self.tableView.tableHeaderView = headView;
    
    
    //用户本身的头像
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenW-UserIconWH-Margin, TableHeadViewH-UserIconWH, UserIconWH, UserIconWH)];
    [btn setImage:[UIImage imageNamed:@"kenan"] forState:UIControlStateNormal];
    [headView addSubview:btn];
    
    
    //用户名
    UILabel *userNameLabel = [[UILabel alloc] init];
    userNameLabel.text = @"iOS大神";
    userNameLabel.textColor = [UIColor redColor];
    
    //计算文本的size
    CGSize textSize = [userNameLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:0 attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    
    userNameLabel.frame = CGRectMake(CGRectGetMinX(btn.frame)-Margin-textSize.width, CGRectGetMinY(btn.frame)+CGRectGetHeight(btn.frame)/2, textSize.width+10, textSize.height);
    [headView addSubview:userNameLabel];
    
    
    
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.models.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FriendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Friednd *model = self.models[indexPath.row];
    
    cell.friendModel = model;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Friednd *model = self.models[indexPath.row];
    
    self.proCell.friendModel = model;
    
    CGSize cellSize = [self.proCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    return cellSize.height;
    
}






-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}



@end
