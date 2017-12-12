//
//  JSEIMPTouBiaoDetailController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/9/18.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPTouBiaoDetailController.h"
#import <Masonry.h>

@interface JSEIMPTouBiaoDetailController ()

@end

@implementation JSEIMPTouBiaoDetailController{

    UIScrollView *_scrollView;

    UIView *_view;
    
    UILabel *_label1;
    
    UILabel *_bianMaLabel;
    
    UILabel *_label2;
    
    UILabel *_projectNameLabel;
    
    UILabel *_label3;
    
    UILabel *_adressLabel;
    
    UILabel *_label4;
    
    UILabel *_label5;
    
    UILabel *_label6;
    
    UILabel *_label7;
    
    UILabel *_label8;
    
    UILabel *_label9;
    
    UILabel *_areaLabel;
    
    UILabel *_buildCompanyLabel;
    
    UILabel *_guiMoLabel;
    
    UILabel *_moneyFromLabel;
    
    UILabel *_zhaoBiaoStyleLabel;
    
    UILabel *_contactPeopleLabel;
    
    UILabel *_isZHongBiaoLabel;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = _projectName;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
    [self setupUI];
    
}

- (void)returnAction {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setupUI{

    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:_scrollView];
    
    _view = [[UIView alloc] initWithFrame:_scrollView.bounds];
    
    _view.backgroundColor = [UIColor whiteColor];
    
    [_scrollView addSubview:_view];
    
    _label1 = [self setupLabelWithText:@"编码" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _bianMaLabel = [self setupLabelWithText:_bianHaoName TextColor:[UIColor darkGrayColor] Font:[UIFont boldSystemFontOfSize:16]];
    _label2 = [self setupLabelWithText:@"项目名称" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _projectNameLabel = [self setupLabelWithText:_projectName TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _projectNameLabel.numberOfLines = 0;
    _projectNameLabel.textAlignment = NSTextAlignmentRight;
    _label3 = [self setupLabelWithText:@"项目地址" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _adressLabel = [self setupLabelWithText:@"南京栖霞区" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _adressLabel.numberOfLines = 0;
    _adressLabel.textAlignment = NSTextAlignmentRight;
    _label4 = [self setupLabelWithText:@"区域" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _areaLabel = [self setupLabelWithText:@"华东" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _label5 = [self setupLabelWithText:@"建设单位" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _buildCompanyLabel = [self setupLabelWithText:@"嘉实集团" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _label6 = [self setupLabelWithText:@"规模" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _guiMoLabel = [self setupLabelWithText:@"9999亩" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _label7 = [self setupLabelWithText:@"资金来源" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _moneyFromLabel = [self setupLabelWithText:@"资金来源于xxx" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _label8 = [self setupLabelWithText:@"招标模式" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _zhaoBiaoStyleLabel = [self setupLabelWithText:@"招标模式是xxx" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _label9 = [self setupLabelWithText:@"联系人" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _contactPeopleLabel = [self setupLabelWithText:@"朱建超" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _label10 = [self setupLabelWithText:@"是否中标" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_view.mas_top).offset(16);
        make.left.mas_equalTo(_view.mas_left).offset(16);
        
    }];
    
    [_bianMaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label1.mas_centerY);
        make.right.mas_equalTo(_view.mas_right).offset(-16);
        
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label1.mas_left);
        make.top.mas_equalTo(_label1.mas_bottom).offset(16);
        make.width.mas_equalTo(82);
    }];
    
    [_projectNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label2.mas_right).offset(16);
        make.top.mas_equalTo(_label2.mas_top);
        make.right.mas_equalTo(_bianMaLabel.mas_right);
        
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label2.mas_left);
        make.top.mas_equalTo(_projectNameLabel.mas_bottom).offset(16);
        make.right.mas_equalTo(_label2.mas_right);
        
    }];

    [_adressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label3.mas_right).offset(16);
        make.top.mas_equalTo(_label3.mas_top);
        make.right.mas_equalTo(_projectNameLabel.mas_right);
        
    }];
    
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label3.mas_left);
        make.top.mas_equalTo(_adressLabel.mas_bottom).offset(16);
        
    }];
    
    [_areaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label4.mas_centerY);
        make.right.mas_equalTo(_view.mas_right).offset(-16);
        
    }];
    
    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label4.mas_left);
        make.top.mas_equalTo(_label4.mas_bottom).offset(16);
        
    }];
    
    [_buildCompanyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(_areaLabel.mas_right);
        make.centerY.mas_equalTo(_label5.mas_centerY);
        
    }];
    
    [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label5.mas_left);
        make.top.mas_equalTo(_label5.mas_bottom).offset(16);
    }];
    
    [_guiMoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(_buildCompanyLabel.mas_right);
        make.centerY.mas_equalTo(_label6.mas_centerY);
        
    }];
    
    [_label7 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label6.mas_left);
        make.top.mas_equalTo(_label6.mas_bottom).offset(16);
        
    }];
    
    [_label8 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label7.mas_left);
        make.top.mas_equalTo(_label7.mas_bottom).offset(16);
        
    }];
    
    [_label9 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label8.mas_left);
        make.top.mas_equalTo(_label8.mas_bottom).offset(16);
        
    }];
    
    [_label10 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label9.mas_left);
        make.top.mas_equalTo(_label9.mas_bottom).offset(16);
        
    }];
    
    [_moneyFromLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(_guiMoLabel.mas_right);
        make.centerY.mas_equalTo(_label7.mas_centerY);
        
    }];
    
    [_zhaoBiaoStyleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(_moneyFromLabel.mas_right);
        make.centerY.mas_equalTo(_label8.mas_centerY);
        
    }];
    
    [_contactPeopleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(_zhaoBiaoStyleLabel.mas_right);
        make.centerY.mas_equalTo(_label9.mas_centerY);
        
    }];
    
    [_isZHongBiaoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(_contactPeopleLabel.mas_right);
        make.centerY.mas_equalTo(_label10.mas_centerY);
        
    }];
    
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_label10.mas_bottom).offset(16);
        
    }];
    
}

-(UILabel *)setupLabelWithText:(NSString *)text TextColor:(UIColor *)textColor Font:(UIFont *)font{

    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = textColor;
    label.font = font;
    
    [_view addSubview:label];

    return label;
    
}

@end
