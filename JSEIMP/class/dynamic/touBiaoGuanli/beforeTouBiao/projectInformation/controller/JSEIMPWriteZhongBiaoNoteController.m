//
//  JSEIMPWriteZhongBiaoNoteController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/11/16.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPWriteZhongBiaoNoteController.h"
#import <Masonry.h>
#import "LMJDropdownMenu.h"
#import <FMDB.h>

#define UIScreesW [UIScreen mainScreen].bounds.size.width
#define UIScreesH [UIScreen mainScreen].bounds.size.height

@interface JSEIMPWriteZhongBiaoNoteController ()<LMJDropdownMenuDelegate>

@end

@implementation JSEIMPWriteZhongBiaoNoteController{

    UIScrollView *_scrollView;
    
    UIView *_view;
    
    UILabel *_label1;
    
    UILabel *_projectNameLabel;
    
    UILabel *_label2;
    
    LMJDropdownMenu *_isZhongBiaoMenu;
    
    UILabel *_label3;
    
    LMJDropdownMenu *_zhongBiaoNoteStorePlaceMenu;
    
    UILabel *_label4;
    
    LMJDropdownMenu *_heTongStorePlaceMenu;
    
    UILabel *_label5;
    
    LMJDropdownMenu *_junGongNoteStorePlaceMenu;
    
    FMDatabase *_dataBase;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"录入中标通知书";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
    [self setupUI];
    
}

-(void)setupUI{

    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:_scrollView];
    
    _view = [[UIView alloc] initWithFrame:_scrollView.bounds];
    
    _view.backgroundColor = [UIColor whiteColor];
    
    [_scrollView addSubview:_view];
    
    _label1 = [self setupLabelWithText:@"项目名称" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _projectNameLabel = [self setupLabelWithText:_projectName TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _projectNameLabel.numberOfLines = 0;
    _projectNameLabel.textAlignment = NSTextAlignmentCenter;
    _projectNameLabel.layer.borderWidth = 0.5;
    
    _label2 = [self setupLabelWithText:@"是否中标" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    
    _label3 = [self setupLabelWithText:@"中标通知书存放地" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    
    _label4 = [self setupLabelWithText:@"合同存放地" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    
    _label5 = [self setupLabelWithText:@"竣工报告存放地" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    
    if (_projectNameLabel.text.length > 17) {
        
        _isZhongBiaoMenu = [self setDropDownMenuWithFrame:CGRectMake(16, 150, UIScreesW - 32, 30) Title:@"==请选择中标情况==" Titles:@[@"中标",@"失标",@"未开标"] Tag:1];
        
        _zhongBiaoNoteStorePlaceMenu = [self setDropDownMenuWithFrame:CGRectMake(16, 236, UIScreesW - 32, 30) Title:@"==请选择存放地==" Titles:@[@"无",@"档案室",@"项目"] Tag:2];
        
        _heTongStorePlaceMenu = [self setDropDownMenuWithFrame:CGRectMake(16, 320, UIScreesW - 32, 30) Title:@"==请选择存放地==" Titles:@[@"无",@"档案室",@"项目"] Tag:3];
        
        _junGongNoteStorePlaceMenu = [self setDropDownMenuWithFrame:CGRectMake(16, 404, UIScreesW - 32, 30) Title:@"==请选择存放地==" Titles:@[@"无",@"档案室",@"项目"] Tag:4];
        
        [_projectNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(_label1.mas_bottom).offset(16);
            make.left.mas_equalTo(_view.mas_left).offset(16);
            make.right.mas_equalTo(_view.mas_right).offset(-16);
        }];
    }else if (_projectNameLabel.text.length < 17){
    
        _isZhongBiaoMenu = [self setDropDownMenuWithFrame:CGRectMake(16, 134, UIScreesW - 32, 30) Title:@"==请选择中标情况==" Titles:@[@"中标",@"失标",@"未开标"] Tag:1];
        
        _zhongBiaoNoteStorePlaceMenu = [self setDropDownMenuWithFrame:CGRectMake(16, 220, UIScreesW - 32, 30) Title:@"==请选择存放地==" Titles:@[@"无",@"档案室",@"项目"] Tag:2];
        
        _heTongStorePlaceMenu = [self setDropDownMenuWithFrame:CGRectMake(16, 304, UIScreesW - 32, 30) Title:@"==请选择存放地==" Titles:@[@"无",@"档案室",@"项目"] Tag:3];
        
        _junGongNoteStorePlaceMenu = [self setDropDownMenuWithFrame:CGRectMake(16, 388, UIScreesW - 32, 30) Title:@"==请选择存放地==" Titles:@[@"无",@"档案室",@"项目"] Tag:4];
        
        [_projectNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(_label1.mas_bottom).offset(16);
            make.left.mas_equalTo(_view.mas_left).offset(16);
            make.right.mas_equalTo(_view.mas_right).offset(-16);
            make.height.mas_equalTo(30);
        }];
    }
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_view.mas_top).offset(16);
        make.centerX.mas_equalTo(_view.mas_centerX);
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_projectNameLabel.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_projectNameLabel.mas_centerX);
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_isZhongBiaoMenu.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_isZhongBiaoMenu.mas_centerX);
    }];
    
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_zhongBiaoNoteStorePlaceMenu.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_zhongBiaoNoteStorePlaceMenu.mas_centerX);
    }];
    
    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_heTongStorePlaceMenu.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_heTongStorePlaceMenu.mas_centerX);
    }];
    
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_junGongNoteStorePlaceMenu.mas_bottom).offset(16);
    }];
    
}

