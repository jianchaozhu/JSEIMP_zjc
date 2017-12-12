//
//  JSEIMPProjectShouXuNameController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/10/16.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPProjectShouXuNameController.h"
#import "JSEIMPZiZhiCheckShouXuController.h"
#import "JSEIMPFaBaoShouXuController.h"
#import "JSEIMPHeTongBeiAnShouXuController.h"
#import "JSEIMPZhiJianShouXuController.h"
#import "JSEIMPAnJianShouXuController.h"
#import "JSEIMPShiGongXuKeZhengBanLiController.h"

static NSString *cellID = @"cellID";

@interface JSEIMPProjectShouXuNameController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation JSEIMPProjectShouXuNameController{
    
    UITableView *_tableView;
    
    UITableViewCell *_cell;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = _projectName;
    
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
    
    [self.view addSubview:_tableView];

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return 10;
    }
    
    return 5;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    if (section == 1) {
        
        return 5;
    }else if (section == 3){
        
        return 10;
    }
    
    return 5;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return _shouXuListMArray.count;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
     
        JSEIMPZiZhiCheckShouXuController *ziZhiCheckShouXuController = [JSEIMPZiZhiCheckShouXuController new];
        
        ziZhiCheckShouXuController.titleName = _shouXuListMArray[indexPath.section];
        ziZhiCheckShouXuController.projectName = _projectName;
        
        [self.navigationController pushViewController:ziZhiCheckShouXuController animated:YES];
        
    }else if (indexPath.section == 1){
    
        JSEIMPFaBaoShouXuController *faBaoShouXuController = [JSEIMPFaBaoShouXuController new];
        
        faBaoShouXuController.titleName = _shouXuListMArray[indexPath.section];
        faBaoShouXuController.projectName = _projectName;
        
        [self.navigationController pushViewController:faBaoShouXuController animated:YES];
    
    }else if (indexPath.section == 2){
    
        JSEIMPHeTongBeiAnShouXuController *heTongBeiAnShouXuController = [JSEIMPHeTongBeiAnShouXuController new];
        
        heTongBeiAnShouXuController.titleName = _shouXuListMArray[indexPath.section];
        heTongBeiAnShouXuController.projectName = _projectName;
        
        [self.navigationController pushViewController:heTongBeiAnShouXuController animated:YES];
    
    }else if (indexPath.section == 3){
        
        JSEIMPZhiJianShouXuController *zhiJianShouXuController = [JSEIMPZhiJianShouXuController new];
        
        zhiJianShouXuController.titleName = _shouXuListMArray[indexPath.section];
        zhiJianShouXuController.projectName = _projectName;
        
        [self.navigationController pushViewController:zhiJianShouXuController animated:YES];
        
    }else if (indexPath.section == 4){
        
        JSEIMPAnJianShouXuController *anJianShouXuController = [JSEIMPAnJianShouXuController new];
        
        anJianShouXuController.titleName = _shouXuListMArray[indexPath.section];
        anJianShouXuController.projectName = _projectName;
        
        [self.navigationController pushViewController:anJianShouXuController animated:YES];
        
    }else if (indexPath.section == 5){
        
        JSEIMPShiGongXuKeZhengBanLiController *shiGongXuKeZhengBanLiController = [JSEIMPShiGongXuKeZhengBanLiController new];
        
        shiGongXuKeZhengBanLiController.titleName = _shouXuListMArray[indexPath.section];
        shiGongXuKeZhengBanLiController.projectName = _projectName;
        
        [self.navigationController pushViewController:shiGongXuKeZhengBanLiController animated:YES];
        
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView cellForRowAtIndexPath:indexPath];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }

    _cell.textLabel.text = _shouXuListMArray[indexPath.section];
    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return _cell;
    
}

@end
