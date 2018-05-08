//
//  JSEIMPBuMenInSuZhouJiaShiGuoJiHotelController.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/3/30.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPBuMenInSuZhouJiaShiGuoJiHotelController.h"
#import "JSEIMPNetWorking.h"

static NSString *cellID = @"cellID";

@interface JSEIMPBuMenInSuZhouJiaShiGuoJiHotelController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *buMenInSuZhouJiaShiGuoJiHotelMArray;

@end

@implementation JSEIMPBuMenInSuZhouJiaShiGuoJiHotelController{
    
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
    titleViewLabel.text = _vcTitle;
    titleViewLabel.textAlignment = NSTextAlignmentCenter;
    
    self.navigationItem.titleView = titleViewLabel;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
    [self getData];
    
    [self setupUI];
}

- (void)returnAction {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)getData{
    
    [JSEIMPNetWorking getBuMenListWithXinXiHuaManageCenter:@"001_04_005" IsIncludeZiJieDian:@"true" SkipCount:0 MaxResultCount:10000 OnSuccess:^(NSMutableArray *buMenInSuZhouJiaShiGuoJiHotelMArray){
        
        _buMenInSuZhouJiaShiGuoJiHotelMArray = buMenInSuZhouJiaShiGuoJiHotelMArray.copy;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [_tableView reloadData];
        });
        
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _buMenInSuZhouJiaShiGuoJiHotelMArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView cellForRowAtIndexPath:indexPath];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    _cell.textLabel.text = _buMenInSuZhouJiaShiGuoJiHotelMArray[indexPath.row];
    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    return _cell;
}

@end
