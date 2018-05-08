
//
//  JSEIMPSureJiaQianPersonController.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/4/2.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPSureJiaQianPersonController.h"
#import "JSEIMPNetWorking.h"
#import "JSEIMPWorkDesktopController.h"

static NSString *cellID = @"cellID";

@interface JSEIMPSureJiaQianPersonController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *loginIdMArray;

@property(nonatomic,strong)NSMutableArray *roleIdMArray;

@property(nonatomic,strong)NSMutableArray *userIdMArray;

@property(nonatomic,strong)NSMutableArray *userNameMArray;

@property(nonatomic,strong)NSMutableArray *userStationIdMArray;

@property(nonatomic,strong)NSMutableArray *userUnitIdMArray;

@property(nonatomic,strong)NSMutableArray *targetUsersMArray;

@end

@implementation JSEIMPSureJiaQianPersonController{
    
    UITableView *_tableView;
    
    UITableViewCell *_cell;
}

- (NSMutableArray *)loginIdMArray{
    if (!_loginIdMArray) {
        _loginIdMArray = [NSMutableArray array];
    }
    return _loginIdMArray;
}

- (NSMutableArray *)roleIdMArray{
    if (!_roleIdMArray) {
        _roleIdMArray = [NSMutableArray array];
    }
    return _roleIdMArray;
}

- (NSMutableArray *)userIdMArray{
    if (!_userIdMArray) {
        _userIdMArray = [NSMutableArray array];
    }
    return _userIdMArray;
}

- (NSMutableArray *)userNameMArray{
    if (!_userNameMArray) {
        _userNameMArray = [NSMutableArray array];
    }
    return _userNameMArray;
}

- (NSMutableArray *)userStationIdMArray{
    if (!_userStationIdMArray) {
        _userStationIdMArray = [NSMutableArray array];
    }
    return _userStationIdMArray;
}

- (NSMutableArray *)userUnitIdMArray{
    if (!_userUnitIdMArray) {
        _userUnitIdMArray = [NSMutableArray array];
    }
    return _userUnitIdMArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"加签人员确认";
    
    UIBarButtonItem *stopButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(clickStopButton:)];
    UIBarButtonItem *jiaQianButton = [[UIBarButtonItem alloc] initWithTitle:@"加签" style:UIBarButtonItemStylePlain target:self action:@selector(clickJiaQianButton:)];
    
    NSArray *buttonArray = [NSArray arrayWithObjects:stopButton,jiaQianButton, nil];
    
    self.navigationItem.rightBarButtonItems = buttonArray;
    self.navigationItem.hidesBackButton = YES;
    
    [self getData];
    
    [self setupUI];
    
    NSLog(@"%@,%@",_selectUserIdMArray,_selectUserNameMArray);
}

-(void)clickJiaQianButton:(UIButton *)button{
    
    NSDictionary *targetUsersDict = [NSDictionary dictionary];
    NSMutableArray *targetUsersMArray = [NSMutableArray array];
    for (int i = 0; i < _loginIdMArray.count; i++) {
        
        targetUsersDict = @{@"userId":_userIdMArray[i],
                            @"loginId":_loginIdMArray[i],
                            @"userName":_userNameMArray[i],
                            @"userStationId":_userStationIdMArray[i],
                            @"userUnitId":_userUnitIdMArray[i],
                            @"roleId":_roleIdMArray[i]
                            };
        
        [targetUsersMArray addObject:targetUsersDict];
    }
    
    _targetUsersMArray = targetUsersMArray.copy;
    
    NSLog(@"%@",_targetUsersMArray);
    [JSEIMPNetWorking PostChaoSongStepWithActivityInstanceId:_activityId TargetUsers:_targetUsersMArray OnSuccess:^{
        
        for(UIViewController *controller in self.navigationController.viewControllers) {
            
            if([controller isKindOfClass:[JSEIMPWorkDesktopController class]]) {
                
                [self.navigationController popToViewController:controller animated:YES];
            }
        }
    } onErrorInfo:nil];
}

-(void)clickStopButton:(UIButton *)button{
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)getData{
    
    for (int i = 0; i < _selectUserIdMArray.count; i++) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [JSEIMPNetWorking getUserInfoWithUserId:_selectUserIdMArray[i] OnSuccess:^(NSString * loginId,NSString *roleId,NSString *userId,NSString *userName,NSString *userStationId,NSString *userUnitId){
                
                [self.loginIdMArray addObject:loginId];
                if (roleId == nil) {
                    
                    roleId = @"";
                }if (userStationId == nil) {
                    
                    userStationId = @"";
                }if (userUnitId == nil) {
                    
                    userUnitId = @"";
                }
                [self.roleIdMArray addObject:roleId];
                [self.userIdMArray addObject:userId];
                [self.userNameMArray addObject:userName];
                [self.userStationIdMArray addObject:userStationId];
                [self.userUnitIdMArray addObject:userUnitId];
            } onErrorInfo:nil];
        });
    }
}

-(void)setupUI{
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    _tableView.tableFooterView = [[UIView alloc]init];
    _tableView.allowsSelection = NO;
    
    [self.view addSubview:_tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.selectUserNameMArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView cellForRowAtIndexPath:indexPath];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    _cell.textLabel.text = self.selectUserNameMArray[indexPath.row];
    _cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    return _cell;
    
}

@end
