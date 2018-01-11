//
//  JSEIMPQualityCheckController.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/1/4.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPQualityCheckController.h"
#import "JSEIMPProjectListController.h"
#import "JSEIMPQualityCheckDetailController.h"
#import "JSEIMPNewQualityCheckController.h"

static NSString *cellID = @"cellID";

@interface JSEIMPQualityCheckController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSString *projectName;

@property(nonatomic,strong)NSString *danHao;

@property(nonatomic,strong)NSString *zhengGaiRen;

@end

@implementation JSEIMPQualityCheckController{
    
    UITableView *_tableView;
    
    UITableViewCell *_cell;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
    //添加右边的按钮
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(clickAddButton:)];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"根目录" style:UIBarButtonItemStyleDone target:self action:@selector(clickBackButton:)];
    
    NSArray *buttonArray = [NSArray arrayWithObjects:addButton,backButton, nil];
    
    self.navigationItem.rightBarButtonItems = buttonArray;
    
    UILabel *titleViewLabel = [[UILabel alloc] init];
    titleViewLabel.frame = CGRectMake(0, 0, 180, 40);
    titleViewLabel.numberOfLines = 0;
    titleViewLabel.font = [UIFont boldSystemFontOfSize:16];
    titleViewLabel.text = [NSString stringWithFormat:@"质量检查整改单(%@)",_buildingName];
    titleViewLabel.textAlignment = NSTextAlignmentCenter;
    
    self.navigationItem.titleView = titleViewLabel;
    
    _projectName = @"无锡万科金域缇香项目";
    _danHao = @"ZGD-201712-0021";
    _zhengGaiRen = @"贾明胜";
    
    [self setupUI];
}

- (void)returnAction {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)clickAddButton:(UIButton *)button{
    
    JSEIMPNewQualityCheckController *newQualityCheckController = [JSEIMPNewQualityCheckController new];
    
    newQualityCheckController.projectName = _projectName;
    newQualityCheckController.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:newQualityCheckController animated:YES];
}

-(void)clickBackButton:(UIButton *)button{
    
    for(UIViewController *controller in self.navigationController.viewControllers) {
        
        if([controller isKindOfClass:[JSEIMPProjectListController class]]) {
            
            [self.navigationController popToViewController:controller animated:YES];
        }
    }
}

-(void)setupUI{
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    [self.view addSubview:_tableView];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *str = _projectName;
    
    CGSize size = [str sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(280, 999) lineBreakMode:NSLineBreakByWordWrapping];
    
    return size.height + 40;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JSEIMPQualityCheckDetailController *qualityCheckDetailController = [JSEIMPQualityCheckDetailController new];
    
    qualityCheckDetailController.buildingName = _buildingName;
    qualityCheckDetailController.projectName = _projectName;
    qualityCheckDetailController.danHao = _danHao;
    qualityCheckDetailController.zhengGaiRen = _zhengGaiRen;
    
    [self.navigationController pushViewController:qualityCheckDetailController animated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView cellForRowAtIndexPath:indexPath];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    
    _cell.textLabel.text = _projectName;
    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    _cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _cell.textLabel.numberOfLines = 0;
    _cell.detailTextLabel.text = [NSString stringWithFormat:@"单号：%@   整改责任人：%@",_danHao,_zhengGaiRen,nil];
    _cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
    _cell.detailTextLabel.textColor = [UIColor darkGrayColor];
    _cell.detailTextLabel.numberOfLines = 0;
    
    return _cell;
    
}

@end
