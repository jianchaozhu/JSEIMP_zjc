//
//  JSEIMPProjectJiangXiangDetailController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/10/23.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPProjectJiangXiangDetailController.h"
#import <Masonry.h>
#import "JSEIMPNetWorking.h"

static NSString *cellID = @"cellID";

@interface JSEIMPProjectJiangXiangDetailController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *awardDateMArray;

@property(nonatomic,strong)NSMutableArray *awardNameMArray;

@property(nonatomic,strong)NSMutableArray *levelMArray;

@property(nonatomic,strong)NSMutableArray *finalMArray;

@end

@implementation JSEIMPProjectJiangXiangDetailController{

    UITableView *_tableView;
    
    UITableViewCell *_cell;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleViewLabel = [[UILabel alloc] init];
    titleViewLabel.frame = CGRectMake(0, 0, 180, 40);
    titleViewLabel.numberOfLines = 0;
    titleViewLabel.font = [UIFont systemFontOfSize:16];
    titleViewLabel.text = _projectName;
    titleViewLabel.textAlignment = NSTextAlignmentCenter;
    
    self.navigationItem.titleView = titleViewLabel;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
    [self getData];
    
    [self setupUI];
    
}

- (void)returnAction {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)getData{

    [JSEIMPNetWorking getProjectJiangXiangDetailWithProjectId:_projectId OnSuccess:^(NSMutableArray *awardDateMArray,NSMutableArray *awardNameMArray,NSMutableArray *levelMArray){
        
        _awardDateMArray = awardDateMArray.copy;
        _awardNameMArray = awardNameMArray.copy;
        _levelMArray = levelMArray.copy;
        
        NSString *string1 = @"发证时间：";
        NSString *string2 = @"级别：";
        NSString *string3;
        NSString *string4;
        NSString *string5;
        NSString *string6;
        
        _finalMArray = [NSMutableArray array];
        for (int i = 0; i < _awardDateMArray.count; i++) {
            
            string3 = [string1 stringByAppendingString:_awardDateMArray[i]];
            string4 = [string3 stringByAppendingString:@"     "];
            string5 = [string4 stringByAppendingString:string2];
            string6 = [string5 stringByAppendingString:_levelMArray[i]];
            
            [_finalMArray addObject:string6];
        }
        
        [_tableView reloadData];
        
    } onErrorInfo:nil];

}

-(void)setupUI{

    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    _tableView.tableFooterView = [[UIView alloc]init];
    
    [self.view addSubview:_tableView];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //cell自适应高度
    NSString *str = _awardDateMArray[indexPath.row];
    
    CGSize size = [str sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(280, 999) lineBreakMode:NSLineBreakByWordWrapping];
    
    return size.height + 40;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return 10;
    }
    
    return 5;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    if (section == _awardDateMArray.count - 1) {
        
        return 10;
    }
    
    return 5;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return _awardDateMArray.count;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView cellForRowAtIndexPath:indexPath];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    
    _cell.textLabel.text = _awardNameMArray[indexPath.section];
    _cell.detailTextLabel.text = _finalMArray[indexPath.section];
    _cell.detailTextLabel.textColor = [UIColor darkGrayColor];
    _cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
    _cell.textLabel.numberOfLines = 0;
    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return _cell;
    
}

@end
