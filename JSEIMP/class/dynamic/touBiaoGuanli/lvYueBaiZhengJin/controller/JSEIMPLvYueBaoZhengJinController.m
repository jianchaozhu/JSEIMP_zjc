//
//  JSEIMPLvYueBaoZhengJinController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/10/12.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPLvYueBaoZhengJinController.h"
#import "JSEIMPLvYueBaoZhengJinDetailController.h"
#import "JSEIMPNewLvYueBaoZhengJinController.h"

static NSString *cellID = @"cellID";

@interface JSEIMPLvYueBaoZhengJinController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *projectNameMArray;

@property(nonatomic,strong)NSMutableArray *heTongValueMArray;

@end

@implementation JSEIMPLvYueBaoZhengJinController{
    
    UITableView *_tableView;
    
    UITableViewCell *_cell;
    
    NSMutableArray *_finalBaoZhengJinMArray;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"履约保证金";
    
    _projectNameMArray = [NSMutableArray arrayWithObjects:@"南京马群C地块项目",@"嘉定碧桂园总承包工程", nil];
    
    NSString *string1 = @"合同总价：";
    NSString *string2 = @"(万元)";
    NSString *string3;
    NSString *string4;
    _finalBaoZhengJinMArray = [NSMutableArray array];
    
    _heTongValueMArray = [NSMutableArray arrayWithObjects:@"100",@"200", nil];
    
    for (int i = 0; i < _heTongValueMArray.count; i++) {
        
        string3 = [string1 stringByAppendingString:_heTongValueMArray[i]];
        string4 = [string3 stringByAppendingString:string2];
        
        [_finalBaoZhengJinMArray addObject:string4];
    }
    
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
    
//    JSEIMPNewZiZhiCheckShouoXuController *newZiZhiCheckShouoXuController = [JSEIMPNewZiZhiCheckShouoXuController new];
//    
//    [self.navigationController pushViewController:newZiZhiCheckShouoXuController animated:YES];
    
    JSEIMPNewLvYueBaoZhengJinController *newLvYueBaoZhengJinController = [JSEIMPNewLvYueBaoZhengJinController new];
    
    [self.navigationController pushViewController:newLvYueBaoZhengJinController animated:YES];
    
    //    if (_canInformationPut == YES) {
    
    //    }
    //    else if (_canInformationPut == NO){
    //
    //        [self setupAlertLabelWithTitle:@"对不起，您没有此权限" Rect:CGRectMake(self.view.center.x - 90, self.view.center.y + 100, 180, 50)];
    //
    //    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JSEIMPLvYueBaoZhengJinDetailController *lvYueBaoZhengJinDetailController = [JSEIMPLvYueBaoZhengJinDetailController new];
    
    lvYueBaoZhengJinDetailController.projectName = _projectNameMArray[indexPath.row];
    lvYueBaoZhengJinDetailController.heTongValue = _heTongValueMArray[indexPath.row];
    
    [self.navigationController pushViewController:lvYueBaoZhengJinDetailController animated:YES];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView cellForRowAtIndexPath:indexPath];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    
    if (indexPath.row == 0) {
        
        _cell.textLabel.text = _projectNameMArray[indexPath.row];
        _cell.detailTextLabel.text = _finalBaoZhengJinMArray[indexPath.row];
        
    }else if (indexPath.row == 1){
        
        _cell.textLabel.text = _projectNameMArray[indexPath.row];
        _cell.detailTextLabel.text = _finalBaoZhengJinMArray[indexPath.row];
        
    }
    
    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return _cell;
    
}

@end
