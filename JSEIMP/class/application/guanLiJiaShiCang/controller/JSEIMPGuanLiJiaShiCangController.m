//
//  JSEIMPGuanLiJiaShiCangController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/12/29.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPGuanLiJiaShiCangController.h"
#import "JSEIMPJianSheOptionController.h"
#import "JSEIMPJianLiOptionController.h"

static NSString *cellID = @"cellID";

@interface JSEIMPGuanLiJiaShiCangController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *nameMArray;

@end

@implementation JSEIMPGuanLiJiaShiCangController{
    
    UITableView *_tableView;
    
    UITableViewCell *_cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"管理驾驶舱";
    
    _nameMArray = [NSMutableArray arrayWithObjects:@"建设意见交流评价",@"监理意见交流评价", nil];
    
    [self setupUI];
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
    
    return _nameMArray.count;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        JSEIMPJianSheOptionController *jianSheOptionController = [JSEIMPJianSheOptionController new];
        
        [self.navigationController pushViewController:jianSheOptionController animated:YES];
    }else if (indexPath.row == 1){
        
        JSEIMPJianLiOptionController *_jianLiOptionController = [JSEIMPJianLiOptionController new];
        
        [self.navigationController pushViewController:_jianLiOptionController animated:YES];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView cellForRowAtIndexPath:indexPath];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    
    _cell.textLabel.text = _nameMArray[indexPath.row];
    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    _cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    return _cell;
    
}

@end
