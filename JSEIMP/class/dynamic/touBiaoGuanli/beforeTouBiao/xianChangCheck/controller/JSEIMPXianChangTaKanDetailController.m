//
//  JSEIMPXianChangTaKanDetailController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/9/26.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPXianChangTaKanDetailController.h"
#import <Masonry.h>

@interface JSEIMPXianChangTaKanDetailController ()

@end

@implementation JSEIMPXianChangTaKanDetailController{

    UIScrollView *_scrollView;
    
    UIView *_view;
    
    UILabel *_label1;
    
    UILabel *_label2;
    
    UILabel *_label3;
    
    UILabel *_label4;
    
    UILabel *_label5;
    
    UILabel *_projectNameLabel;
    
    UILabel *_timeLabel;
    
    UILabel *_withPeopleLabel;
    
    UILabel *_checkNoteLabel;
    
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

    _label1 = [self setupLabelWithText:@"项目名称*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _projectNameLabel = [self setupLabelWithText:_projectName Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _projectNameLabel.numberOfLines = 0;
    _projectNameLabel.textAlignment = NSTextAlignmentRight;
    
    _label2 = [self setupLabelWithText:@"参与人*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _withPeopleLabel = [self setupLabelWithText:@"姚辉、陈彬" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _withPeopleLabel.textAlignment = NSTextAlignmentRight;
    
    _label3 = [self setupLabelWithText:@"踏勘日期*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _timeLabel = [self setupLabelWithText:_checkTime Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _timeLabel.textAlignment = NSTextAlignmentRight;
    
    _label4 = [self setupLabelWithText:@"踏勘摘要*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _checkNoteLabel = [self setupLabelWithText:@"1.页面，已发布的公告列表内容排布正常,发布人员等相关信息正确，点击新闻发布跳转到新闻发布页面。 2.内容有效性判断，必填字段不可为空，公告内容中填写特殊字符和html关键字内容提交，显示正确， 3.公告内容预览以及查看时和原格式保持一致。 4.页面按钮功能检测，如各条目的展开和收起，编辑框中上的各页面各按钮如字体选择和段落格式选择切换和基本功能正常，各条目总数统计正常，页码标签跳转正常" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _checkNoteLabel.numberOfLines = 0;
    
    _label5 = [self setupLabelWithText:@"备注*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _beiZhuLabel = [self setupLabelWithText:@"1.页面，已发布的公告列表内容排布正常,发布人员等相关信息正确，点击新闻发布跳转到新闻发布页面。 2.内容有效性判断，必填字段不可为空，公告内容中填写特殊字符和html关键字内容提交，显示正确， 3.公告内容预览以及查看时和原格式保持一致。 4.页面按钮功能检测，如各条目的展开和收起，编辑框中上的各页面各按钮如字体选择和段落格式选择切换和基本功能正常，各条目总数统计正常，页码标签跳转正常" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _beiZhuLabel.numberOfLines = 0;
    
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.mas_equalTo(_view).offset(16);
        
    }];
    [_projectNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label1.mas_top);
        make.left.mas_equalTo(_label1.mas_right).offset(16);
        make.right.mas_equalTo(_view.mas_right).offset(-16);
        
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label1.mas_left);
        make.top.mas_equalTo(_projectNameLabel.mas_bottom).offset(16);
        
    }];
    [_withPeopleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label2.mas_right).offset(16);
        make.centerY.mas_equalTo(_label2.mas_centerY);
        make.right.mas_equalTo(_projectNameLabel.mas_right);
        
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label2.mas_left);
        make.top.mas_equalTo(_label2.mas_bottom).offset(16);
        
    }];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label3.mas_right).offset(16);
        make.centerY.mas_equalTo(_label3.mas_centerY);
        make.right.mas_equalTo(_withPeopleLabel.mas_right);
        
    }];
    
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label3.mas_left);
        make.top.mas_equalTo(_label3.mas_bottom).offset(16);
        
    }];
    
    [_checkNoteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label4.mas_bottom).offset(16);
        make.left.mas_equalTo(_label4.mas_left);
        make.right.mas_equalTo(_timeLabel.mas_right);
        
    }];
    
    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_checkNoteLabel.mas_bottom).offset(16);
        make.left.mas_equalTo(_checkNoteLabel.mas_left);
        
    }];
    
    [_beiZhuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label5.mas_bottom).offset(16);
        make.left.mas_equalTo(_label5.mas_left);
        make.right.mas_equalTo(_checkNoteLabel.mas_right);
        
    }];
    
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_beiZhuLabel.mas_bottom).offset(16);
        
    }];

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
