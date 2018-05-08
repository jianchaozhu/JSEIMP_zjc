//
//  JSEIMPBuMenInJiaShiLvYeController.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/3/30.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPBuMenInJiaShiLvYeController.h"
#import "JSEIMPNetWorking.h"
#import "JSEIMPBuMenInLvYeManageCenterController.h"
#import "JSEIMPBuMenInShangHaiYiDaoHotelController.h"
#import "JSEIMPBuMenInTaiCangJiaLiHotelController.h"
#import "JSEIMPTaiCangJingYingHotelController.h"
#import "JSEIMPBuMenInSuZhouJiaShiGuoJiHotelController.h"
#import "JSEIMPBuMenInJiaShiTongJiHotelController.h"

static NSString *cellID = @"cellID";

@interface JSEIMPBuMenInJiaShiLvYeController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *buMenInJiaShiLvYeMArray;

@end

@implementation JSEIMPBuMenInJiaShiLvYeController{
    
    UITableView *_tableView;
    
    UITableViewCell *_cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleViewLabel = [[UILabel alloc] init];
    titleViewLabel.frame = CGRectMake(0, 0, 180, 40);
    titleViewLabel.numberOfLines = 0;
    titleViewLabel.font = [UIFont systemFontOfSize:16];
    titleViewLabel.text = _vcTitle;
    titleViewLabel.textAlignment = NSTextAlignmentCenter;
    
    self.navigationItem.titleView = titleViewLabel;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
    [self getData];
    
    [self setupUI];
}

- (void)returnAction {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)getData{
    
    [JSEIMPNetWorking getBuMenListWithJiaShiLvYe:@"001_04" IsIncludeZiJieDian:@"true" SkipCount:0 MaxResultCount:10000 OnSuccess:^(NSMutableArray *buMenInJiaShiLvYeMArray){
        
        _buMenInJiaShiLvYeMArray = buMenInJiaShiLvYeMArray.copy;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [_tableView reloadData];
        });
        
    } onErrorInfo:nil];
}

-(void)setupUI{
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    _tableView.tableFooterView = [[UIView alloc]init];
    
    [self.view addSubview:_tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _buMenInJiaShiLvYeMArray.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([_buMenInJiaShiLvYeMArray[indexPath.row] isEqualToString:@"旅业管理中心"]) {

        JSEIMPBuMenInLvYeManageCenterController *buMenInLvYeManageCenterController = [JSEIMPBuMenInLvYeManageCenterController new];

        buMenInLvYeManageCenterController.vcTitle = _buMenInJiaShiLvYeMArray[indexPath.row];

        [self.navigationController pushViewController:buMenInLvYeManageCenterController animated:YES];
    }else if ([_buMenInJiaShiLvYeMArray[indexPath.row] isEqualToString:@"上海驿岛酒店"]){
        
        JSEIMPBuMenInShangHaiYiDaoHotelController *buMenInShangHaiYiDaoHotelController = [JSEIMPBuMenInShangHaiYiDaoHotelController new];
        
        buMenInShangHaiYiDaoHotelController.vcTitle = _buMenInJiaShiLvYeMArray[indexPath.row];
        
        [self.navigationController pushViewController:buMenInShangHaiYiDaoHotelController animated:YES];
    }else if ([_buMenInJiaShiLvYeMArray[indexPath.row] isEqualToString:@"太仓嘉礼酒店"]){
        
        JSEIMPBuMenInTaiCangJiaLiHotelController *buMenInTaiCangJiaLiHotelController = [JSEIMPBuMenInTaiCangJiaLiHotelController new];
        
        buMenInTaiCangJiaLiHotelController.vcTitle = _buMenInJiaShiLvYeMArray[indexPath.row];
        
        [self.navigationController pushViewController:buMenInTaiCangJiaLiHotelController animated:YES];
    }else if ([_buMenInJiaShiLvYeMArray[indexPath.row] isEqualToString:@"太仓菁英公寓"]){
        
        JSEIMPTaiCangJingYingHotelController *taiCangJingYingHotelController = [JSEIMPTaiCangJingYingHotelController new];
        
        taiCangJingYingHotelController.vcTitle = _buMenInJiaShiLvYeMArray[indexPath.row];
        
        [self.navigationController pushViewController:taiCangJingYingHotelController animated:YES];
    }else if ([_buMenInJiaShiLvYeMArray[indexPath.row] isEqualToString:@"苏州嘉实国际酒店公寓"]){
        
        JSEIMPBuMenInSuZhouJiaShiGuoJiHotelController *buMenInSuZhouJiaShiGuoJiHotelController = [JSEIMPBuMenInSuZhouJiaShiGuoJiHotelController new];
        
        buMenInSuZhouJiaShiGuoJiHotelController.vcTitle = _buMenInJiaShiLvYeMArray[indexPath.row];
        
        [self.navigationController pushViewController:buMenInSuZhouJiaShiGuoJiHotelController animated:YES];
    }else if ([_buMenInJiaShiLvYeMArray[indexPath.row] isEqualToString:@"上海嘉实同济接待中心"]){
        
        JSEIMPBuMenInJiaShiTongJiHotelController *buMenInJiaShiTongJiHotelController = [JSEIMPBuMenInJiaShiTongJiHotelController new];
        
        buMenInJiaShiTongJiHotelController.vcTitle = _buMenInJiaShiLvYeMArray[indexPath.row];
        
        [self.navigationController pushViewController:buMenInJiaShiTongJiHotelController animated:YES];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView cellForRowAtIndexPath:indexPath];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    
    if ([_buMenInJiaShiLvYeMArray[indexPath.row] isEqualToString:@"苏州驿岛嘉元酒店"]) {
        
        _cell.textLabel.text = _buMenInJiaShiLvYeMArray[indexPath.row];
        _cell.selectionStyle = UITableViewCellSelectionStyleNone;
        _cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    }else{
        
        _cell.textLabel.text = _buMenInJiaShiLvYeMArray[indexPath.row];
        _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        _cell.selectionStyle = UITableViewCellSelectionStyleNone;
        _cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    }
    
    return _cell;
    
}

@end
