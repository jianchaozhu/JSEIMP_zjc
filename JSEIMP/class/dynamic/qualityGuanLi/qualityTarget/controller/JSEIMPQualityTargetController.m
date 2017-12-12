//
//  JSEIMPQualityTargetController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/11/20.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPQualityTargetController.h"
#import "JSEIMPQualityTargetDetailController.h"

static NSString *cellID = @"cellID";

@interface JSEIMPQualityTargetController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *projectNameMArray;

@property(nonatomic,strong)NSMutableArray *bianHaoMArray;

@property(nonatomic,strong)NSMutableArray *finalMArray;

@end

@implementation JSEIMPQualityTargetController{
    
    UITableView *_tableView;
    
    UITableViewCell *_cell;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"质量目标";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
    _projectNameMArray = [NSMutableArray arrayWithObjects:@"XDG(XQ)-2009-10号地块金色商业广场A地块4-8#楼及地库施工工程标段(万科)",@"金科宝华山项目（南京金科城）", nil];
    _bianHaoMArray = [NSMutableArray arrayWithObjects:@"TB17060066",@"TB17060069", nil];
    
    NSString *string1 = @"项目编号:";
    NSString *string2;
    
    _finalMArray = [NSMutableArray array];
    
    for (int i = 0; i < _projectNameMArray.count; i++) {
        
        string2 = [string1 stringByAppendingString:_bianHaoMArray[i]];
        
        [_finalMArray addObject:string2];
    }
    
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
    
    [self.view addSubview:_tableView];
    
    //添加右边的按钮
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(clickAddButton)];
    
    self.navigationItem.rightBarButtonItem = addButton;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _projectNameMArray.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_cell.textLabel.text.length > 20) {
        
        return 100;
    }
    
    return 80;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JSEIMPQualityTargetDetailController *qualityTargetDetailController = [JSEIMPQualityTargetDetailController new];
    
    qualityTargetDetailController.projectName = _projectNameMArray[indexPath.row];
    qualityTargetDetailController.bianHao = _bianHaoMArray[indexPath.row];
    
    [self.navigationController pushViewController:qualityTargetDetailController animated:YES];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView cellForRowAtIndexPath:indexPath];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    
    if (indexPath.row == 0) {
        
        _cell.textLabel.text = _projectNameMArray[indexPath.row];
        _cell.detailTextLabel.text = _finalMArray[indexPath.row];
        
    }else if (indexPath.row == 1){
        
        _cell.textLabel.text = _projectNameMArray[indexPath.row];
        _cell.detailTextLabel.text = _finalMArray[indexPath.row];
        
    }
    
    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    _cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _cell.textLabel.numberOfLines = 0;
    _cell.detailTextLabel.numberOfLines = 0;
    
    return _cell;
    
}

@end
