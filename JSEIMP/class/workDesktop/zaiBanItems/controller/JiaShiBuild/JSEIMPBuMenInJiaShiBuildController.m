//
//  JSEIMPBuMenInJiaShiBuildController.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/3/29.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPBuMenInJiaShiBuildController.h"
#import "JSEIMPNetWorking.h"
#import "JSEIMPBuMenInJingYingManageCenterController.h"
#import "JSEIMPBuMenInAllCBManageCenterController.h"
#import "JSEIMPBuMenInWuXiFenCompanyController.h"
#import "JSEIMPBuMenInNanJingFenCompanyController.h"
#import "JSEIMPBuMenInZhengZhouFenCompanyController.h"
#import "JSEIMPBuMenInZhuangShiFenCompanyController.h"
#import "JSEIMPBuMenInJDAZGCCompanyController.h"
#import "JSEIMPBuMenInSZJJGCSBYXCompanyController.h"

static NSString *cellID = @"cellID";

@interface JSEIMPBuMenInJiaShiBuildController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *buMenInGroupManageBuMenMArray;

@property(nonatomic,strong)NSMutableArray *userNameMArray;

@property(nonatomic,strong)NSMutableArray *userIdMArray;

@end

@implementation JSEIMPBuMenInJiaShiBuildController{
    
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
    
    [self getBuMenData];
    
    [self setupUI];
}

- (void)returnAction {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)getBuMenData{
    
    [JSEIMPNetWorking getBuMenListWithJiaShiBuild:@"001_02" IsIncludeZiJieDian:@"true" SkipCount:0 MaxResultCount:10000 OnSuccess:^(NSMutableArray *buMenInGroupManageBuMenMArray){
        
        _buMenInGroupManageBuMenMArray = buMenInGroupManageBuMenMArray.copy;
        
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
    
    return _buMenInGroupManageBuMenMArray.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if ([_buMenInGroupManageBuMenMArray[indexPath.row] isEqualToString:@"经营管理中心"]) {

        JSEIMPBuMenInJingYingManageCenterController *buMenInJingYingManageCenterController = [JSEIMPBuMenInJingYingManageCenterController new];

        buMenInJingYingManageCenterController.vcTitle = _buMenInGroupManageBuMenMArray[indexPath.row];

        [self.navigationController pushViewController:buMenInJingYingManageCenterController animated:YES];
    }else if ([_buMenInGroupManageBuMenMArray[indexPath.row] isEqualToString:@"总承包管理中心"]) {
        
        JSEIMPBuMenInAllCBManageCenterController *buMenInAllCBManageCenterController = [JSEIMPBuMenInAllCBManageCenterController new];
        
        buMenInAllCBManageCenterController.vcTitle = _buMenInGroupManageBuMenMArray[indexPath.row];
        
        [self.navigationController pushViewController:buMenInAllCBManageCenterController animated:YES];
    }else if ([_buMenInGroupManageBuMenMArray[indexPath.row] isEqualToString:@"无锡分公司"]) {
        
        JSEIMPBuMenInWuXiFenCompanyController *buMenInWuXiFenCompanyController = [JSEIMPBuMenInWuXiFenCompanyController new];
        
        buMenInWuXiFenCompanyController.vcTitle = _buMenInGroupManageBuMenMArray[indexPath.row];
        
        [self.navigationController pushViewController:buMenInWuXiFenCompanyController animated:YES];
    }else if ([_buMenInGroupManageBuMenMArray[indexPath.row] isEqualToString:@"南京分公司"]) {
        
        JSEIMPBuMenInNanJingFenCompanyController *buMenInNanJingFenCompanyController = [JSEIMPBuMenInNanJingFenCompanyController new];
        
        buMenInNanJingFenCompanyController.vcTitle = _buMenInGroupManageBuMenMArray[indexPath.row];
        
        [self.navigationController pushViewController:buMenInNanJingFenCompanyController animated:YES];
    }else if ([_buMenInGroupManageBuMenMArray[indexPath.row] isEqualToString:@"郑州分公司"]) {
        
        JSEIMPBuMenInZhengZhouFenCompanyController *buMenInZhengZhouFenCompanyController = [JSEIMPBuMenInZhengZhouFenCompanyController new];
        
        buMenInZhengZhouFenCompanyController.vcTitle = _buMenInGroupManageBuMenMArray[indexPath.row];
        
        [self.navigationController pushViewController:buMenInZhengZhouFenCompanyController animated:YES];
    }else if ([_buMenInGroupManageBuMenMArray[indexPath.row] isEqualToString:@"装饰公司"]) {
        
        JSEIMPBuMenInZhuangShiFenCompanyController *buMenInZhuangShiFenCompanyController = [JSEIMPBuMenInZhuangShiFenCompanyController new];
        
        buMenInZhuangShiFenCompanyController.vcTitle = _buMenInGroupManageBuMenMArray[indexPath.row];
        
        [self.navigationController pushViewController:buMenInZhuangShiFenCompanyController animated:YES];
    }else if ([_buMenInGroupManageBuMenMArray[indexPath.row] isEqualToString:@"机电安装工程公司"]) {
        
        JSEIMPBuMenInJDAZGCCompanyController *buMenInJDAZGCCompanyController = [JSEIMPBuMenInJDAZGCCompanyController new];
        
        buMenInJDAZGCCompanyController.vcTitle = _buMenInGroupManageBuMenMArray[indexPath.row];
        
        [self.navigationController pushViewController:buMenInJDAZGCCompanyController animated:YES];
    }else if ([_buMenInGroupManageBuMenMArray[indexPath.row] isEqualToString:@"苏州嘉佳工程设备有限公司"]) {
        
        JSEIMPBuMenInSZJJGCSBYXCompanyController *buMenInSZJJGCSBYXCompanyController = [JSEIMPBuMenInSZJJGCSBYXCompanyController new];
        
        buMenInSZJJGCSBYXCompanyController.vcTitle = _buMenInGroupManageBuMenMArray[indexPath.row];
        
        [self.navigationController pushViewController:buMenInSZJJGCSBYXCompanyController animated:YES];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView cellForRowAtIndexPath:indexPath];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    
    if ([_buMenInGroupManageBuMenMArray[indexPath.row] isEqualToString:@"经营管理中心"] || [_buMenInGroupManageBuMenMArray[indexPath.row] isEqualToString:@"总承包管理中心"] || [_buMenInGroupManageBuMenMArray[indexPath.row] isEqualToString:@"无锡分公司"] || [_buMenInGroupManageBuMenMArray[indexPath.row] isEqualToString:@"南京分公司"] || [_buMenInGroupManageBuMenMArray[indexPath.row] isEqualToString:@"郑州分公司"] || [_buMenInGroupManageBuMenMArray[indexPath.row] isEqualToString:@"装饰公司"] || [_buMenInGroupManageBuMenMArray[indexPath.row] isEqualToString:@"机电安装工程公司"] || [_buMenInGroupManageBuMenMArray[indexPath.row] isEqualToString:@"苏州嘉佳工程设备有限公司"]) {
        
        _cell.textLabel.text = _buMenInGroupManageBuMenMArray[indexPath.row];
        _cell.selectionStyle = UITableViewCellSelectionStyleNone;
        _cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else{
        
        _cell.textLabel.text = _buMenInGroupManageBuMenMArray[indexPath.row];
        _cell.selectionStyle = UITableViewCellSelectionStyleNone;
        _cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    }
    
    return _cell;
    
}

@end
