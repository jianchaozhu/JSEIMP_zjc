//
//  JSEIMPHeTongGuanLiController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/11/2.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPHeTongGuanLiController.h"
#import "JSEIMPChengBaoHeTongController.h"
#import "JSEIMPFenBaoHeTongController.h"
#import "JSEIMPCaiGouHeTongController.h"
#import "JSEIMPLaoWuFenBaoHeTongController.h"

static NSString *cellID = @"cellID";

@interface JSEIMPHeTongGuanLiController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation JSEIMPHeTongGuanLiController{
    
    UITableView *_tableView;
    
    UITableViewCell *_cell;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"合同管理";
    
    [self setupUI];
    
}

-(void)setupUI{
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    _tableView.tableFooterView = [[UIView alloc]init];
    
    [self.view addSubview:_tableView];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return 10;
    }
    
    return 5;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return 10;
    }
    
    return 5;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
    
//    return 8;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        JSEIMPChengBaoHeTongController *chengBaoHeTongController = [JSEIMPChengBaoHeTongController new];
        
        [self.navigationController pushViewController:chengBaoHeTongController animated:YES];
        
    }else if (indexPath.row == 1){
        
        JSEIMPFenBaoHeTongController *fenBaoHeTongController = [JSEIMPFenBaoHeTongController new];
        
        [self.navigationController pushViewController:fenBaoHeTongController animated:YES];
    }else if (indexPath.row == 2){
        
        JSEIMPCaiGouHeTongController *caiGouHeTongController = [JSEIMPCaiGouHeTongController new];
        
        [self.navigationController pushViewController:caiGouHeTongController animated:YES];
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    
    if (indexPath.row == 0) {
        
        [self setImageViewWithName:@"chengBaoHeTong" Text:@"承包合同"];
    }else if (indexPath.row == 1){
        
        [self setImageViewWithName:@"fenBaoHeTong" Text:@"专业分包合同"];
    }else if (indexPath.row == 2){
        
        [self setImageViewWithName:@"caiGouHeTong" Text:@"采购合同"];
    }
    
//    if (indexPath.section == 0) {
//        
//        if (indexPath.row == 0) {
//            
//            [self setImageViewWithName:@"chengBaoHeTong" Text:@"承包合同"];
//        }else if (indexPath.row == 1){
//            
//            [self setImageViewWithName:@"fenBaoHeTong" Text:@"分包合同"];
//            _cell.textLabel.textColor = [UIColor redColor];
//        }else if (indexPath.row == 2){
//            
//            [self setImageViewWithName:@"caiGouHeTong" Text:@"采购合同"];
//            _cell.textLabel.textColor = [UIColor redColor];
//        }else if (indexPath.row == 3){
//            
//            [self setImageViewWithName:@"laoWuFenBaoGeTong" Text:@"劳务分包合同"];
//            _cell.textLabel.textColor = [UIColor redColor];
//        }else if (indexPath.row == 4){
//            
//            [self setImageViewWithName:@"sheBeiZuLinHeTong" Text:@"设备租赁合同"];
//            _cell.textLabel.textColor = [UIColor redColor];
//        }else if (indexPath.row == 5){
//            
//            [self setImageViewWithName:@"otherShouRuHeTong" Text:@"其他收入合同"];
//            _cell.textLabel.textColor = [UIColor redColor];
//        }else if (indexPath.row == 6){
//            
//            [self setImageViewWithName:@"otherZhiChuHeTong" Text:@"其他支出合同"];
//            _cell.textLabel.textColor = [UIColor redColor];
//        }else if (indexPath.row == 7){
//            
//            [self setImageViewWithName:@"heTongStyle" Text:@"合同类型"];
//            _cell.textLabel.textColor = [UIColor redColor];
//        }
//        
//    }
    
    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return _cell;
    
}

-(void)setImageViewWithName:(NSString *)name Text:(NSString *)text{
    
    _cell.imageView.image = [UIImage imageNamed:name];
    _cell.textLabel.text = text;
    
}

@end
