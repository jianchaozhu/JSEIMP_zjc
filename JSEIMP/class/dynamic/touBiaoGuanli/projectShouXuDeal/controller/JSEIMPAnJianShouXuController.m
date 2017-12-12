//
//  JSEIMPAnJianShouXuController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/10/17.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPAnJianShouXuController.h"
#import <Masonry.h>

@interface JSEIMPAnJianShouXuController ()

@end

@implementation JSEIMPAnJianShouXuController{

    UIScrollView *_scrollView;
    
    UIView *_view;
    
    UILabel *_label1;
    
    UILabel *_label2;
    
    UILabel *_label3;
    
    UILabel *_label4;
    
    UILabel *_label5;
    
    UILabel *_label6;
    
    UILabel *_label7;
    
    UILabel *_label8;
    
    UILabel *_label9;
    
    UILabel *_projectNameLabel;
    
    UILabel *_yiWaiShangHaiXianLabel;
    
    UILabel *_gongShangXianLabel;

    UILabel *_wenMingCuoShiMoneyLabel;
    
    UILabel *_mobileGPSMoneyLabel;
    
    UILabel *_shiPinMoneyLabel;
    
    UILabel *_anJianZiLiaoLabel;
    
    UILabel *_anJianNoteLabel;
    
    UILabel *_beiZhuLabel;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = _titleName;
    
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
    
    _label1 = [self setupLabelWithText:@"项目名称" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label2 = [self setupLabelWithText:@"意外伤害险" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label3 = [self setupLabelWithText:@"安检工商险" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label4 = [self setupLabelWithText:@"文明措施费" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label5 = [self setupLabelWithText:@"手机定位费" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label6 = [self setupLabelWithText:@"视频费" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label7 = [self setupLabelWithText:@"有无安检资料" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label8 = [self setupLabelWithText:@"有无安检通知书" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label9 = [self setupLabelWithText:@"备注" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];

    _projectNameLabel = [self setupLabelWithText:_projectName TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _projectNameLabel.numberOfLines = 0;
    _projectNameLabel.textAlignment = NSTextAlignmentRight;
    
    _yiWaiShangHaiXianLabel = [self setupLabelWithText:@"意外伤害险" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _yiWaiShangHaiXianLabel.textAlignment = NSTextAlignmentRight;
    
    _gongShangXianLabel = [self setupLabelWithText:@"安检工商险" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _gongShangXianLabel.textAlignment = NSTextAlignmentRight;
    
    _wenMingCuoShiMoneyLabel = [self setupLabelWithText:@"文明措施费" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _wenMingCuoShiMoneyLabel.textAlignment = NSTextAlignmentRight;
    
    _mobileGPSMoneyLabel = [self setupLabelWithText:@"手机定位费" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _mobileGPSMoneyLabel.textAlignment = NSTextAlignmentRight;
    
    _shiPinMoneyLabel = [self setupLabelWithText:@"视频费" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _shiPinMoneyLabel.textAlignment = NSTextAlignmentRight;
    
    _anJianZiLiaoLabel = [self setupLabelWithText:@"有" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _anJianZiLiaoLabel.textAlignment = NSTextAlignmentRight;
    
    _anJianNoteLabel = [self setupLabelWithText:@"有" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _anJianNoteLabel.textAlignment = NSTextAlignmentRight;
    
    _beiZhuLabel = [self setupLabelWithText:@"1.页面，已发布的公告列表内容排布正常,发布人员等相关信息正确，点击新闻发布跳转到新闻发布页面。 2.内容有效性判断，必填字段不可为空，公告内容中填写特殊字符和html关键字内容提交，显示正确， 3.公告内容预览以及查看时和原格式保持一致。 4.页面按钮功能检测，如各条目的展开和收起，编辑框中上的各页面各按钮如字体选择和段落格式选择切换和基本功能正常，各条目总数统计正常，页码标签跳转正常" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _beiZhuLabel.numberOfLines = 0;

    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.top.left.mas_equalTo(_view).offset(16);
        make.width.mas_equalTo(82);
    }];
    
    [_projectNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label1.mas_top);
        make.left.mas_equalTo(_label1.mas_right).offset(16);
        make.right.mas_equalTo(_view.mas_right).offset(-16);
        
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
  
        make.top.mas_equalTo(_projectNameLabel.mas_bottom).offset(16);
        make.left.mas_equalTo(_label1.mas_left);
        make.width.mas_equalTo(112);
        
    }];
    [_yiWaiShangHaiXianLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label2.mas_centerY);
        make.left.mas_equalTo(_label2.mas_right).offset(16);
        make.right.mas_equalTo(_projectNameLabel.mas_right);
        
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label2.mas_bottom).offset(16);
        make.left.mas_equalTo(_label2.mas_left);
        
    }];
    [_gongShangXianLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label3.mas_centerY);
        make.left.mas_equalTo(_yiWaiShangHaiXianLabel.mas_left);
        make.right.mas_equalTo(_yiWaiShangHaiXianLabel.mas_right);
        
    }];
    
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label3.mas_bottom).offset(16);
        make.left.mas_equalTo(_label3.mas_left);
        
    }];
    [_wenMingCuoShiMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label4.mas_centerY);
        make.left.mas_equalTo(_gongShangXianLabel.mas_left);
        make.right.mas_equalTo(_gongShangXianLabel.mas_right);
        
    }];
    
    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label4.mas_bottom).offset(16);
        make.left.mas_equalTo(_label4.mas_left);
        
    }];
    [_mobileGPSMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label5.mas_centerY);
        make.left.mas_equalTo(_wenMingCuoShiMoneyLabel.mas_left);
        make.right.mas_equalTo(_wenMingCuoShiMoneyLabel.mas_right);
        
    }];
    
    [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label5.mas_bottom).offset(16);
        make.left.mas_equalTo(_label5.mas_left);
        make.width.mas_equalTo(62);
        
    }];
    [_shiPinMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label6.mas_centerY);
        make.left.mas_equalTo(_label6.mas_right).offset(16);
        make.right.mas_equalTo(_mobileGPSMoneyLabel.mas_right);
        
    }];
    
    [_label7 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label6.mas_bottom).offset(16);
        make.left.mas_equalTo(_label6.mas_left);
        make.width.mas_equalTo(124);
        
    }];
    [_anJianZiLiaoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label7.mas_centerY);
        make.left.mas_equalTo(_label7.mas_right).offset(16);
        make.right.mas_equalTo(_shiPinMoneyLabel.mas_right);
        
    }];
    
    [_label8 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label7.mas_bottom).offset(16);
        make.left.mas_equalTo(_label7.mas_left);
        make.width.mas_equalTo(144);
        
    }];
    [_anJianNoteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label8.mas_centerY);
        make.left.mas_equalTo(_label8.mas_right).offset(16);
        make.right.mas_equalTo(_anJianZiLiaoLabel.mas_right);
        
    }];
    
    [_label9 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label8.mas_bottom).offset(16);
        make.left.mas_equalTo(_label8.mas_left);
        
    }];
    [_beiZhuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label9.mas_bottom).offset(16);
        make.left.mas_equalTo(_label9.mas_left);
        make.right.mas_equalTo(_view.mas_right).offset(-16);
        
    }];
    
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_beiZhuLabel.mas_bottom).offset(16);
        
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
