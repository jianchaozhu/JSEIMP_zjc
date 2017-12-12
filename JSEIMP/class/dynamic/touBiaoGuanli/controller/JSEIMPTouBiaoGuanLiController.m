
//
//  JSEIMPTouBiaoGuanLiController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/9/30.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPTouBiaoGuanLiController.h"
#import "JSBeforeTouBiaoController.h"
#import "JSEIMPTouBiaoBaoZhengJinController.h"
#import "JSFarmerBaoZhengJinController.h"
#import "JSEIMPLvYueBaoZhengJinController.h"
#import "JSEIMPBiaoShuInfoController.h"
#import "JSEIMPProjectShouXuDealController.h"
#import "JSEIMPStaffBeiAnController.h"
#import "JSEIMPPorjectJiangXiangController.h"
#import "JSEIMPBiaoHouAnalyzeController.h"
#import "JSEIMPBaoBiaoController.h"

static NSString *cellID = @"cellID";

@interface JSEIMPTouBiaoGuanLiController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation JSEIMPTouBiaoGuanLiController{
    
    UITableView *_tableView;
    
    UITableViewCell *_cell;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"投标管理";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
    
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
    
    if (section == 0) {
        
        return 10;
    }
    
    return 5;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        JSBeforeTouBiaoController *beforeTouBiaoController = [JSBeforeTouBiaoController new];
        
        [self.navigationController pushViewController:beforeTouBiaoController animated:YES];
    }else if (indexPath.row == 1){
    
        JSEIMPTouBiaoBaoZhengJinController *touBiaoBaoZhengJinController = [JSEIMPTouBiaoBaoZhengJinController new];
        
        [self.navigationController pushViewController:touBiaoBaoZhengJinController animated:YES];
    }else if (indexPath.row == 2){
        
        JSFarmerBaoZhengJinController *farmerBaoZhengJinController = [JSFarmerBaoZhengJinController new];
        
        [self.navigationController pushViewController:farmerBaoZhengJinController animated:YES];
    }else if (indexPath.row == 3){
    
        JSEIMPPorjectJiangXiangController *porjectJiangXiangController = [JSEIMPPorjectJiangXiangController new];
        
        [self.navigationController pushViewController:porjectJiangXiangController animated:YES];

    }
    
//    if (indexPath.row == 0) {
//        
//        JSBeforeTouBiaoController *beforeTouBiaoController = [JSBeforeTouBiaoController new];
//        
//        [self.navigationController pushViewController:beforeTouBiaoController animated:YES];
//
//    }else if (indexPath.row == 1){
//    
//        JSEIMPTouBiaoBaoZhengJinController *touBiaoBaoZhengJinController = [JSEIMPTouBiaoBaoZhengJinController new];
//        
//        [self.navigationController pushViewController:touBiaoBaoZhengJinController animated:YES];
//
//    }else if (indexPath.row == 2){
//    
//        JSFarmerBaoZhengJinController *farmerBaoZhengJinController = [JSFarmerBaoZhengJinController new];
//        
//        [self.navigationController pushViewController:farmerBaoZhengJinController animated:YES];
//
//    }else if (indexPath.row == 3){
//    
//        JSEIMPLvYueBaoZhengJinController *lvYueBaoZhengJinController = [JSEIMPLvYueBaoZhengJinController new];
//        
//        [self.navigationController pushViewController:lvYueBaoZhengJinController animated:YES];
//    
//    }else if (indexPath.row == 4){
//    
//        JSEIMPBiaoShuInfoController *biaoShuInfoController = [JSEIMPBiaoShuInfoController new];
//        
//        [self.navigationController pushViewController:biaoShuInfoController animated:YES];
//    
//    }else if (indexPath.row == 5){
//    
//        JSEIMPProjectShouXuDealController *projectShouXuDealController = [JSEIMPProjectShouXuDealController new];
//        
//        [self.navigationController pushViewController:projectShouXuDealController animated:YES];
//    
//    }else if (indexPath.row == 6){
//    
//        JSEIMPStaffBeiAnController *staffBeiAnController = [JSEIMPStaffBeiAnController new];
//        
//        [self.navigationController pushViewController:staffBeiAnController animated:YES];
//
//    }else if (indexPath.row == 7){
//        
//        JSEIMPPorjectJiangXiangController *porjectJiangXiangController = [JSEIMPPorjectJiangXiangController new];
//        
//        [self.navigationController pushViewController:porjectJiangXiangController animated:YES];
//
//    }else if (indexPath.row == 8){
//    
//        JSEIMPBiaoHouAnalyzeController *biaoHouAnalyzeController = [JSEIMPBiaoHouAnalyzeController new];
//        
//        [self.navigationController pushViewController:biaoHouAnalyzeController animated:YES];
//    
//    }else if (indexPath.row == 9){
//    
//        JSEIMPBaoBiaoController *_baoBiaoController = [JSEIMPBaoBiaoController new];
//        
//        [self.navigationController pushViewController:_baoBiaoController animated:YES];
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
            
            [self setImageViewWithName:@"beforeTouBiao" Text:@"投标项目"];
        }else if (indexPath.row == 1){
        
            [self setImageViewWithName:@"touBiaoBaoZhengJin" Text:@"投标保证金"];
        }else if (indexPath.row == 2){
            
            [self setImageViewWithName:@"famerMoney" Text:@"农民工保证金"];
        }else if (indexPath.row == 3){
        
            [self setImageViewWithName:@"projectJiangXiang" Text:@"项目奖项"];
        }
    }
    
//    if (indexPath.section == 0) {
//        
//        if (indexPath.row == 0) {
//            
//            [self setImageViewWithName:@"beforeTouBiao" Text:@"投标项目"];
//        }else if (indexPath.row == 1){
//            
//            [self setImageViewWithName:@"touBiaoBaoZhengJin" Text:@"投标保证金"];
//        }else if (indexPath.row == 2){
//            
//            [self setImageViewWithName:@"famerMoney" Text:@"农民工保证金"];
//        }else if (indexPath.row == 3){
//            
//            [self setImageViewWithName:@"lvYueMoney" Text:@"履约保证金"];
//        }else if (indexPath.row == 4){
//            
//            [self setImageViewWithName:@"biaoShuInfo" Text:@"标书信息"];
//        }else if (indexPath.row == 5){
//        
//            [self setImageViewWithName:@"projectBanLiShouXu" Text:@"项目手续办理"];
//        }else if (indexPath.row == 6){
//            
//            [self setImageViewWithName:@"staffBeiAn" Text:@"人员备案情况"];
//        }else if (indexPath.row == 7){
//            
//            [self setImageViewWithName:@"projectJiangXiang" Text:@"项目奖项"];
//        }else if (indexPath.row == 8){
//            
//            [self setImageViewWithName:@"biaoHaoFenXi" Text:@"标后分析"];
//        }else if (indexPath.row == 9){
//            
//            [self setImageViewWithName:@"baoBiao" Text:@"报表"];
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
