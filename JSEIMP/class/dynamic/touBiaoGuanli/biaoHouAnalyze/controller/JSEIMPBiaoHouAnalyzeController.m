//
//  JSEIMPBiaoHouAnalyzeController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/10/24.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPBiaoHouAnalyzeController.h"
#import "JSEIMPNewBiaoHouAnalyzeController.h"
#import "JSEIMPBiaoHouAnalyzeDetailController.h"

static NSString *cellID = @"cellID";

@interface JSEIMPBiaoHouAnalyzeController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *projectNameMArray;

@property(nonatomic,strong)NSMutableArray *guiMoMArray;

@property(nonatomic,strong)NSMutableArray *ziJinLaiYuanMArray;

@end

@implementation JSEIMPBiaoHouAnalyzeController{
    
    UITableView *_tableView;
    
    UITableViewCell *_cell;
    
    NSMutableArray *_finalMArray;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"标后分析";
    
    _projectNameMArray = [NSMutableArray arrayWithObjects:@"无锡碧桂园XDG-2010-33号地块住宅、商业及公建配套项目（B2-2、B2-3)",@"瓦屋李新城二期土建安装工程", nil];
    _guiMoMArray = [NSMutableArray arrayWithObjects:@"133294.66",@"109453.1", nil];
    _ziJinLaiYuanMArray = [NSMutableArray arrayWithObjects:@"国有资金51%，非国有资金49%",@"私民营投资", nil];
    
    NSString *string1 = @"规模(平方)：";
    NSString *string2 = @"(平方米)";
    NSString *string3;
    NSString *string4;
    NSString *string5 = @"   ";
    NSString *string6;
    NSString *string7 = @"资金来源：";
    NSString *string8;
    NSString *string9;
    
    _finalMArray = [NSMutableArray array];
    
    for (int i = 0; i < _guiMoMArray.count; i++) {
        
        string3 = [string1 stringByAppendingString:_guiMoMArray[i]];
        string4 = [string3 stringByAppendingString:string2];
        string6 = [string4 stringByAppendingString:string5];
        string8 = [string6 stringByAppendingString:string7];
        string9 = [string8 stringByAppendingString:_ziJinLaiYuanMArray[i]];
        
        [_finalMArray addObject:string9];
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
    
    JSEIMPNewBiaoHouAnalyzeController *newBiaoHouAnalyzeController = [JSEIMPNewBiaoHouAnalyzeController new];
    
    [self.navigationController pushViewController:newBiaoHouAnalyzeController animated:YES];
    
    //    if (_canInformationPut == YES) {
    
    //    }
    //    else if (_canInformationPut == NO){
    //
    //        [self setupAlertLabelWithTitle:@"对不起，您没有此权限" Rect:CGRectMake(self.view.center.x - 90, self.view.center.y + 100, 180, 50)];
    //
    //    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _projectNameMArray.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_cell.textLabel.text.length > 20) {
        
        return 100;
    }
    
    return 80;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JSEIMPBiaoHouAnalyzeDetailController *biaoHouAnalyzeDetailController = [JSEIMPBiaoHouAnalyzeDetailController new];
    
    biaoHouAnalyzeDetailController.projectName = _projectNameMArray[indexPath.row];
    biaoHouAnalyzeDetailController.guiMo = _guiMoMArray[indexPath.row];
    biaoHouAnalyzeDetailController.ziJinLaiYuan = _ziJinLaiYuanMArray[indexPath.row];
    
    [self.navigationController pushViewController:biaoHouAnalyzeDetailController animated:YES];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView cellForRowAtIndexPath:indexPath];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    
    if (indexPath.row == 0) {
        
        _cell.textLabel.text = _projectNameMArray[indexPath.row];
        _cell.detailTextLabel.text = _finalMArray[indexPath.row];
        
    }else if (indexPath.row == 1){
        
        _cell.textLabel.text = _projectNameMArray[indexPath.row];
        _cell.detailTextLabel.text = _finalMArray[indexPath.row];
        
    }
    
    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    _cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _cell.textLabel.numberOfLines = 0;
    _cell.detailTextLabel.numberOfLines = 0;
    
    return _cell;
    
}

@end
