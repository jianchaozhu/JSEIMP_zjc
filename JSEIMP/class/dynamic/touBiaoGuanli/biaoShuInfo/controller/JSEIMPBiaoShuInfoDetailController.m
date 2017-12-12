//
//  JSEIMPBiaoShuInfoDetailController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/10/13.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPBiaoShuInfoDetailController.h"
#import <Masonry.h>

@interface JSEIMPBiaoShuInfoDetailController ()

@end

@implementation JSEIMPBiaoShuInfoDetailController{

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
    
    UILabel *_label10;
    
    UILabel *_label11;
    
    UILabel *_projectNameLabel;

    UILabel *_projectAdressLabel;
    
    UILabel *_buildCompanyLabel;
    
    UILabel *_guiMoLabel;
    
    UILabel *_ziJinLaiYuanLabel;
    
    UILabel *_zhaoBiaoStyleLabel;
    
    UILabel *_jieShaoRenLabel;
    
    UILabel *_shenQingRenLabel;
    
    UILabel *_heTongStyleLabel;
    
    UILabel *_baoZhengJinLabel;
    
    UILabel *_beiZhuLabel;
    
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
    
    _label1 = [self setupLabelWithText:@"项目名称" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label2 = [self setupLabelWithText:@"项目地址" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label3 = [self setupLabelWithText:@"建设单位" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label4 = [self setupLabelWithText:@"规模(平方米)" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label5 = [self setupLabelWithText:@"资金来源" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label6 = [self setupLabelWithText:@"招标模式" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label7 = [self setupLabelWithText:@"介绍人" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label8 = [self setupLabelWithText:@"申请人" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label9 = [self setupLabelWithText:@"合同形式" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label10 = [self setupLabelWithText:@"保证金" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label11 = [self setupLabelWithText:@"备注" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    
    _projectNameLabel = [self setupLabelWithText:_projectName TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _projectNameLabel.numberOfLines = 0;
    _projectNameLabel.textAlignment = NSTextAlignmentRight;
    
    _projectAdressLabel = [self setupLabelWithText:@"锡东新城商务区新华路北、润锡路东" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _projectAdressLabel.numberOfLines = 0;
    _projectAdressLabel.textAlignment = NSTextAlignmentRight;
    
    _buildCompanyLabel = [self setupLabelWithText:@"无锡市碧桂园房地产开发有限公司" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _buildCompanyLabel.numberOfLines = 0;
    _buildCompanyLabel.textAlignment = NSTextAlignmentRight;
    
    _guiMoLabel = [self setupLabelWithText:_guiMo TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _guiMoLabel.textAlignment = NSTextAlignmentRight;
    
    _ziJinLaiYuanLabel = [self setupLabelWithText:_ziJinLaiYuan TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _ziJinLaiYuanLabel.textAlignment = NSTextAlignmentRight;
    _ziJinLaiYuanLabel.numberOfLines = 0;
    
    _zhaoBiaoStyleLabel = [self setupLabelWithText:@"邀请招标" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _zhaoBiaoStyleLabel.textAlignment = NSTextAlignmentRight;
    
    _jieShaoRenLabel = [self setupLabelWithText:@"介绍人" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _jieShaoRenLabel.textAlignment = NSTextAlignmentRight;
    
    _shenQingRenLabel = [self setupLabelWithText:@"申请人" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _shenQingRenLabel.textAlignment = NSTextAlignmentRight;
    
    _heTongStyleLabel = [self setupLabelWithText:@"合同形式" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _heTongStyleLabel.textAlignment = NSTextAlignmentRight;
    
    _baoZhengJinLabel = [self setupLabelWithText:@"保证金" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _baoZhengJinLabel.textAlignment = NSTextAlignmentRight;
    
    _beiZhuLabel = [self setupLabelWithText:@"1.页面，已发布的公告列表内容排布正常,发布人员等相关信息正确，点击新闻发布跳转到新闻发布页面。 2.内容有效性判断，必填字段不可为空，公告内容中填写特殊字符和html关键字内容提交，显示正确， 3.公告内容预览以及查看时和原格式保持一致。 4.页面按钮功能检测，如各条目的展开和收起，编辑框中上的各页面各按钮如字体选择和段落格式选择切换和基本功能正常，各条目总数统计正常，页码标签跳转正常" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _beiZhuLabel.numberOfLines = 0;

    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.mas_equalTo(_view).offset(16);
        make.width.mas_equalTo(82);
    }];
    [_projectNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label1.mas_right).offset(16);
        make.right.mas_equalTo(_view.mas_right).offset(-16);
        make.top.mas_equalTo(_label1.mas_top);
        
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label1.mas_left);
        make.top.mas_equalTo(_projectNameLabel.mas_bottom).offset(16);
        
    }];
    [_projectAdressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_projectNameLabel.mas_left);
        make.right.mas_equalTo(_projectNameLabel.mas_right);
        make.top.mas_equalTo(_label2.mas_top);
        
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label2.mas_left);
        make.top.mas_equalTo(_projectAdressLabel.mas_bottom).offset(16);
        
    }];
    [_buildCompanyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_projectAdressLabel.mas_left);
        make.right.mas_equalTo(_projectAdressLabel.mas_right);
        make.top.mas_equalTo(_label3.mas_top);
        
    }];
    
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label3.mas_left);
        make.top.mas_equalTo(_buildCompanyLabel.mas_bottom).offset(16);
        make.width.mas_equalTo(116);
        
    }];
    [_guiMoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label4.mas_centerY);
        make.left.mas_equalTo(_label4.mas_right).offset(16);
        make.right.mas_equalTo(_buildCompanyLabel.mas_right);
        
    }];
    
    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label4.mas_left);
        make.top.mas_equalTo(_label4.mas_bottom).offset(16);
        
    }];
    [_ziJinLaiYuanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label5.mas_top);
        make.left.mas_equalTo(_buildCompanyLabel.mas_left);
        make.right.mas_equalTo(_buildCompanyLabel.mas_right);
        
    }];
    
    [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label5.mas_left);
        make.top.mas_equalTo(_ziJinLaiYuanLabel.mas_bottom).offset(16);
        
    }];
    [_zhaoBiaoStyleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label6.mas_centerY);
        make.left.mas_equalTo(_ziJinLaiYuanLabel.mas_left);
        make.right.mas_equalTo(_ziJinLaiYuanLabel.mas_right);
        
    }];
    
    [_label7 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label6.mas_left);
        make.top.mas_equalTo(_label6.mas_bottom).offset(16);
        make.width.mas_equalTo(62);
    }];
    [_jieShaoRenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label7.mas_centerY);
        make.left.mas_equalTo(_label7.mas_right).offset(16);
        make.right.mas_equalTo(_zhaoBiaoStyleLabel.mas_right);
        
    }];
    
    [_label8 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label7.mas_left);
        make.top.mas_equalTo(_label7.mas_bottom).offset(16);
        
    }];
    [_shenQingRenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label8.mas_centerY);
        make.left.mas_equalTo(_jieShaoRenLabel.mas_left);
        make.right.mas_equalTo(_jieShaoRenLabel.mas_right);
        
    }];
    
    [_label9 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label8.mas_left);
        make.top.mas_equalTo(_label8.mas_bottom).offset(16);
        
    }];
    [_heTongStyleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label9.mas_centerY);
        make.left.mas_equalTo(_zhaoBiaoStyleLabel.mas_left);
        make.right.mas_equalTo(_zhaoBiaoStyleLabel.mas_right);
        
    }];
    
    [_label10 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label9.mas_left);
        make.top.mas_equalTo(_label9.mas_bottom).offset(16);
        
    }];
    [_baoZhengJinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label10.mas_centerY);
        make.left.mas_equalTo(_shenQingRenLabel.mas_left);
        make.right.mas_equalTo(_shenQingRenLabel.mas_right);
        
    }];
    
    [_label11 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label10.mas_left);
        make.top.mas_equalTo(_label10.mas_bottom).offset(16);
        
    }];
    [_beiZhuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label11.mas_bottom).offset(16);
        make.left.mas_equalTo(_label11.mas_left);
        make.right.mas_equalTo(_baoZhengJinLabel.mas_right);
        
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
