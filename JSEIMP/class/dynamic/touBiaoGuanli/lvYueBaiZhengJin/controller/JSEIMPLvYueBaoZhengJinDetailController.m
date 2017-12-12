//
//  JSEIMPLvYueBaoZhengJinDetailController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/10/12.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPLvYueBaoZhengJinDetailController.h"
#import <Masonry.h>

@interface JSEIMPLvYueBaoZhengJinDetailController ()

@end

@implementation JSEIMPLvYueBaoZhengJinDetailController{

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
    
    UILabel *_projectLabel;
    
    UILabel *_heTongValueLabel;
    
    UILabel *_baoHanBiLiLabel;

    UILabel *_baoZhengJinStyleLabel;
    
    UILabel *_bankLabel;
    
    UILabel *_payDateLabel;
    
    UILabel *_projectBeginDateLabel;
    
    UILabel *_projectJunGongDateLabel;
    
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
    _label2 = [self setupLabelWithText:@"合同总价(万元)" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label3 = [self setupLabelWithText:@"保函比例" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label4 = [self setupLabelWithText:@"保证金形式" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label5 = [self setupLabelWithText:@"办理银行" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label6 = [self setupLabelWithText:@"缴纳日期" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label7 = [self setupLabelWithText:@"项目开工时间" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label8 = [self setupLabelWithText:@"项目竣工时间" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label9 = [self setupLabelWithText:@"备注" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    
    
    _projectLabel = [self setupLabelWithText:_projectName TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _projectLabel.textAlignment = NSTextAlignmentRight;
    
    _heTongValueLabel = [self setupLabelWithText:_heTongValue TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _heTongValueLabel.textAlignment = NSTextAlignmentRight;
    
    _baoHanBiLiLabel = [self setupLabelWithText:@"20%" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _baoHanBiLiLabel.textAlignment = NSTextAlignmentRight;
    
    _baoZhengJinStyleLabel = [self setupLabelWithText:@"履约保函" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _baoZhengJinStyleLabel.textAlignment = NSTextAlignmentRight;
    
    _bankLabel = [self setupLabelWithText:@"中国建设银行黄渡分行" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _bankLabel.numberOfLines = 0;
    _bankLabel.textAlignment = NSTextAlignmentRight;
    
    _payDateLabel = [self setupLabelWithText:@"2017-08-06" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _payDateLabel.textAlignment = NSTextAlignmentRight;
    
    _projectBeginDateLabel = [self setupLabelWithText:@"2017-08-10" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _projectBeginDateLabel.textAlignment = NSTextAlignmentRight;
    
    _projectJunGongDateLabel = [self setupLabelWithText:@"2017-10-10" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _projectJunGongDateLabel.textAlignment = NSTextAlignmentRight;
    
    _beiZhuLabel = [self setupLabelWithText:@"1.页面，已发布的公告列表内容排布正常,发布人员等相关信息正确，点击新闻发布跳转到新闻发布页面。 2.内容有效性判断，必填字段不可为空，公告内容中填写特殊字符和html关键字内容提交，显示正确， 3.公告内容预览以及查看时和原格式保持一致。 4.页面按钮功能检测，如各条目的展开和收起，编辑框中上的各页面各按钮如字体选择和段落格式选择切换和基本功能正常，各条目总数统计正常，页码标签跳转正常" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _beiZhuLabel.numberOfLines = 0;
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.mas_equalTo(_view).offset(16);
        make.width.mas_equalTo(82);
        
    }];
    [_projectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label1.mas_top);
        make.left.mas_equalTo(_label1.mas_right).offset(16);
        make.right.mas_equalTo(_view.mas_right).offset(-16);
        
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_projectLabel.mas_bottom).offset(16);
        make.left.mas_equalTo(_label1.mas_left);
        make.width.mas_equalTo(138);
        
    }];
    [_heTongValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label2.mas_right).offset(16);
        make.centerY.mas_equalTo(_label2.mas_centerY);
        make.right.mas_equalTo(_projectLabel.mas_right);
        
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label2.mas_bottom).offset(16);
        make.left.mas_equalTo(_label2.mas_left);
        
    }];
    [_baoHanBiLiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_projectLabel.mas_left);
        make.centerY.mas_equalTo(_label3.mas_centerY);
        make.right.mas_equalTo(_projectLabel.mas_right);
        
    }];
    
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label3.mas_bottom).offset(16);
        make.left.mas_equalTo(_label3.mas_left);
        make.width.mas_equalTo(102);
        
    }];
    [_baoZhengJinStyleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label4.mas_right).offset(16);
        make.centerY.mas_equalTo(_label4.mas_centerY);
        make.right.mas_equalTo(_baoHanBiLiLabel.mas_right);
        
    }];
    
    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label4.mas_bottom).offset(16);
        make.left.mas_equalTo(_label4.mas_left);
        
    }];
    [_bankLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_baoHanBiLiLabel.mas_left);
        make.top.mas_equalTo(_label5.mas_top);
        make.right.mas_equalTo(_baoHanBiLiLabel.mas_right);
        
    }];
    
    [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_bankLabel.mas_bottom).offset(16);
        make.left.mas_equalTo(_label5.mas_left);
        
    }];
    [_payDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_bankLabel.mas_left);
        make.centerY.mas_equalTo(_label6.mas_centerY);
        make.right.mas_equalTo(_bankLabel.mas_right);
        
    }];
    
    [_label7 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label6.mas_bottom).offset(16);
        make.left.mas_equalTo(_label6.mas_left);
        make.width.mas_equalTo(124);
        
    }];
    [_projectBeginDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label7.mas_right).offset(16);
        make.centerY.mas_equalTo(_label7.mas_centerY);
        make.right.mas_equalTo(_payDateLabel.mas_right);
        
    }];
    
    [_label8 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label7.mas_bottom).offset(16);
        make.left.mas_equalTo(_label7.mas_left);
        
    }];
    [_projectJunGongDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_projectBeginDateLabel.mas_left);
        make.centerY.mas_equalTo(_label8.mas_centerY);
        make.right.mas_equalTo(_projectBeginDateLabel.mas_right);
        
    }];
    
    [_label9 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label8.mas_bottom).offset(16);
        make.left.mas_equalTo(_label8.mas_left);
        
    }];
    [_beiZhuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label9.mas_bottom).offset(16);
        make.left.mas_equalTo(_label9.mas_left);
        make.right.mas_equalTo(_projectBeginDateLabel.mas_right);
        
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
