//
//  JSEIMPMineController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/9/5.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPMineController.h"
#import "JSEIMPMineCell.h"

static NSString *cellID = @"cellID";
static NSString *cellID1 = @"cellID1";

@interface JSEIMPMineController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation JSEIMPMineController{
    
    UITableView *_tableView;
    
    JSEIMPMineCell *_cell;
    
    UITableViewCell *_cell1;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"我的";
    
    [self setupUI];
    
}

-(void)setupUI{

    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.estimatedRowHeight = 50;
    [_tableView registerNib:[UINib nibWithNibName:@"JSEIMPMineCell" bundle:nil] forCellReuseIdentifier:cellID];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID1];
    
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
        
        return 10;
    }
    
    return 5;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 1;
        
    }
    
    return 4;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        _cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
        _cell.selectionStyle = UITableViewCellSelectionStyleNone;
        _cell.nameLabel.text = @"朱建超";
        _cell.iconImageView.image = [UIImage imageNamed:@"h5"];
         _cell.identityLabel.text = @"软件开发人员";
        
        return _cell;
        
    }else if (indexPath.section == 1){
        
        _cell1 = [_tableView dequeueReusableCellWithIdentifier:cellID1 forIndexPath:indexPath];
        _cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        _cell1.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        if (indexPath.row == 0){
            
            [self setImageWithName:@"userList" Text:@"用户列表"];
        }else if (indexPath.row == 1){
            
            [self setImageWithName:@"yijian" Text:@"意见反馈"];
        }else if (indexPath.row == 2){
            
            [self setImageWithName:@"scan" Text:@"扫一扫"];
            
        } else if (indexPath.row == 3){
            
            [self setImageWithName:@"icon_my_setting" Text:@"设置"];
        }
        
        return _cell1;
    }
    
    return _cell1;
}

-(void)setImageWithName:(NSString *)name Text:(NSString *)text{
    
    _cell1.imageView.image = [UIImage imageNamed:name];
    _cell1.textLabel.text = text;
    _cell1.textLabel.textColor = [UIColor redColor];
    
}

@end
