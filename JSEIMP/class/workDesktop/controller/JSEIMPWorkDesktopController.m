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
    
    return 4;
    
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
    }else if (indexPath.section == 3){
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否退出当前账号？" preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
        //添加取消
        [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        
        //添加确定
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
            JSEIMPLoginController *loginController = [JSEIMPLoginController new];
            
            [self.navigationController pushViewController:loginController animated:YES];
            
            NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
            
            [data removeObjectForKey:@"username"];
            [data removeObjectForKey:@"password"];
            [data removeObjectForKey:@"userToken"];
        }]];
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
    }else if (indexPath.section == 3){
        
        _cell.textLabel.text = @"退出当前账号";
        _cell.textLabel.textAlignment  =NSTextAlignmentCenter;
        _cell.textLabel.textColor = [UIColor redColor];
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