- (void)returnAction {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)dropdownMenuDidShow:(LMJDropdownMenu *)menu{

    if (menu.tag == 1) {
        

        
//        NSString *fileName = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"zhongBiaoStatus.sqlite"];
//        
//        _dataBase = [FMDatabase databaseWithPath:fileName];
//        
//        if ([_dataBase open]) {
//            
//            BOOL result = [_dataBase executeUpdate:@"CREATE TABLE IF NOT EXISTS zhongBiaoStatus (id integer PRIMARY KEY AUTOINCREMENT, status text NOT NULL);"];
//            
//            if (result) {
//                
//                NSLog(@"创建成功");
//            }
//        }
//        
//        [_dataBase executeUpdate:@"INSERT INTO zhongBiaoStatus (status) VALUES (?);",menu.mainBtn.titleLabel.text];
        
    }else if (menu.tag == 4) {
        
        [_view mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.mas_equalTo(_scrollView);
            make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
            make.bottom.mas_equalTo(_junGongNoteStorePlaceMenu.listView.mas_bottom).offset(16);
        }];
    }

}

-(void)dropdownMenuDidHidden:(LMJDropdownMenu *)menu{

    if (menu.tag == 1) {
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        
        [userDefaults setObject:menu.mainBtn.titleLabel.text forKey:[@"zhongBiaoStatus" stringByAppendingString:[@(_number) stringValue]]];
        
        [userDefaults synchronize];
        
//        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//        
//        [userDefaults setObject:menu.mainBtn.titleLabel.text forKey:@"zhongBiaoStatus"];
//        
//        [userDefaults synchronize];
//
        [[NSNotificationCenter defaultCenter] postNotificationName:@"zhongBiaoStatus" object:menu.mainBtn.titleLabel.text];
        
    }

}

-(UILabel *)setupLabelWithText:(NSString *)text TextColor:(UIColor *)textColor Font:(UIFont *)font{
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = textColor;
    label.font = font;
    
    [_view addSubview:label];
    
    return label;
    
}

-(LMJDropdownMenu *)setDropDownMenuWithFrame:(CGRect)frame Title:(NSString *)title Titles:(NSArray *)titles Tag:(NSInteger)tag{
    
    LMJDropdownMenu *dropDownMenu = [[LMJDropdownMenu alloc] init];
    
    dropDownMenu.tag = tag;
    dropDownMenu.delegate = self;
    [dropDownMenu setFrame:frame];
    [dropDownMenu.mainBtn setTitle:title forState:UIControlStateNormal];
    [dropDownMenu.mainBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 3, 0, 5)];
    [dropDownMenu.mainBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    dropDownMenu.mainBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [dropDownMenu setMenuTitles:titles rowHeight:30];
    
    [_view addSubview:dropDownMenu];
    
    return dropDownMenu;
    
}

@end
