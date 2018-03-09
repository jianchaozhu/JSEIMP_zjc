//
//  JSEIMPChildOtherShouHeTongController.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/3/9.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPChildOtherShouHeTongController.h"
#import "JSEIMPNetWorking.h"

static NSString *cellID = @"cellID";

@interface JSEIMPChildOtherShouHeTongController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>

@property(nonatomic,strong)NSMutableArray *contractIdMArray;

@property(nonatomic,strong)NSMutableArray *contractNameMArray;

@property(nonatomic,strong)NSMutableArray *statusMArray;

@property(nonatomic,strong)NSMutableArray *resultArray;

@property(nonatomic,strong)NSMutableArray *finalResultMArray;

@property(nonatomic,strong)NSMutableArray *finalMArray;

@end

@implementation JSEIMPChildOtherShouHeTongController{
    
    UITableView *_tableView;
    
    UITableViewCell *_cell;
    
    UIView *_view;
    
    UISearchBar *_searchBar;
}

-(NSMutableArray *)resultArray{
    
    if (!_resultArray) {
        _resultArray = [NSMutableArray array];
    }
    return _resultArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"采购合同";
    
    [self getData];
    
    [self setupUI];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
}

- (void)returnAction {
    
    [self.navigationController popViewControllerAnimated:YES];
}

//UISearchBar作为tableview的头部
-(UIView *)headView{
    
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 64, 100, 44)];
    _searchBar.keyboardType = UIKeyboardAppearanceDefault;
    _searchBar.placeholder = @"请输入搜索关键字";
    _searchBar.delegate = self;
    //底部的颜色
    _searchBar.searchBarStyle = UISearchBarStyleDefault;
    _searchBar.barStyle = UIBarStyleDefault;
    return _searchBar;
}

-(void)getData{
    
    [JSEIMPNetWorking getOtherShouRuHeTongOnSuccess:^(NSMutableArray *contractIdMArray,NSMutableArray *contractNameMArray,NSMutableArray *statusMArray){
        
        _contractIdMArray = contractIdMArray.copy;
        _contractNameMArray = contractNameMArray.copy;
        _statusMArray = statusMArray.copy;
        
        _finalMArray = [NSMutableArray array];
        
        NSString *string1 = @"合同状态：";
        NSString *string2;
        
        for (int i = 0; i < _statusMArray.count; i++) {
            
            string2 = [string1 stringByAppendingString:_statusMArray[i]];
            
            [_finalMArray addObject:string2];
        }
        
        self.resultArray = _contractNameMArray.copy;
        
        [_tableView reloadData];
        
    } onErrorInfo:nil];
}

-(void)setupUI{
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    _tableView.tableHeaderView = [self headView];
    _tableView.tableFooterView = [[UIView alloc]init];
    
    [self.view addSubview:_tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.resultArray.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *str = self.resultArray[indexPath.row];
    
    CGSize size = [str sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(280, 999) lineBreakMode:NSLineBreakByWordWrapping];
    
    return size.height + 50;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView cellForRowAtIndexPath:indexPath];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    
    _cell.textLabel.text = self.resultArray[indexPath.row];
    _cell.detailTextLabel.text = _finalMArray[indexPath.row];
    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    _cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _cell.textLabel.numberOfLines = 0;
    _cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
    if ([_statusMArray[indexPath.row] isEqualToString:@"待审"] || [_statusMArray[indexPath.row] isEqualToString:@"审批中"]) {
        _cell.detailTextLabel.textColor = [UIColor orangeColor];
    }else if ([_statusMArray[indexPath.row] isEqualToString:@"已审"]){
        _cell.detailTextLabel.textColor = [UIColor greenColor];
    }
    
    return _cell;
    
}

@end
