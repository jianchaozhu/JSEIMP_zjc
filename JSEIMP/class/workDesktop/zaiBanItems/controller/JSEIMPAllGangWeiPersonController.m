//
//  JSEIMPAllGangWeiPersonController.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/3/20.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPAllGangWeiPersonController.h"
#import "JSEIMPNetWorking.h"
#import "JSEIMPSureChaoSongPersonController.h"
#import "JSEIMPSureZhuanQianPersonController.h"
#import "JSEIMPSureJiaQianPersonController.h"
#import "JSEIMPBuMenInJiaShiGroupController.h"

static NSString *cellID = @"cellID";

@interface JSEIMPAllGangWeiPersonController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *buMenNameMArray;

@property(nonatomic,strong)NSMutableArray *userNameMArray;

@property(nonatomic,strong)NSMutableArray *userIdMArray;

@property (nonatomic,strong)NSMutableArray *selectUserNameMArray;//存放选中数据的userName

@property(nonatomic,strong)NSMutableArray *selectUserIdMArray;//存放选中数据的userId

@end

@implementation JSEIMPAllGangWeiPersonController{
    
    UITableView *_tableView;
    
    UITableViewCell *_cell;
    
    UIBarButtonItem *_editButton;
}

- (NSMutableArray *)selectUserNameMArray{
    if (!_selectUserNameMArray) {
        _selectUserNameMArray = [NSMutableArray array];
    }
    return _selectUserNameMArray;
}

- (NSMutableArray *)selectUserIdMArray{
    if (!_selectUserIdMArray) {
        _selectUserIdMArray = [NSMutableArray array];
    }
    return _selectUserIdMArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"全部人员选择";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
    _editButton = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(clickEditButton:)];
    self.navigationItem.rightBarButtonItem = _editButton;
    
    [self getBuMenData];
    
    [self setupUI];
}

-(void)clickEditButton:(UIButton *)button{
    
    if (_tableView.editing) {
        
        _editButton.title = @"编辑";
        
        NSLog(@"%@",_option);
        if (self.selectUserNameMArray.count > 0 && [_buttonText isEqualToString:@"抄送"]) {
            
            [self goToSureChaoSongPersonVC];
        }else if (self.selectUserNameMArray.count > 0 && [_buttonText isEqualToString:@"转签"]){
            
            [self goToSureZhuanQianPersonVC];
        }else if (self.selectUserNameMArray.count > 0 && [_buttonText isEqualToString:@"加签"]){
            
            [self goToSureJiaQianPersonVC];
        }
    } else {
        
        _editButton.title = @"确定";
        //移除之前选中的内容
        if (self.selectUserNameMArray.count > 0) {
            [self.selectUserNameMArray removeAllObjects];
            [self.selectUserIdMArray removeAllObjects];
        }
    }
    [_tableView setEditing:!_tableView.editing animated:YES];
}

-(void)goToSureZhuanQianPersonVC{
    
    JSEIMPSureZhuanQianPersonController *sureZhuanQianPersonController = [JSEIMPSureZhuanQianPersonController new];
    
    sureZhuanQianPersonController.selectUserNameMArray = self.selectUserNameMArray;
    sureZhuanQianPersonController.selectUserIdMArray = self.selectUserIdMArray;
    sureZhuanQianPersonController.activityId = _activityId;
    sureZhuanQianPersonController.option = _option;
    
    [self.navigationController pushViewController:sureZhuanQianPersonController animated:YES];
}

-(void)goToSureChaoSongPersonVC{
    
    JSEIMPSureChaoSongPersonController *sureChaoSongPersonController = [JSEIMPSureChaoSongPersonController new];
    
    sureChaoSongPersonController.selectUserNameMArray = self.selectUserNameMArray;
    sureChaoSongPersonController.selectUserIdMArray = self.selectUserIdMArray;
    sureChaoSongPersonController.activityId = _activityId;
    
    [self.navigationController pushViewController:sureChaoSongPersonController animated:YES];
}

