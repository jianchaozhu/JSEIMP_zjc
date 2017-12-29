//
//  JSEIMPYiBanItemsController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/12/28.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPYiBanItemsController.h"

static NSString *cellID = @"cellID";

@interface JSEIMPYiBanItemsController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation JSEIMPYiBanItemsController{
    
    UITableView *_tableView;
    
    UITableViewCell *_cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"已办事项";
    
    [self getData];
    
    [self setupUI];
}

-(void)getData{
    
    
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *str = @"苏州天籁城总承包合同";
    
    CGSize size = [str sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(280, 999) lineBreakMode:NSLineBreakByWordWrapping];
    
    return size.height + 50;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView cellForRowAtIndexPath:indexPath];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    
    _cell.textLabel.text = [NSString stringWithFormat:@"%zd   苏州天籁城总承包合同",indexPath.row + 1];
    _cell.detailTextLabel.text = [NSString stringWithFormat:@"节点：发起人    日期：2017-12-28"];
    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    _cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _cell.textLabel.numberOfLines = 0;
    _cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
    
    return _cell;
    
}

@end
