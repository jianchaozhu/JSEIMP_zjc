//
//  JSEIMPJianLiOptionController.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/1/4.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPJianLiOptionController.h"
#import "JSEIMPJianLiOptionDetailController.h"

static NSString *cellID = @"cellID";

@interface JSEIMPJianLiOptionController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSString *projectName;

@property(nonatomic,strong)NSString *diaoChaDate;

@end

@implementation JSEIMPJianLiOptionController{
    
    UITableView *_tableView;
    
    UITableViewCell *_cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"监理意见交流评价";
    
    _projectName = @"同济大学教职工宿舍";
    
    _diaoChaDate = @"2017-12-15";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
    [self setupUI];
}

- (void)returnAction {
    
    [self.navigationController popViewControllerAnimated:YES];
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
    
    return 1;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JSEIMPJianLiOptionDetailController *jianLiOptionDetailController = [JSEIMPJianLiOptionDetailController new];
    
    jianLiOptionDetailController.projectName = _projectName;
    jianLiOptionDetailController.diaoChaDate = _diaoChaDate;
    
    [self.navigationController pushViewController:jianLiOptionDetailController animated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView cellForRowAtIndexPath:indexPath];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    
    _cell.textLabel.text = _projectName;
    _cell.detailTextLabel.text = [NSString stringWithFormat:@"单号：JSYJD-201712-0006   调查日期：%@",_diaoChaDate,nil];
    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    _cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _cell.textLabel.numberOfLines = 0;
    _cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
    
    return _cell;
    
}


@end
