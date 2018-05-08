//
//  JSEIMPChengBaoHeTongController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/12/5.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPChengBaoHeTongController.h"
#import "JSEIMPAllChengBaoHeTongController.h"
#import "JSEIMPZhuanYeChengBaoHeTongController.h"

static NSString *cellID = @"cellID";

@interface JSEIMPChengBaoHeTongController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation JSEIMPChengBaoHeTongController{
    
    UITableView *_tableView;
    
    UITableViewCell *_cell;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"承包合同";
    
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
    
    return 2;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        JSEIMPAllChengBaoHeTongController *allChengBaoHeTongController = [JSEIMPAllChengBaoHeTongController new];
        
        [self.navigationController pushViewController:allChengBaoHeTongController animated:YES];
    }else if (indexPath.row == 1){
        
        JSEIMPZhuanYeChengBaoHeTongController *zhuanYeChengBaoHeTongController = [JSEIMPZhuanYeChengBaoHeTongController new];
        
        [self.navigationController pushViewController:zhuanYeChengBaoHeTongController animated:YES];
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    
    if (indexPath.row == 0) {
        
        [self setImageViewWithName:@"allChengBaoHeTong" Text:@"施工总承包合同"];
    }else if (indexPath.row == 1){
        
        [self setImageViewWithName:@"zhuanYeChengBaoHeTong" Text:@"专业承包合同"];
    }
    
    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return _cell;
    
}

-(void)setImageViewWithName:(NSString *)name Text:(NSString *)text{
    
    _cell.imageView.image = [UIImage imageNamed:name];
    _cell.textLabel.text = text;
    
}

@end
