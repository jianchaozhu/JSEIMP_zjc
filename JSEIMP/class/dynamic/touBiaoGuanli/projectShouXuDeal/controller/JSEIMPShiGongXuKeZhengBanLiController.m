//
//  JSEIMPShiGongXuKeZhengBanLiController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/10/17.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPShiGongXuKeZhengBanLiController.h"
#import <Masonry.h>

@interface JSEIMPShiGongXuKeZhengBanLiController ()

@end

@implementation JSEIMPShiGongXuKeZhengBanLiController{

    UIScrollView *_scrollView;
    
    UIView *_view;

    UILabel *_label1;
    
    UILabel *_label2;
    
    UILabel *_label3;
    
    UILabel *_label4;
    
    UILabel *_projectNameLabel;
    
    UILabel *_endDateLabel;
    
    UILabel *_xuKeZhengLabel;
    
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
    _label2 = [self setupLabelWithText:@"办理完结时间" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label3 = [self setupLabelWithText:@"有无许可证" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label4 = [self setupLabelWithText:@"备注" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    
    _projectNameLabel = [self setupLabelWithText:_projectName TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _projectNameLabel.numberOfLines = 0;
    _projectNameLabel.textAlignment = NSTextAlignmentRight;
    
    _endDateLabel = [self setupLabelWithText:@"2017-05-15 00:00:00" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:15]];
    _endDateLabel.textAlignment = NSTextAlignmentRight;
    
    _xuKeZhengLabel = [self setupLabelWithText:@"有" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _xuKeZhengLabel.textAlignment = NSTextAlignmentRight;
    
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
        
        make.left.mas_equalTo(_label1.mas_left);
        make.top.mas_equalTo(_projectNameLabel.mas_bottom).offset(16);
        make.width.mas_equalTo(126);
        
    }];
    [_endDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label2.mas_centerY);
        make.left.mas_equalTo(_label2.mas_right).offset(8);
        make.right.mas_equalTo(_projectNameLabel.mas_right);
        
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label2.mas_left);
        make.top.mas_equalTo(_label2.mas_bottom).offset(16);
        make.width.mas_equalTo(112);
        
    }];
    [_xuKeZhengLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label3.mas_centerY);
        make.left.mas_equalTo(_label3.mas_right).offset(16);
        make.right.mas_equalTo(_endDateLabel.mas_right);
        
    }];
    
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label3.mas_left);
        make.top.mas_equalTo(_label3.mas_bottom).offset(16);
        
    }];
    [_beiZhuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label4.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_label4.mas_centerX);
        make.left.mas_equalTo(_view.mas_left).offset(16);
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
