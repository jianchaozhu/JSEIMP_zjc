//
//  JSProjectCheckDetailController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/9/22.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSProjectCheckDetailController.h"
#import <Masonry.h>

@interface JSProjectCheckDetailController ()

@end

@implementation JSProjectCheckDetailController{

    UIScrollView *_scrollView;
    
    UIView *_view;
    
    UILabel *_label1;
    
    UILabel *_checkProjectLabel;
    
    UILabel *_label2;
    
    UILabel *_label3;
    
    UILabel *_label4;
    
    UILabel *_label5;
    
    UILabel *_label6;
    
    UILabel *_label7;
    
    UILabel *_ziLiaoLabel;
    
    UILabel *_label8;
    
    UILabel *_beiZhuLabel;
    
    UILabel *_checkTimeLabel;
    
    UILabel *_checkPeopleLabel;
    
    UILabel *_checkPeoplePositionLabel;
    
    UILabel *_withPeopleLabel;
    
    UILabel *_carLabel;
    
    UILabel *_zhunBeiZiliaoLabel;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = _projectName;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
    [self setupUI];
    
}

-(void)setupUI{

    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:_scrollView];
    
    _view = [[UIView alloc] initWithFrame:_scrollView.bounds];
    
    _view.backgroundColor = [UIColor whiteColor];
    
    [_scrollView addSubview:_view];
    
    _label1 = [self setupLabelWithText:@"考察项目" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    
    _checkProjectLabel = [self setupLabelWithText:_projectName Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _checkProjectLabel.numberOfLines = 0;
    _checkProjectLabel.textAlignment = NSTextAlignmentRight;
    
    _label2 = [self setupLabelWithText:@"考察日期" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _checkTimeLabel = [self setupLabelWithText:_checkTime Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _label3 = [self setupLabelWithText:@"考察人" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _checkPeopleLabel = [self setupLabelWithText:@"阮美琴" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _label4 = [self setupLabelWithText:@"考察人职务" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _checkPeoplePositionLabel = [self setupLabelWithText:@"集团执行总裁" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _label5 = [self setupLabelWithText:@"陪同人员" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _withPeopleLabel = [self setupLabelWithText:@"姚辉" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _label6 = [self setupLabelWithText:@"车辆" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _carLabel = [self setupLabelWithText:@"车辆" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _label7 = [self setupLabelWithText:@"准备资料" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    
    _ziLiaoLabel = [self setupLabelWithText:@"1.页面，已发布的公告列表内容排布正常,发布人员等相关信息正确，点击新闻发布跳转到新闻发布页面。 2.内容有效性判断，必填字段不可为空，公告内容中填写特殊字符和html关键字内容提交，显示正确， 3.公告内容预览以及查看时和原格式保持一致。 4.页面按钮功能检测，如各条目的展开和收起，编辑框中上的各页面各按钮如字体选择和段落格式选择切换和基本功能正常，各条目总数统计正常，页码标签跳转正常" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _ziLiaoLabel.numberOfLines = 0;
    
    _label8 = [self setupLabelWithText:@"备注" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _beiZhuLabel = [self setupLabelWithText:@"1.页面，已发布的公告列表内容排布正常,发布人员等相关信息正确，点击新闻发布跳转到新闻发布页面。 2.内容有效性判断，必填字段不可为空，公告内容中填写特殊字符和html关键字内容提交，显示正确， 3.公告内容预览以及查看时和原格式保持一致。 4.页面按钮功能检测，如各条目的展开和收起，编辑框中上的各页面各按钮如字体选择和段落格式选择切换和基本功能正常，各条目总数统计正常，页码标签跳转正常" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _beiZhuLabel.numberOfLines = 0;
    
    
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.mas_equalTo(_view).offset(16);
        
    }];
    
    [_checkProjectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label1.mas_top);
        make.left.mas_equalTo(_label1.mas_right).offset(16);
        make.right.mas_equalTo(_view.mas_right).offset(-16);
        
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_checkProjectLabel.mas_bottom).offset(16);
        make.left.mas_equalTo(_label1.mas_left);
        
    }];
    
    [_checkTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label2.mas_centerY);
        make.right.mas_equalTo(_checkProjectLabel.mas_right);
        
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label2.mas_bottom).offset(16);
        make.left.mas_equalTo(_label2.mas_left);
       
    }];
    
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label3.mas_bottom).offset(16);
        make.left.mas_equalTo(_label3.mas_left);
        
    }];

    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label4.mas_bottom).offset(16);
        make.left.mas_equalTo(_label4.mas_left);
        
    }];
    
    [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label5.mas_bottom).offset(16);
        make.left.mas_equalTo(_label5.mas_left);
        
    }];
    
    [_label7 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label6.mas_bottom).offset(16);
        make.left.mas_equalTo(_label6.mas_left);
        
    }];
    
    [_ziLiaoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label7.mas_bottom).offset(16);
        make.left.mas_equalTo(_label7.mas_left);
        make.right.mas_equalTo(_carLabel.mas_right);
        
    }];
    
    [_label8 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_ziLiaoLabel.mas_bottom).offset(16);
        make.left.mas_equalTo(_ziLiaoLabel.mas_left);
        
    }];
    
    [_beiZhuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label8.mas_bottom).offset(16);
        make.left.mas_equalTo(_label8.mas_left);
        make.right.mas_equalTo(_ziLiaoLabel.mas_right);
        
    }];
    
    
    [_checkPeopleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label3.mas_centerY);
        make.right.mas_equalTo(_checkTimeLabel.mas_right);
        
    }];
    
    [_checkPeoplePositionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label4.mas_centerY);
        make.right.mas_equalTo(_checkPeopleLabel.mas_right);
        
    }];
    
    [_withPeopleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label5.mas_centerY);
        make.right.mas_equalTo(_checkPeoplePositionLabel.mas_right);
        
    }];
    
    [_carLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label6.mas_centerY);
        make.right.mas_equalTo(_withPeopleLabel.mas_right);
        
    }];
    
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_beiZhuLabel.mas_bottom).offset(16);
        
    }];
    
}

- (void)returnAction {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(UILabel *)setupLabelWithText:(NSString *)text Font:(UIFont *)font TextColor:(UIColor *)textColor{

    UILabel *label = [[UILabel alloc] init];
    
    label.text = text;
    label.font = font;
    label.textColor = textColor;
    
    [_view addSubview:label];
    
    return label;

}

@end
