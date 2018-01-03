//
//  JSEIMPJianSheOptionController.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/1/2.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPJianSheOptionController.h"
#import "JSEIMPJianSheOptionDetailController.h"

static NSString *cellID = @"cellID";

@interface JSEIMPJianSheOptionController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSString *projectName;

@property(nonatomic,strong)NSString *diaoChaDate;

@end

@implementation JSEIMPJianSheOptionController{
    
    UITableView *_tableView;
    
    UITableViewCell *_cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"建设意见交流评价";
    
    _projectName = @"无锡万科金域缇香项目";
    
    _diaoChaDate = @"2017-12-27";
    
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
    
    JSEIMPJianSheOptionDetailController *jianSheOptionDetailController = [JSEIMPJianSheOptionDetailController new];
    
    jianSheOptionDetailController.projectName = _projectName;
    jianSheOptionDetailController.diaoChaDate = _diaoChaDate;
    
    [self.navigationController pushViewController:jianSheOptionDetailController animated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView cellForRowAtIndexPath:indexPath];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    
    _cell.textLabel.text = _projectName;
    _cell.detailTextLabel.text = [NSString stringWithFormat:@"单号：YJD-201712-0001   调查日期：%@",_diaoChaDate,nil];
    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    _cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _cell.textLabel.numberOfLines = 0;
    _cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
    
    return _cell;
    
}

@end
