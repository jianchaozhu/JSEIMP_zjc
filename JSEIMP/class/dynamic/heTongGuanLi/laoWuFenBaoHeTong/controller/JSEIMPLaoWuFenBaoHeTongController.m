//
//  JSEIMPLaoWuFenBaoHeTongController.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/2/1.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPLaoWuFenBaoHeTongController.h"
#import "JSEIMPChildLaoWuFenBaoHeTongController.h"

static NSString *cellID = @"cellID";

@interface JSEIMPLaoWuFenBaoHeTongController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation JSEIMPLaoWuFenBaoHeTongController{
    
    UITableView *_tableView;
    
    UITableViewCell *_cell;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"劳务分包合同";
    
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
    
    if (section == 0) {
        
        return 10;
    }
    
    return 5;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        JSEIMPChildLaoWuFenBaoHeTongController *childLaoWuFenBaoHeTongController = [JSEIMPChildLaoWuFenBaoHeTongController new];
        
        [self.navigationController pushViewController:childLaoWuFenBaoHeTongController animated:YES];
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    
    if (indexPath.row == 0) {
        
        [self setImageViewWithName:@"laoWuFenBaoHeTong" Text:@"劳务分包合同"];
    }
    
    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return _cell;
    
}

-(void)setImageViewWithName:(NSString *)name Text:(NSString *)text{
    
    _cell.imageView.image = [UIImage imageNamed:name];
    _cell.textLabel.text = text;
    
}

@end
