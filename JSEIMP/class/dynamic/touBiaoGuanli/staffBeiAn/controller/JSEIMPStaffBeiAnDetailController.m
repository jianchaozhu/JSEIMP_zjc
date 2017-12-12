//
//  JSEIMPStaffBeiAnDetailController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/10/20.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPStaffBeiAnDetailController.h"
#import <Masonry.h>

@interface JSEIMPStaffBeiAnDetailController ()

@end

@implementation JSEIMPStaffBeiAnDetailController{

    UIScrollView *_scrollView;
    
    UIView *_view;
    
    UILabel *_label1;
    
    UILabel *_bianMaLabel;
    
    UILabel *_label2;
    
    UILabel *_projectNameLabel;
    
    UILabel *_label3;
    
    UILabel *_projectManagerLabel;
    
    UILabel *_label4;
    
    UILabel *_jiShuLeaderLabel;
    
    UILabel *_label5;
    
    UILabel *_shiGongYuanLabel;
    
    UILabel *_label6;
    
    UILabel *_zhiLiangYuanLabel;
    
    UILabel *_label7;
    
    UILabel *_anQuanYuanLabel;
    
    UILabel *_label8;
    
    UILabel *_caiLiaoYuanLabel;
    
    UILabel *_label9;
    
    UILabel *_ziLiaoYuanLabel;
    
    UILabel *_label10;
    
    UILabel *_yuSuanYuanLabel;
    
    UILabel *_label11;
    
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

    _label1 = [self setupLabelWithText:@"编码" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _bianMaLabel = [self setupLabelWithText:_bianHaoName TextColor:[UIColor darkGrayColor] Font:[UIFont boldSystemFontOfSize:16]];
    _bianMaLabel.textAlignment = NSTextAlignmentRight;
    
    _label2 = [self setupLabelWithText:@"项目名称" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _projectNameLabel = [self setupLabelWithText:_projectName TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _projectNameLabel.numberOfLines = 0;
    _projectNameLabel.textAlignment = NSTextAlignmentRight;
    
    _label3 = [self setupLabelWithText:@"项目经理" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _projectManagerLabel = [self setupLabelWithText:@"项目经理" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _projectManagerLabel.textAlignment = NSTextAlignmentRight;
    
    _label4 = [self setupLabelWithText:@"技术负责人" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _jiShuLeaderLabel = [self setupLabelWithText:@"技术负责人" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _jiShuLeaderLabel.textAlignment = NSTextAlignmentRight;
    
    _label5 = [self setupLabelWithText:@"施工员" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _shiGongYuanLabel = [self setupLabelWithText:@"施工员" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _shiGongYuanLabel.textAlignment = NSTextAlignmentRight;
    
    _label6 = [self setupLabelWithText:@"质量员" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _zhiLiangYuanLabel = [self setupLabelWithText:@"质量员" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _zhiLiangYuanLabel.textAlignment = NSTextAlignmentRight;
    
    _label7 = [self setupLabelWithText:@"安全员" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _anQuanYuanLabel = [self setupLabelWithText:@"安全员" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _anQuanYuanLabel.textAlignment = NSTextAlignmentRight;
    
    _label8 = [self setupLabelWithText:@"材料员" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _caiLiaoYuanLabel = [self setupLabelWithText:@"材料员" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _caiLiaoYuanLabel.textAlignment = NSTextAlignmentRight;
    
    _label9 = [self setupLabelWithText:@"资料员" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _ziLiaoYuanLabel = [self setupLabelWithText:@"资料员" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _ziLiaoYuanLabel.textAlignment = NSTextAlignmentRight;
    
    _label10 = [self setupLabelWithText:@"预算员" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _yuSuanYuanLabel = [self setupLabelWithText:@"预算员" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _yuSuanYuanLabel.textAlignment = NSTextAlignmentRight;
    
    _label11 = [self setupLabelWithText:@"备注" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _beiZhuLabel = [self setupLabelWithText:@"1.页面，已发布的公告列表内容排布正常,发布人员等相关信息正确，点击新闻发布跳转到新闻发布页面。 2.内容有效性判断，必填字段不可为空，公告内容中填写特殊字符和html关键字内容提交，显示正确， 3.公告内容预览以及查看时和原格式保持一致。 4.页面按钮功能检测，如各条目的展开和收起，编辑框中上的各页面各按钮如字体选择和段落格式选择切换和基本功能正常，各条目总数统计正常，页码标签跳转正常" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _beiZhuLabel.numberOfLines = 0;
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_view.mas_top).offset(16);
        make.left.mas_equalTo(_view.mas_left).offset(16);
        make.width.mas_equalTo(42);
        
    }];
    [_bianMaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label1.mas_centerY);
        make.right.mas_equalTo(_view.mas_right).offset(-16);
        make.left.mas_equalTo(_label1.mas_right).offset(16);
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
        
    }];
    [_projectManagerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label3.mas_centerY);
        make.right.mas_equalTo(_projectNameLabel.mas_right);
        make.left.mas_equalTo(_projectNameLabel.mas_left);
        
    }];
    
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label3.mas_left);
        make.top.mas_equalTo(_label3.mas_bottom).offset(16);
        make.width.mas_equalTo(102);
    }];
    [_jiShuLeaderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label4.mas_centerY);
        make.left.mas_equalTo(_label4.mas_right).offset(-16);
        make.right.mas_equalTo(_projectManagerLabel.mas_right);
        
    }];
    
    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label4.mas_left);
        make.top.mas_equalTo(_label4.mas_bottom).offset(16);
        
    }];
    [_shiGongYuanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label5.mas_centerY);
        make.right.mas_equalTo(_jiShuLeaderLabel.mas_right);
        make.left.mas_equalTo(_label5.mas_right).offset(16);
        make.width.mas_equalTo(60);
        
    }];
    
    [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label5.mas_left);
        make.top.mas_equalTo(_label5.mas_bottom).offset(16);
        
    }];
    [_zhiLiangYuanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label6.mas_centerY);
        make.right.mas_equalTo(_shiGongYuanLabel.mas_right);
        make.left.mas_equalTo(_shiGongYuanLabel.mas_left);
        
    }];
    
    [_label7 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label6.mas_left);
        make.top.mas_equalTo(_label6.mas_bottom).offset(16);
        
    }];
    [_anQuanYuanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label7.mas_centerY);
        make.right.mas_equalTo(_zhiLiangYuanLabel.mas_right);
        make.left.mas_equalTo(_zhiLiangYuanLabel.mas_left);
        
    }];
    
    [_label8 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label7.mas_left);
        make.top.mas_equalTo(_label7.mas_bottom).offset(16);
        
    }];
    [_caiLiaoYuanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label8.mas_centerY);
        make.right.mas_equalTo(_anQuanYuanLabel.mas_right);
        make.left.mas_equalTo(_anQuanYuanLabel.mas_left);
        
    }];
    
    [_label9 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label8.mas_left);
        make.top.mas_equalTo(_label8.mas_bottom).offset(16);
        
    }];
    [_ziLiaoYuanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label9.mas_centerY);
        make.right.mas_equalTo(_caiLiaoYuanLabel.mas_right);
        make.left.mas_equalTo(_caiLiaoYuanLabel.mas_left);
        
    }];
    
    [_label10 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label9.mas_left);
        make.top.mas_equalTo(_label9.mas_bottom).offset(16);
        
    }];
    [_yuSuanYuanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label10.mas_centerY);
        make.right.mas_equalTo(_ziLiaoYuanLabel.mas_right);
        make.left.mas_equalTo(_ziLiaoYuanLabel.mas_left);
        
    }];
    
    [_label11 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label10.mas_bottom).offset(16);
        make.left.mas_equalTo(_label10.mas_left);
        
    }];
    [_beiZhuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label11.mas_bottom).offset(16);
        make.left.mas_equalTo(_label11.mas_left);
        make.right.mas_equalTo(_yuSuanYuanLabel.mas_right);
        
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
