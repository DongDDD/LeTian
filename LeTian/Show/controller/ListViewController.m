//
//  ListViewController.m
//  LeTian
//
//  Created by jobs on 16/7/13.
//  Copyright © 2016年 jobs. All rights reserved.
//

#import "ListViewController.h"
#import "GoodsTableViewCell.h"
#import "DetailsViewController.h"




@interface ListViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,retain)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *goodsArray;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _getData];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"乐天商品展示";
    self.navigationController.navigationBar.barTintColor = klogoColor;
    [self _setLeft];
    [self _setRight];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle=NO;
//    self.tableView.backgroundColor=BACKGROUND_COLOR;

    [self.view addSubview:self.tableView];
    
}

-(void)_getData{
    
    //     创建BmobQuery实例，指定对应要操作的数据表名称
    BmobQuery *query = [BmobQuery queryWithClassName:@"show"];
    //按updatedAt进行降序排列
    [query orderByDescending:@"updatedAt"];
    //返回最多20个结果
    query.limit = 10;
    //执行查询
    [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        //处理查询结果
        
                for (BmobObject *obj in array) {
                    showModel *info    = [[showModel alloc] init];
                    if ([obj objectForKey:@"title"]) {
                        info.title    = [obj objectForKey:@"title"];
                    }
                    if ([obj objectForKey:@"describe"]) {
                        info.describe  = [obj objectForKey:@"describe"];
                    }
                    
                    if ([obj objectForKey:@"picUrl"]) {
                        info.picUrl  = [obj objectForKey:@"picUrl"];
                    }
                   
                
                    [self.goodsArray addObject:info];
                }
        [self.tableView reloadData];
        
    }];
    
    
}

-(void)_setLeft{
    UIButton *fanhu=[UIButton buttonWithType:UIButtonTypeSystem];
    fanhu.frame=CGRectMake(0, 0, 20, 18);
    [fanhu setBackgroundImage:[UIImage imageNamed: @"left"] forState:UIControlStateNormal];
    [fanhu addTarget:self action:@selector(itemLeftAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *currentMusicBtn1=[[UIBarButtonItem alloc]initWithCustomView:fanhu];
    self.navigationItem.leftBarButtonItem=currentMusicBtn1;
}

-(void)_setRight{
    UIButton *fanhu=[UIButton buttonWithType:UIButtonTypeSystem];
    fanhu.frame=CGRectMake(0, 0, 40, 36);
    [fanhu setBackgroundImage:[UIImage imageNamed: @"me"] forState:UIControlStateNormal];
    [fanhu addTarget:self action:@selector(itemRightAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *currentMusicBtn1=[[UIBarButtonItem alloc]initWithCustomView:fanhu];
    self.navigationItem.rightBarButtonItem=currentMusicBtn1;
}

-(void)itemLeftAction{
    
    NSLog(@"left");
}

-(void)itemRightAction{
    
    
    NSLog(@"right");
}
#pragma mark -tableView dataSoure

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.goodsArray.count;
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GoodsTableViewCell *cell = [[GoodsTableViewCell alloc]init];

    cell.showModel = self.goodsArray[indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
    
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailsViewController *DetailVC=[[DetailsViewController alloc]init];
    DetailVC.sModel = self.goodsArray[indexPath.row];
    [self.navigationController pushViewController:DetailVC animated:YES];
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //    HouseManagerTableViewCell *cell=[self tableView:tableView cellForRowAtIndexPath:indexPath];
    
    return 185;
    
}
//懒加载
-(NSMutableArray *)goodsArray{
    if (_goodsArray == nil) {
        _goodsArray = [NSMutableArray array];
    }
    return _goodsArray;
}


@end
