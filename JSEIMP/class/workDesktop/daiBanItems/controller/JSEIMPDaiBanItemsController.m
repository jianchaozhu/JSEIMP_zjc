//
//  JSEIMPDaiBanItemsController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/12/14.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPDaiBanItemsController.h"
#import "JSEIMPNetWorking.h"
#import "JSEIMPDaiBanItemsDetailController.h"

static NSString *cellID = @"cellID";

@interface JSEIMPDaiBanItemsController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *activityIdMArray;

@property(nonatomic,strong)NSMutableArray *IDMArray;
//节点
@property(nonatomic,strong)NSMutableArray *activityNameMArray;
//名称
@property(nonatomic,strong)NSMutableArray *nameMArray;
//日期
@property(nonatomic,strong)NSMutableArray *timeMArray;
//合同id
@property(nonatomic,strong)NSMutableArray *contractIdMArray;

@end

@implementation JSEIMPDaiBanItemsController{
    
    UITableView *_tableView;
    
    UITableViewCell *_cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"待办事项";
    
    [self getData];
    
    [self setupUI];
}

-(void)getData{
    
    [JSEIMPNetWorking getDaiBanItemOnSuccess:^(NSMutableArray *activityIdMArray,NSMutableArray * IDMArray,NSMutableArray *activityNameMArray,NSMutableArray *nameMArray,NSMutableArray *timeMArray,NSMutableArray *contractIdMArray){
        
        _activityIdMArray = activityIdMArray.copy;
        _IDMArray = IDMArray.copy;
        _activityNameMArray = activityNameMArray.copy;
        _nameMArray = nameMArray.copy;
        _timeMArray = timeMArray.copy;
        _contractIdMArray = contractIdMArray.copy;
        
        [_tableView reloadData];
        
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
    
    return _IDMArray.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *str = _nameMArray[indexPath.row];
    
    CGSize size = [str sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(280, 999) lineBreakMode:NSLineBreakByWordWrapping];
    
    return size.height + 50;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JSEIMPDaiBanItemsDetailController *daiBanItemsDetailController = [JSEIMPDaiBanItemsDetailController new];
    
    daiBanItemsDetailController.activityId = [_activityIdMArray[indexPath.row] integerValue];
    daiBanItemsDetailController.contractName = _nameMArray[indexPath.row];
    daiBanItemsDetailController.contractId = _contractIdMArray[indexPath.row];
    
    [self.navigationController pushViewController:daiBanItemsDetailController animated:YES];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView cellForRowAtIndexPath:indexPath];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    
    _cell.textLabel.text = [NSString stringWithFormat:@"%zd   %@",indexPath.row + 1,_nameMArray[indexPath.row]];
    _cell.detailTextLabel.text = [NSString stringWithFormat:@"节点：%@     日期：%@",_activityNameMArray[indexPath.row],_timeMArray[indexPath.row]];
    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    _cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _cell.textLabel.numberOfLines = 0;
    _cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
    
    return _cell;
    
}

@end
