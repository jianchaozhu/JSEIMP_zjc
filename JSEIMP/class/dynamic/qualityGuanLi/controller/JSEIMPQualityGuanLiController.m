//
//  JSEIMPQualityGuanLiController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/11/20.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPQualityGuanLiController.h"
#import "JSEIMPQualityTargetController.h"
#import "JSEIMPQualityCheckController.h"
#import "JSEIMPProjectListController.h"

static NSString *cellID = @"cellID";

@interface JSEIMPQualityGuanLiController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation JSEIMPQualityGuanLiController{
    
    UITableView *_tableView;
    
    UITableViewCell *_cell;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"质量管理";
    
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
//    return 4;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        JSEIMPProjectListController *projectListController = [JSEIMPProjectListController new];
        
        [self.navigationController pushViewController:projectListController animated:YES];
        
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            
            [self setImageViewWithName:@"qualityChangeNote" Text:@"质量检查整改单" TextColor:[UIColor darkTextColor]];
        }
//        else if (indexPath.row == 1){
        
//        [self setImageViewWithName:@"qualityTarget" Text:@"质量目标" TextColor:[UIColor darkTextColor]];

//        }else if (indexPath.row == 2){
//            
//            [self setImageViewWithName:@"shiGuBaoGaoDan" Text:@"质量事故报告单" TextColor:[UIColor darkTextColor]];
//        }else if (indexPath.row == 3){
//            
//            [self setImageViewWithName:@"faKuanDan" Text:@"质量缺陷罚款单" TextColor:[UIColor redColor]];
//        }
        
    }
    
    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return _cell;
    
}

-(void)setImageViewWithName:(NSString *)name Text:(NSString *)text TextColor:(UIColor *)textColor{
    
    _cell.textLabel.textColor = textColor;
    _cell.imageView.image = [UIImage imageNamed:name];
    _cell.textLabel.text = text;
    
}

@end
