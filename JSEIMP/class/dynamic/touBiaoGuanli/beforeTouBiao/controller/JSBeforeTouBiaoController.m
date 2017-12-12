//
//  JSBeforeTouBiaoController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/9/22.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSBeforeTouBiaoController.h"
#import "JSEIMPTouBiaoController.h"
#import "JSProjectCheckController.h"
#import "JSEIMPXianChangCheckController.h"
#import "JSEIMPTouBiaoZhaiYaoController.h"
#import "JSEIMPProjectStaffStoreController.h"

static NSString *cellID = @"cellID";

@interface JSBeforeTouBiaoController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation JSBeforeTouBiaoController{

    UITableView *_tableView;
    
    UITableViewCell *_cell;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"投标项目";
    
    [self setupUI];
    
}

-(void)setupUI{
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    [self.view addSubview:_tableView];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;

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

//    if (section == 0) {
//        
//        return 1;
//    }else if (section == 1){
//    
//        return 4;
//    
//    }

    if (section == 0) {
        
        return 1;
    }
    
    return 0;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        
        JSEIMPTouBiaoController *touBiaoController = [JSEIMPTouBiaoController new];
        
        [self.navigationController pushViewController:touBiaoController animated:YES];
        
    }
//    else if (indexPath.section == 1){
//    
//        
//        if (indexPath.row == 0) {
//            
//            JSProjectCheckController *projectCheckController = [JSProjectCheckController new];
//            
//            [self.navigationController pushViewController:projectCheckController animated:YES];
//        }else if (indexPath.row == 1){
//    
//        JSEIMPXianChangCheckController *xianChangCheckController = [JSEIMPXianChangCheckController new];
//        
//        [self.navigationController pushViewController:xianChangCheckController animated:YES];
//    
//       }else if (indexPath.row == 2){
//    
//        JSEIMPTouBiaoZhaiYaoController *touBiaoZhaiYaoController = [JSEIMPTouBiaoZhaiYaoController new];
//    
//        [self.navigationController pushViewController:touBiaoZhaiYaoController animated:YES];
//
//       }else if (indexPath.row == 3){
//    
//        JSEIMPProjectStaffStoreController *projectStaffStoreController = [JSEIMPProjectStaffStoreController new];
//        
//        [self.navigationController pushViewController:projectStaffStoreController animated:YES];
//    
//       }
//    }

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    
    if (indexPath.section == 0) {
            
        [self setImageViewWithName:@"projectInformation" Text:@"项目信息"];
    }
//    else if (indexPath.section == 1){
//        
//        if (indexPath.row == 0) {
//            
//            [self setImageViewWithName:@"projectCheck" Text:@"工程考察"];
//        }else if (indexPath.row == 1){
//        
//            [self setImageViewWithName:@"xianChangTaKan" Text:@"现场踏勘"];
//        }else if (indexPath.row == 2){
//        
//            [self setImageViewWithName:@"touBiaoWenJian" Text:@"投标文件摘要"];
//        }else if (indexPath.row == 3){
//        
//            [self setImageViewWithName:@"projectPeople" Text:@"项目人员备案库"];
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
