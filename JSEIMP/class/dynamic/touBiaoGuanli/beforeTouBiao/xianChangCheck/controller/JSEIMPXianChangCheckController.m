//
//  JSEIMPXianChangCheckController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/9/25.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPXianChangCheckController.h"
#import "JSEIMPXianChangTaKanDetailController.h"
#import "JSEIMPNewXianChangCheckController.h"

static NSString *cellID = @"cellID";

@interface JSEIMPXianChangCheckController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *projectNameMArray;

@property(nonatomic,strong)NSMutableArray *checkTimeMArray;

@end

@implementation JSEIMPXianChangCheckController{
    
    UITableView *_tableView;
    
    UITableViewCell *_cell;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"现场踏勘";
    
    _projectNameMArray = [NSMutableArray arrayWithObjects:@"俞泾浦南、四平路西地块综合开发项目总包工程",@"苏州嘉苑和广场", nil];
    _checkTimeMArray = [NSMutableArray arrayWithObjects:@"2017-08-08",@"2017-06-12", nil];
    
    [self setupUI];
    
}

-(void)setupUI{
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    [self.view addSubview:_tableView];
    
    //添加右边的按钮
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(clickAddButton)];
    
    self.navigationItem.rightBarButtonItem = addButton;
    
}

-(void)clickAddButton{
    
    JSEIMPNewXianChangCheckController *newXianChangCheckController = [JSEIMPNewXianChangCheckController new];
    
    [self.navigationController pushViewController:newXianChangCheckController animated:YES];
    
    //    if (_canInformationPut == YES) {
    
    //    }
    //    else if (_canInformationPut == NO){
    //
    //        [self setupAlertLabelWithTitle:@"对不起，您没有此权限" Rect:CGRectMake(self.view.center.x - 90, self.view.center.y + 100, 180, 50)];
    //
    //    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _projectNameMArray.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    NSString *str = _projectNameMArray[indexPath.row];
    
    CGSize size = [str sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(280, 999) lineBreakMode:NSLineBreakByWordWrapping];
    
    
    return size.height + 40;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JSEIMPXianChangTaKanDetailController *xianChangTaKanDetailController = [JSEIMPXianChangTaKanDetailController new];
    
    xianChangTaKanDetailController.projectName = _projectNameMArray[indexPath.row];
    xianChangTaKanDetailController.checkTime = _checkTimeMArray[indexPath.row];
    
    [self.navigationController pushViewController:xianChangTaKanDetailController animated:YES];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView cellForRowAtIndexPath:indexPath];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
        
    _cell.textLabel.text = _projectNameMArray[indexPath.row];
    _cell.detailTextLabel.text = _checkTimeMArray[indexPath.row];
    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    _cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _cell.textLabel.numberOfLines = 0;
    
    return _cell;
    
}

@end
