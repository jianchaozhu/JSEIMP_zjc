//
//  JSEIMPQualityCheckDetailController.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/1/5.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPQualityCheckDetailController.h"
#import <Masonry.h>

#define UIScreenW [UIScreen mainScreen].bounds.size.width
#define UIScreenH [UIScreen mainScreen].bounds.size.height

@interface JSEIMPQualityCheckDetailController ()

@end

@implementation JSEIMPQualityCheckDetailController{
    
    UIScrollView *_scrollView;
    
    UIView *_view;
    
    UILabel *_label1;
    
    UILabel *_danHaoLabel;
    
    UILabel *_label2;
    
    UILabel *_checkRenLabel;
    
    UILabel *_label3;
    
    UILabel *_checkDateLabel;
    
    UILabel *_label4;
    
    UILabel *_projectNameLabel;
    
    UILabel *_label5;
    
    UILabel *_zhengGaiRenLabel;
    
    UILabel *_label6;
    
    UILabel *_zhengGaiDateLabel;
    
    UILabel *_label7;
    
    UILabel *_checkContentLabel;
    
    UILabel *_label8;
    
    UILabel *_cunZaiYinHuanLabel;
    
    UILabel *_label9;
    
    UILabel *_zhengGaiWayLabel;
    
    UILabel *_label10;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
    UILabel *titleViewLabel = [[UILabel alloc] init];
    titleViewLabel.frame = CGRectMake(0, 0, 180, 40);
    titleViewLabel.numberOfLines = 0;
    titleViewLabel.font = [UIFont boldSystemFontOfSize:16];
    titleViewLabel.text = [NSString stringWithFormat:@"整改单详情(%@)",_buildingName];
    titleViewLabel.textAlignment = NSTextAlignmentCenter;
    
    self.navigationItem.titleView = titleViewLabel;
    
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
    
    _label1 = [self setupLabelWithText:@"单号" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _danHaoLabel = [self setupLabelWithText:_danHao TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _danHaoLabel.textAlignment = NSTextAlignmentRight;
    
    _label2 = [self setupLabelWithText:@"检查人" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _checkRenLabel = [self setupLabelWithText:@"检查人是xxx" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _checkRenLabel.textAlignment = NSTextAlignmentRight;
    
    _label3 = [self setupLabelWithText:@"检查日期" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _checkDateLabel = [self setupLabelWithText:@"2017-12-14" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _checkDateLabel.textAlignment = NSTextAlignmentRight;
    
    _label4 = [self setupLabelWithText:@"项目名称" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _projectNameLabel = [self setupLabelWithText:_projectName TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _projectNameLabel.textAlignment = NSTextAlignmentRight;
    
    _label5 = [self setupLabelWithText:@"责任整改人" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _zhengGaiRenLabel = [self setupLabelWithText:_zhengGaiRen TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _zhengGaiRenLabel.textAlignment = NSTextAlignmentRight;
    
    _label6 = [self setupLabelWithText:@"要求整改时间" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _zhengGaiDateLabel = [self setupLabelWithText:@"2017-12-13" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _zhengGaiDateLabel.textAlignment = NSTextAlignmentRight;
    
    _label7 = [self setupLabelWithText:@"检查内容" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _checkContentLabel = [self setupLabelWithText:@"检查内容是xxx检查内容是xxx检查内容是xxx检查内容是xxx检查内容是xxx检查内容是xxx检查内容是xxx检查内容是xxx检查内容是xxx" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _checkContentLabel.numberOfLines = 0;
    
    _label8 = [self setupLabelWithText:@"存在隐患" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _cunZaiYinHuanLabel = [self setupLabelWithText:@"存在隐患是xxx存在隐患是xxx存在隐患是xxx存在隐患是xxx存在隐患是xxx存在隐患是xxx存在隐患是xxx存在隐患是xxx存在隐患是xxx" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _cunZaiYinHuanLabel.numberOfLines = 0;
    
    _label9 = [self setupLabelWithText:@"整改措施" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _zhengGaiWayLabel = [self setupLabelWithText:@"整改措施是xxx整改措施是xxx整改措施是xxx整改措施是xxx整改措施是xxx整改措施是xxx整改措施是xxx整改措施是xxx整改措施是xxx" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _zhengGaiWayLabel.numberOfLines = 0;
    
    _label10 = [self setupLabelWithText:@"模型快照" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.mas_equalTo(_view).offset(16);
        make.width.mas_equalTo(42);
    }];
    [_danHaoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label1.mas_right).offset(16);
        make.centerY.mas_equalTo(_label1.mas_centerY);
        make.right.mas_equalTo(_view.mas_right).offset(-16);
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label1.mas_bottom).offset(16);
        make.left.mas_equalTo(_label1.mas_left);
        make.width.mas_equalTo(62);
    }];
    [_checkRenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label2.mas_right).offset(16);
        make.centerY.mas_equalTo(_label2.mas_centerY);
        make.right.mas_equalTo(_danHaoLabel.mas_right);
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label2.mas_bottom).offset(16);
        make.left.mas_equalTo(_label2.mas_left);
        make.width.mas_equalTo(82);
    }];
    [_checkDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label3.mas_right).offset(16);
        make.centerY.mas_equalTo(_label3.mas_centerY);
        make.right.mas_equalTo(_checkRenLabel.mas_right);
    }];
    
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label3.mas_bottom).offset(16);
        make.left.mas_equalTo(_label3.mas_left);
        make.right.mas_equalTo(_label3.mas_right);
    }];
    [_projectNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label4.mas_right).offset(16);
        make.centerY.mas_equalTo(_label4.mas_centerY);
        make.right.mas_equalTo(_checkDateLabel.mas_right);
    }];
    
    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_projectNameLabel.mas_bottom).offset(16);
        make.left.mas_equalTo(_label4.mas_left);
        make.width.mas_equalTo(102);
    }];
    [_zhengGaiRenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label5.mas_right).offset(16);
        make.centerY.mas_equalTo(_label5.mas_centerY);
        make.right.mas_equalTo(_projectNameLabel.mas_right);
    }];
    
    [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label5.mas_bottom).offset(16);
        make.left.mas_equalTo(_label5.mas_left);
        make.width.mas_equalTo(124);
    }];
    [_zhengGaiDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label6.mas_right).offset(16);
        make.centerY.mas_equalTo(_label6.mas_centerY);
        make.right.mas_equalTo(_zhengGaiRenLabel.mas_right);
    }];
    
    [_label7 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label6.mas_bottom).offset(16);
        make.left.mas_equalTo(_label6.mas_left);
        make.right.mas_equalTo(_label4.mas_right);
    }];
    [_checkContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label7.mas_left);
        make.top.mas_equalTo(_label7.mas_bottom).offset(16);
        make.right.mas_equalTo(_zhengGaiDateLabel.mas_right);
    }];
    
    [_label8 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_checkContentLabel.mas_bottom).offset(16);
        make.left.mas_equalTo(_checkContentLabel.mas_left);
        make.right.mas_equalTo(_label7.mas_right);
    }];
    [_cunZaiYinHuanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label8.mas_left);
        make.top.mas_equalTo(_label8.mas_bottom).offset(16);
        make.right.mas_equalTo(_checkContentLabel.mas_right);
    }];
    
    [_label9 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_cunZaiYinHuanLabel.mas_bottom).offset(16);
        make.left.mas_equalTo(_cunZaiYinHuanLabel.mas_left);
        make.right.mas_equalTo(_label8.mas_right);
    }];
    [_zhengGaiWayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label9.mas_left);
        make.top.mas_equalTo(_label9.mas_bottom).offset(16);
        make.right.mas_equalTo(_cunZaiYinHuanLabel.mas_right);
    }];
    
    [_label10 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_zhengGaiWayLabel.mas_bottom).offset(16);
        make.left.mas_equalTo(_zhengGaiWayLabel.mas_left);
        make.right.mas_equalTo(_label9.mas_right);
    }];
    
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo(UIScreenW);
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
