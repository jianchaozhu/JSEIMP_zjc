//
//  JSEIMPProjectShouXuDealController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/10/16.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPProjectShouXuDealController.h"
#import "JSEIMPProjectShouXuNameController.h"
#import "JSEIMPNewProjectShouXuController.h"

static NSString *cellID = @"cellID";

@interface JSEIMPProjectShouXuDealController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *projectNameMArray;

@property(nonatomic,strong)NSMutableArray *shouXuListMarray;

@end

@implementation JSEIMPProjectShouXuDealController{

    UITableView *_tableView;
    
    UITableViewCell *_cell;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"项目手续办理";
    
    _projectNameMArray = [NSMutableArray arrayWithObjects:@"金马路项目建安总承包工程",@"太阳城一期二标", nil];
    _shouXuListMarray = [NSMutableArray arrayWithObjects:@"资质核检手续",@"发包手续",@"合同备案手续",@"质检手续",@"安检手续",@"施工许可证办理", nil];
    
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
    
    JSEIMPNewProjectShouXuController *newProjectShouXuController = [JSEIMPNewProjectShouXuController new];
    
    newProjectShouXuController.titles = _shouXuListMarray;
    newProjectShouXuController.projectNameMArray = _projectNameMArray;
    
    [self.navigationController pushViewController:newProjectShouXuController animated:YES];
    
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JSEIMPProjectShouXuNameController *projectShouXuNameController = [JSEIMPProjectShouXuNameController new];
    
    projectShouXuNameController.projectName = _projectNameMArray[indexPath.row];
    projectShouXuNameController.shouXuListMArray = _shouXuListMarray;
    
    [self.navigationController pushViewController:projectShouXuNameController animated:YES];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView cellForRowAtIndexPath:indexPath];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    
    if (indexPath.row == 0) {
        
        _cell.textLabel.text = _projectNameMArray[indexPath.row];
        
    }else if (indexPath.row == 1){
        
        _cell.textLabel.text = _projectNameMArray[indexPath.row];
        
    }
    
    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    _cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _cell.textLabel.numberOfLines = 0;
    
    return _cell;
    
}

@end
