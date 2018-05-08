//
//  JSEIMPBuMenInJiaShiGroupController.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/3/28.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPBuMenInJiaShiGroupController.h"
#import "JSEIMPNetWorking.h"
#import "JSEIMPBuMenInGroupManageBuMenController.h"
#import "JSEIMPBuMenInJiaShiBuildController.h"
#import "JSEIMPBuMenInJSFCZYController.h"
#import "JSEIMPBuMenInJiaShiLvYeController.h"

static NSString *cellID = @"cellID";

@interface JSEIMPBuMenInJiaShiGroupController ()<UITableViewDelegate,UITableViewDataSource>
//嘉实集团下面的子集
@property(nonatomic,strong)NSMutableArray *buMenInJiaShiGroupMArray;

@end

@implementation JSEIMPBuMenInJiaShiGroupController{
    
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
    
    [JSEIMPNetWorking getBuMenListWithShangJiBuMen:@"001" IsIncludeZiJieDian:@"true" SkipCount:0 MaxResultCount:10000 OnSuccess:^(NSMutableArray *buMenNameMArray,NSMutableArray *buMenInJiaShiGroupMArray){
        
        _buMenInJiaShiGroupMArray = buMenInJiaShiGroupMArray.copy;
        
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
    
    return _buMenInJiaShiGroupMArray.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        JSEIMPBuMenInGroupManageBuMenController *buMenInGroupManageBuMenController = [JSEIMPBuMenInGroupManageBuMenController new];
        
        buMenInGroupManageBuMenController.vcTitle = _buMenInJiaShiGroupMArray[indexPath.row];
        buMenInGroupManageBuMenController.buttonText = _buttonText;
        buMenInGroupManageBuMenController.activityId = _activityId;
        buMenInGroupManageBuMenController.option = _option;
        buMenInGroupManageBuMenController.selectUserNameFromVCMArray = _selectUserNameMArray;
        buMenInGroupManageBuMenController.selectUserIdFromVCMArray = _selectUserIdMArray;
        
        [self.navigationController pushViewController:buMenInGroupManageBuMenController animated:YES];
    }else if (indexPath.row == 1){
        
        JSEIMPBuMenInJiaShiBuildController *buMenInJiaShiBuildController = [JSEIMPBuMenInJiaShiBuildController new];
        
        buMenInJiaShiBuildController.vcTitle = _buMenInJiaShiGroupMArray[indexPath.row];
        
        [self.navigationController pushViewController:buMenInJiaShiBuildController animated:YES];
    }else if (indexPath.row == 2){
        
        JSEIMPBuMenInJSFCZYController *buMenInJSFCZYController = [JSEIMPBuMenInJSFCZYController new];
        
        buMenInJSFCZYController.vcTitle = _buMenInJiaShiGroupMArray[indexPath.row];
        
        [self.navigationController pushViewController:buMenInJSFCZYController animated:YES];
    }else if (indexPath.row == 3){
        
        JSEIMPBuMenInJiaShiLvYeController *buMenInJiaShiLvYeController = [JSEIMPBuMenInJiaShiLvYeController new];
        
        buMenInJiaShiLvYeController.vcTitle = _buMenInJiaShiGroupMArray[indexPath.row];
        
        [self.navigationController pushViewController:buMenInJiaShiLvYeController animated:YES];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView cellForRowAtIndexPath:indexPath];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }

    if ([_buMenInJiaShiGroupMArray[indexPath.row] isEqualToString:@"集团管理部门"] || [_buMenInJiaShiGroupMArray[indexPath.row] isEqualToString:@"嘉实建设"] || [_buMenInJiaShiGroupMArray[indexPath.row] isEqualToString:@"嘉实房产置业"] || [_buMenInJiaShiGroupMArray[indexPath.row] isEqualToString:@"嘉实旅业"]) {
        
        _cell.textLabel.text = _buMenInJiaShiGroupMArray[indexPath.row];
        _cell.selectionStyle = UITableViewCellSelectionStyleNone;
        _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        _cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    }else{
        
        _cell.textLabel.text = _buMenInJiaShiGroupMArray[indexPath.row];
        _cell.selectionStyle = UITableViewCellSelectionStyleNone;
        _cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    }
    
    return _cell;
    
}

@end
