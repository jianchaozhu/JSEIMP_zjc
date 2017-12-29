//
//  JSEIMPWorkDesktopController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/11/21.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPWorkDesktopController.h"
#import "JSEIMPDaiBanItemsController.h"
#import "JSEIMPZaiBanItemsController.h"
#import "JSEIMPYiBanItemsController.h"

static NSString *cellID = @"cellID";

@interface JSEIMPWorkDesktopController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation JSEIMPWorkDesktopController{
    
    UITableView *_tableView;
    
    UITableViewCell *_cell;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"工作台";
    
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
    
    return 5;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        JSEIMPDaiBanItemsController *daiBanItemsController = [JSEIMPDaiBanItemsController new];
        
        [self.navigationController pushViewController:daiBanItemsController animated:YES];
    }else if (indexPath.section == 1){
        
        JSEIMPZaiBanItemsController *zaiBanItemsController = [JSEIMPZaiBanItemsController new];
        
        [self.navigationController pushViewController:zaiBanItemsController animated:YES];
    }else if (indexPath.section == 2){
        
        JSEIMPYiBanItemsController *yiBanItemsController = [JSEIMPYiBanItemsController new];
        
        [self.navigationController pushViewController:yiBanItemsController animated:YES];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    if (indexPath.section == 0) {
            
        [self setImageViewWithName:@"waitForDo" Text:@"待办事项" TextColor:[UIColor darkTextColor]];

    }else if (indexPath.section == 1){
        
        [self setImageViewWithName:@"isDoing" Text:@"在办事项" TextColor:[UIColor darkTextColor]];
    }else if (indexPath.section == 2){
    
        [self setImageViewWithName:@"isDone" Text:@"已办事项" TextColor:[UIColor darkTextColor]];
    }
    
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
