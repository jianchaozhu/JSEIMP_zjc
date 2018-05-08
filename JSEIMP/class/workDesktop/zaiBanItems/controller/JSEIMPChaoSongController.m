//
//  JSEIMPChaoSongController.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/3/20.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPChaoSongController.h"
#import "JSEIMPNetWorking.h"
#import "JSEIMPAllGangWeiPersonController.h"
#import "JSEIMPBuMenInJiaShiGroupController.h"

static NSString *cellID = @"cellID";

@interface JSEIMPChaoSongController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *buMenNameMArray;

@end

@implementation JSEIMPChaoSongController{
    
    UITableView *_tableView;
    
    UITableViewCell *_cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"请选择目标处理人";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *stopButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(clickStopButton:)];
    
    self.navigationItem.rightBarButtonItem = stopButton;
    self.navigationItem.hidesBackButton = YES;
    
//    [self getData];
    
    [self setupUI];
}

-(void)clickStopButton:(UIButton *)button{
    
    [self.navigationController popViewControllerAnimated:YES];
}

//-(void)getData{
//    
//    [JSEIMPNetWorking getBuMenListWithShangJiBuMen:@"0" IsIncludeZiJieDian:@"false" SkipCount:0 MaxResultCount:10000 OnSuccess:^(NSMutableArray *buMenNameMArray,NSMutableArray *buMenInJiaShiGroupMArray){
//        
//        _buMenNameMArray = buMenNameMArray.copy;
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            
//            [_tableView reloadData];
//        });
//        
//    } onErrorInfo:nil];
//}

-(void)setupUI{
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    _tableView.tableFooterView = [[UIView alloc]init];
    
    [self.view addSubview:_tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
//    return 3;
    
//    return 2;
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
//    if (section == 0) {
//
//        return 1;
//    }else if (section == 1){
//
//        return 1;
//    }else if (section == 2){
//
//        return _buMenNameMArray.count;
//    }
    
//    if (section == 0) {
//
//        return 1;
//    }else if (section == 1){
//
//        return _buMenNameMArray.count;
//    }
    
    if (section == 0) {
        
        return 1;
    }
    return 0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        JSEIMPAllGangWeiPersonController *allGangWeiPersonController = [JSEIMPAllGangWeiPersonController new];
        
        allGangWeiPersonController.activityId = _activityId;
        allGangWeiPersonController.buttonText = _buttonText;
        allGangWeiPersonController.option = _option;
        
        [self.navigationController pushViewController:allGangWeiPersonController animated:YES];
    }
    
//    else if (indexPath.section == 1){
//
//        JSEIMPBuMenInJiaShiGroupController *buMenInJiaShiGroupController = [JSEIMPBuMenInJiaShiGroupController new];
//
//        buMenInJiaShiGroupController.vcTitle = _buMenNameMArray[indexPath.row];
//        buMenInJiaShiGroupController.buttonText = _buttonText;
//        buMenInJiaShiGroupController.activityId = _activityId;
//        buMenInJiaShiGroupController.option = _option;
//
//        [self.navigationController pushViewController:buMenInJiaShiGroupController animated:YES];
//    }
//    else if (indexPath.section == 1){
//
//        JSEIMPNoGangWeiPersonController *noGangWeiPersonController = [JSEIMPNoGangWeiPersonController new];
//
//        noGangWeiPersonController.activityId = _activityId;
//        noGangWeiPersonController.buttonText = _buttonText;
//        noGangWeiPersonController.option = _option;
//
//        [self.navigationController pushViewController:noGangWeiPersonController animated:YES];
//    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView cellForRowAtIndexPath:indexPath];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
//    if (indexPath.section == 0) {
//
//        _cell.textLabel.text = @"全部";
//    }else if (indexPath.section == 1){
//
//        _cell.textLabel.text = @"无岗位人员";
//    }else if (indexPath.section == 2){
//
//        _cell.textLabel.text = _buMenNameMArray[indexPath.row];
//    }
    
    if (indexPath.section == 0) {
        
        _cell.textLabel.text = @"全部";
    }
//    else if (indexPath.section == 1){
//        
//        _cell.textLabel.text = _buMenNameMArray[indexPath.row];
//    }
    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    _cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    return _cell;
    
}

@end