-(void)goToSureJiaQianPersonVC{
    
    JSEIMPSureJiaQianPersonController *sureJiaQianPersonController = [JSEIMPSureJiaQianPersonController new];
    
    sureJiaQianPersonController.selectUserNameMArray = self.selectUserNameMArray;
    sureJiaQianPersonController.selectUserIdMArray = self.selectUserIdMArray;
    sureJiaQianPersonController.activityId = _activityId;
    
    [self.navigationController pushViewController:sureJiaQianPersonController animated:YES];
}

- (void)returnAction {
    
    //移除之前选中的内容
    if (self.selectUserNameMArray.count > 0) {
        [self.selectUserNameMArray removeAllObjects];
        [self.selectUserIdMArray removeAllObjects];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)getBuMenData{
    
    [JSEIMPNetWorking getBuMenListWithShangJiBuMen:@"0" IsIncludeZiJieDian:@"false" SkipCount:0 MaxResultCount:10000 OnSuccess:^(NSMutableArray *buMenNameMArray,NSMutableArray *buMenInJiaShiGroupMArray){
        
        _buMenNameMArray = buMenNameMArray.copy;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self getUserData];
        });
        
    } onErrorInfo:nil];
}

-(void)getUserData{
    
//    [JSEIMPNetWorking getUserListWithSkipCount:0 MaxResultCount:10000 OnSuccess:^(NSMutableArray *userNameMArray,NSMutableArray *userIdMArray){
//
//        _userNameMArray = userNameMArray.copy;
//        _userIdMArray = userIdMArray.copy;
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//
//            [_tableView reloadData];
//        });
//
//    } onErrorInfo:nil];
    
    [JSEIMPNetWorking getUserListWithStationIdIfNull:@"false" SkipCount:0 MaxResultCount:10000 OnSuccess:^(NSMutableArray *userNameMArray,NSMutableArray *userIdMArray){
        
        _userNameMArray = userNameMArray.copy;
        _userIdMArray = userIdMArray.copy;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [_tableView reloadData];
        });
    } onErrorInfo:nil];
}

-(void)setupUI{
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.allowsMultipleSelectionDuringEditing = YES;
    _tableView.allowsSelectionDuringEditing = YES;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    _tableView.tableFooterView = [[UIView alloc]init];
    _tableView.allowsSelection = YES;
    
    [self.view addSubview:_tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return _buMenNameMArray.count;
    }else if (section == 1){
        
        NSLog(@"%zd",_userNameMArray.count);
        return _userNameMArray.count;
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //选中数据
    if (indexPath.section == 0) {
        
        JSEIMPBuMenInJiaShiGroupController *buMenInJiaShiGroupController = [JSEIMPBuMenInJiaShiGroupController new];
        
        buMenInJiaShiGroupController.vcTitle = _buMenNameMArray[indexPath.row];
        buMenInJiaShiGroupController.buttonText = _buttonText;
        buMenInJiaShiGroupController.activityId = _activityId;
        buMenInJiaShiGroupController.option = _option;
        buMenInJiaShiGroupController.selectUserNameMArray = self.selectUserNameMArray;
        buMenInJiaShiGroupController.selectUserIdMArray = self.selectUserIdMArray;
        
        [self.navigationController pushViewController:buMenInJiaShiGroupController animated:YES];

    }else if (indexPath.section == 1){
        
        [self.selectUserNameMArray addObject:_userNameMArray[indexPath.row]];
        [self.selectUserIdMArray addObject:_userIdMArray[indexPath.row]];
        
        NSLog(@"%@",_selectUserNameMArray);
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    //从选中中取消
    if (self.selectUserNameMArray.count > 0) {
        
        [self.selectUserNameMArray removeObject:_userNameMArray[indexPath.row]];
        [self.selectUserIdMArray removeObject:_userIdMArray[indexPath.row]];
    }
    
    NSLog(@"%@",_selectUserNameMArray);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView cellForRowAtIndexPath:indexPath];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    if (indexPath.section == 0) {
        
        _cell.textLabel.text = _buMenNameMArray[indexPath.row];
        _cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _cell.selectionStyle = UITableViewCellSelectionStyleNone;
        _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else if (indexPath.section == 1){
        
        _cell.textLabel.text = _userNameMArray[indexPath.row];
        _cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
//        _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return _cell;
    
}

@end
