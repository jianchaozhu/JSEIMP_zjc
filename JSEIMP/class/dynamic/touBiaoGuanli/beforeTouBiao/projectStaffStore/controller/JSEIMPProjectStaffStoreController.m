//
//  JSEIMPProjectStaffStoreController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/9/27.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPProjectStaffStoreController.h"
#import "JSEIMPStaffStoreDetailController.h"
#import "JSEIMPNewStaffStoreController.h"

static NSString *cellID = @"cellID";

@interface JSEIMPProjectStaffStoreController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *staffNameMArray;

@property(nonatomic,strong)NSMutableArray *staffNumberMArray;

@end

@implementation JSEIMPProjectStaffStoreController{
    
    UITableView *_tableView;
    
    UITableViewCell *_cell;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"项目人员备案库";
    
    _staffNameMArray = [NSMutableArray arrayWithObjects:@"赵",@"钱",@"孙",@"李",@"周",@"谢帆",@"test", nil];
    _staffNumberMArray = [NSMutableArray arrayWithObjects:@"JS0001",@"JS0002",@"JS0003",@"JS0004",@"JS0005",@"JS0006",@"JS0007", nil];
    
    [self setupUI];
    
}

-(void)setupUI{
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    [self.view addSubview:_tableView];
    
    //添加右边的按钮
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(clickAddButton)];
    
    self.navigationItem.rightBarButtonItem = addButton;
    
}

-(void)clickAddButton{
    
    JSEIMPNewStaffStoreController *newStaffStoreController = [JSEIMPNewStaffStoreController new];
    
    [self.navigationController pushViewController:newStaffStoreController animated:YES];
    
    //    if (_canInformationPut == YES) {
    
    //    }
    //    else if (_canInformationPut == NO){
    //
    //        [self setupAlertLabelWithTitle:@"对不起，您没有此权限" Rect:CGRectMake(self.view.center.x - 90, self.view.center.y + 100, 180, 50)];
    //
    //    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JSEIMPStaffStoreDetailController *staffStoreDetailController = [JSEIMPStaffStoreDetailController new];
    
    staffStoreDetailController.staffName = _staffNameMArray[indexPath.row];
    staffStoreDetailController.staffNumber = _staffNumberMArray[indexPath.row];
    
    [self.navigationController pushViewController:staffStoreDetailController animated:YES];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _staffNameMArray.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    NSString *str = _staffNameMArray[indexPath.row];
    
    CGSize size = [str sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(280, 999) lineBreakMode:NSLineBreakByWordWrapping];
    
    
    return size.height + 40;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView cellForRowAtIndexPath:indexPath];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
        
    _cell.textLabel.text = _staffNameMArray[indexPath.row];
    _cell.detailTextLabel.text = _staffNumberMArray[indexPath.row];
    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    _cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _cell.textLabel.numberOfLines = 0;
    
    return _cell;
    
}

@end
