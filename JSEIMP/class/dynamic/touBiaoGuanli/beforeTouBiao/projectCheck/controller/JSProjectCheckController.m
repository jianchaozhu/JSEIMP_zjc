//
//  JSProjectCheckController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/9/22.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSProjectCheckController.h"
#import "JSProjectCheckDetailController.h"
#import "JSEIMPNewProjectCheckController.h"

static NSString *cellID = @"cellID";

@interface JSProjectCheckController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *projectNameMArray;

@property(nonatomic,strong)NSMutableArray *checkTimeMArray;

@end

@implementation JSProjectCheckController{
    
    UITableView *_tableView;
    
    UITableViewCell *_cell;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"工程考察";
    
    _projectNameMArray = [NSMutableArray arrayWithObjects:@"俞泾浦南、四平路西地块综合开发项目总包工程",@"苏州嘉苑和广场", nil];
    _checkTimeMArray = [NSMutableArray arrayWithObjects:@"2017-09-22",@"2017-06-12", nil];
    
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
    
    JSEIMPNewProjectCheckController *newProjectCheckController = [JSEIMPNewProjectCheckController new];
    
    [self.navigationController pushViewController:newProjectCheckController animated:YES];
    
    //    if (_canInformationPut == YES) {
    
    //    }
    //    else if (_canInformationPut == NO){
    //
    //        [self setupAlertLabelWithTitle:@"对不起，您没有此权限" Rect:CGRectMake(self.view.center.x - 90, self.view.center.y + 100, 180, 50)];
    //
    //    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    NSString *str = _projectNameMArray[indexPath.row];
    
    CGSize size = [str sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(280, 999) lineBreakMode:NSLineBreakByWordWrapping];
    
    
    return size.height + 40;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    JSProjectCheckDetailController *projectCheckDetailController = [JSProjectCheckDetailController new];
    
    projectCheckDetailController.projectName = _projectNameMArray[indexPath.row];
    projectCheckDetailController.checkTime = _checkTimeMArray[indexPath.row];
    
    [self.navigationController pushViewController:projectCheckDetailController animated:YES];

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView cellForRowAtIndexPath:indexPath];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    
    if (indexPath.row == 0) {
        
        _cell.textLabel.text = _projectNameMArray[indexPath.row];
        _cell.detailTextLabel.text = _checkTimeMArray[indexPath.row];
        
    }else if (indexPath.row == 1){
        
        _cell.textLabel.text = _projectNameMArray[indexPath.row];
        _cell.detailTextLabel.text = _checkTimeMArray[indexPath.row];
        
    }
    
    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    _cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _cell.textLabel.numberOfLines = 0;
    
    return _cell;
    
}

@end
