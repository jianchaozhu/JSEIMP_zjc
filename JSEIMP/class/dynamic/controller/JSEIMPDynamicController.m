//
//  JSEIMPDynamicController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/9/5.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPDynamicController.h"
#import "JSEIMPTouBiaoGuanLiController.h"
#import "JSEIMPHeTongGuanLiController.h"
#import "JSEIMPQualityGuanLiController.h"
#import <SVProgressHUD.h>

static NSString *cellID = @"cellID";

@interface JSEIMPDynamicController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation JSEIMPDynamicController{

    UITableView *_tableView;
    
    UITableViewCell *_cell;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"动态";
    
    [self setupUI];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        [NSThread sleepForTimeInterval:0.5];
        
        [SVProgressHUD dismiss];
        
    });
    
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
    
//    return 4;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

//    if (section == 0) {
//        
//        return 2;
//    }else if (section == 1){
//    
//        return 4;
//    }else if (section == 2){
//    
//        return 4;
//    }else if (section == 3){
//    
//        return 2;
//    }
    
    if (section == 0) {
        
        return 2;
    }

    return 0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            
            JSEIMPTouBiaoGuanLiController *touBiaoGuanLiController = [JSEIMPTouBiaoGuanLiController new];
            
            [self.navigationController pushViewController:touBiaoGuanLiController animated:YES];
        }else if (indexPath.row == 1){
        
            JSEIMPHeTongGuanLiController *heTongGuanLiController = [JSEIMPHeTongGuanLiController new];
            
            [self.navigationController pushViewController:heTongGuanLiController animated:YES];
        }
    }
    
//    if (indexPath.section == 1) {
//        
//        if (indexPath.row == 0) {
//            
//            JSEIMPTouBiaoGuanLiController *touBiaoGuanLiController = [JSEIMPTouBiaoGuanLiController new];
//            
//            [self.navigationController pushViewController:touBiaoGuanLiController animated:YES];
//
//        }else if (indexPath.row == 2){
//        
//            JSEIMPHeTongGuanLiController *heTongGuanLiController = [JSEIMPHeTongGuanLiController new];
//            
//            [self.navigationController pushViewController:heTongGuanLiController animated:YES];
//
//        }
//        
//    }else if (indexPath.section == 2){
//    
//        if (indexPath.row == 0) {
//            
//            JSEIMPQualityGuanLiController *qualityGuanLiController = [JSEIMPQualityGuanLiController new];
//            
//            [self.navigationController pushViewController:qualityGuanLiController animated:YES];
//        }
//    
//    }

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    _cell= [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }

    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            
            [self setImageViewWithName:@"touBiao" Text:@"投标管理" TextColor:[UIColor darkTextColor]];
        }else if (indexPath.row == 1){
        
            [self setImageViewWithName:@"heTong" Text:@"合同管理" TextColor:[UIColor darkTextColor]];
        }
    }
    
//    if (indexPath.section == 0) {
//        
//        if (indexPath.row == 0) {
//            
//            [self setImageViewWithName:@"icon_main_news" Text:@"新闻" TextColor:[UIColor redColor]];
//        }else if (indexPath.row == 1){
//        
//            [self setImageViewWithName:@"icon_main_notice" Text:@"公告" TextColor:[UIColor redColor]];
//        }
//        
//    }else if (indexPath.section == 1){
//    
//        if (indexPath.row == 0) {
//            
//            [self setImageViewWithName:@"touBiao" Text:@"投标管理" TextColor:[UIColor darkTextColor]];
//        }else if (indexPath.row == 1){
//        
//            [self setImageViewWithName:@"zhaoBiao" Text:@"招标管理" TextColor:[UIColor redColor]];
//        }else if (indexPath.row == 2){
//        
//            [self setImageViewWithName:@"heTong" Text:@"合同管理" TextColor:[UIColor darkTextColor]];
//        }else if (indexPath.row == 3){
//        
//            [self setImageViewWithName:@"ziJin" Text:@"资金管理" TextColor:[UIColor redColor]];
//        }
//    
//    }else if (indexPath.section == 2){
//    
//        if (indexPath.row == 0) {
//            
//            [self setImageViewWithName:@"quailty" Text:@"质量管理" TextColor:[UIColor darkTextColor]];
//        }else if (indexPath.row == 1){
//        
//            [self setImageViewWithName:@"security" Text:@"安全管理" TextColor:[UIColor redColor]];
//        }else if (indexPath.row == 2){
//        
//            [self setImageViewWithName:@"xianChang" Text:@"现场管理" TextColor:[UIColor redColor]];
//        }else if (indexPath.row == 3){
//        
//            [self setImageViewWithName:@"greenWork" Text:@"绿色施工" TextColor:[UIColor redColor]];
//        }
//    
//    }else if (indexPath.section == 3){
//    
//        if (indexPath.row == 0) {
//            
//            [self setImageViewWithName:@"worker" Text:@"技工管理" TextColor:[UIColor redColor]];
//        }else if (indexPath.row == 1){
//        
//            [self setImageViewWithName:@"jiShu" Text:@"技术管理" TextColor:[UIColor redColor]];
//        }
//    
//    }
    
    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return _cell;

}

-(void)setImageViewWithName:(NSString *)name Text:(NSString *)text TextColor:(UIColor *)textColor{
    
    _cell.imageView.image = [UIImage imageNamed:name];
    _cell.textLabel.text = text;
    _cell.textLabel.textColor = textColor;
    
}

@end
