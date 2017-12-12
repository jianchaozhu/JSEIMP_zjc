//
//  JSEIMPQualityTargetDetailController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/11/21.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPQualityTargetDetailController.h"
#import <Masonry.h>

@interface JSEIMPQualityTargetDetailController ()

@end

@implementation JSEIMPQualityTargetDetailController{

    UIScrollView *_scrollView;
    
    UIView *_view;
    
    UILabel *_label1;
    
    UILabel *_bianHaoLabel;
    
    UILabel *_label2;
    
    UILabel *_projectNameLabel;
    
    UILabel *_label3;
    
    UILabel *_heTongTargetLabel;
    
    UILabel *_label4;
    
    UILabel *_qiYeChuangYouTargetLabel;

    UILabel *_label5;
    
    UILabel *_shenBaoDateLabel;

    UILabel *_label6;
    
    UILabel *_shiXianDateLabel;
    
    UILabel *_label7;
    
    UILabel *_zeRenManLabel;
    
    UILabel *_label8;
    
    UILabel *_statusLabel;
    
    UILabel *_label9;
    
    UILabel *_createPeopleLabel;
    
    UILabel *_label10;
    
    UILabel *_luRuDateLabel;
    
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
    
    _label1 = [self setupLabelWithText:@"项目编号" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _bianHaoLabel = [self setupLabelWithText:_bianHao TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    
    _label2 = [self setupLabelWithText:@"项目名称" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _projectNameLabel = [self setupLabelWithText:_projectName TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _projectNameLabel.numberOfLines = 0;
    _projectNameLabel.textAlignment = NSTextAlignmentRight;
    
    _label3 = [self setupLabelWithText:@"合同目标" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _heTongTargetLabel = [self setupLabelWithText:@"合同目标是xxx" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _heTongTargetLabel.numberOfLines = 0;
    _heTongTargetLabel.textAlignment = NSTextAlignmentRight;
    
    _label4 = [self setupLabelWithText:@"企业创优目标" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _qiYeChuangYouTargetLabel = [self setupLabelWithText:@"企业创优目标是xxx" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _qiYeChuangYouTargetLabel.numberOfLines = 0;
    _qiYeChuangYouTargetLabel.textAlignment = NSTextAlignmentRight;

    _label5 = [self setupLabelWithText:@"申报日期" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _shenBaoDateLabel = [self setupLabelWithText:@"2017-10-30" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _shenBaoDateLabel.textAlignment = NSTextAlignmentRight;
    
    _label6 = [self setupLabelWithText:@"实现日期" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _shiXianDateLabel = [self setupLabelWithText:@"2017-10-30" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _shiXianDateLabel.textAlignment = NSTextAlignmentRight;
    
    _label7 = [self setupLabelWithText:@"责任人" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _zeRenManLabel = [self setupLabelWithText:@"责任人是xxx" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _zeRenManLabel.textAlignment = NSTextAlignmentRight;
    
    _label8 = [self setupLabelWithText:@"状态" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _statusLabel = [self setupLabelWithText:@"状态是xxx" TextColor:[UIColor redColor] Font:[UIFont systemFontOfSize:16]];
    _statusLabel.textAlignment = NSTextAlignmentRight;
    
    _label9 = [self setupLabelWithText:@"创建人" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _createPeopleLabel = [self setupLabelWithText:@"创建人xxx" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _createPeopleLabel.textAlignment = NSTextAlignmentRight;
    
    _label10 = [self setupLabelWithText:@"录入日期" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _luRuDateLabel = [self setupLabelWithText:[self getCurrentTime] TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _luRuDateLabel.textAlignment = NSTextAlignmentRight;
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.mas_equalTo(_view).offset(16);
        make.width.mas_equalTo(82);
        
    }];
    [_bianHaoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label1.mas_centerY);
        make.right.mas_equalTo(_view.mas_right).offset(-16);
        
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label1.mas_bottom).offset(16);
        make.left.mas_equalTo(_label1.mas_left);
        make.right.mas_equalTo(_label1.mas_right);
    }];
    [_projectNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label2.mas_top);
        make.left.mas_equalTo(_label2.mas_right).offset(16);
        make.right.mas_equalTo(_bianHaoLabel.mas_right);
        
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_projectNameLabel.mas_bottom).offset(16);
        make.left.mas_equalTo(_label2.mas_left);
        make.right.mas_equalTo(_label2.mas_right);
    }];
    [_heTongTargetLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label3.mas_top);
        make.left.mas_equalTo(_label3.mas_right).offset(16);
        make.right.mas_equalTo(_projectNameLabel.mas_right);
        
    }];
    
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_heTongTargetLabel.mas_bottom).offset(16);
        make.left.mas_equalTo(_label2.mas_left);
        make.width.mas_equalTo(124);
    }];
    [_qiYeChuangYouTargetLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label4.mas_top);
        make.left.mas_equalTo(_label4.mas_right).offset(16);
        make.right.mas_equalTo(_heTongTargetLabel.mas_right);
        
    }];
    
    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_qiYeChuangYouTargetLabel.mas_bottom).offset(16);
        make.left.mas_equalTo(_label4.mas_left);
        make.right.mas_equalTo(_label3.mas_right);
    }];
    [_shenBaoDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label5.mas_centerY);
        make.left.mas_equalTo(_label5.mas_right).offset(16);
        make.right.mas_equalTo(_qiYeChuangYouTargetLabel.mas_right);
    }];
    
    [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label5.mas_bottom).offset(16);
        make.left.mas_equalTo(_label5.mas_left);
        make.right.mas_equalTo(_label5.mas_right);
    }];
    [_shiXianDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label6.mas_centerY);
        make.left.mas_equalTo(_label6.mas_right).offset(16);
        make.right.mas_equalTo(_shenBaoDateLabel.mas_right);
    }];
    
    [_label7 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label6.mas_bottom).offset(16);
        make.left.mas_equalTo(_label6.mas_left);
        make.width.mas_equalTo(62);
    }];
    [_zeRenManLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label7.mas_centerY);
        make.left.mas_equalTo(_label7.mas_right).offset(16);
        make.right.mas_equalTo(_shiXianDateLabel.mas_right);
    }];
    
    [_label8 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label7.mas_bottom).offset(16);
        make.left.mas_equalTo(_label7.mas_left);
        make.width.mas_equalTo(42);
    }];
    [_statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label8.mas_centerY);
        make.left.mas_equalTo(_label8.mas_right).offset(16);
        make.right.mas_equalTo(_zeRenManLabel.mas_right);
    }];
    
    [_label9 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label8.mas_bottom).offset(16);
        make.left.mas_equalTo(_label8.mas_left);
        make.right.mas_equalTo(_label7.mas_right);
    }];
    [_createPeopleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label9.mas_centerY);
        make.left.mas_equalTo(_label9.mas_right).offset(16);
        make.right.mas_equalTo(_statusLabel.mas_right);
    }];
    
    [_label10 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label9.mas_bottom).offset(16);
        make.left.mas_equalTo(_label9.mas_left);
        make.right.mas_equalTo(_label6.mas_right);
    }];
    [_luRuDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label10.mas_centerY);
        make.left.mas_equalTo(_label10.mas_right).offset(16);
        make.right.mas_equalTo(_createPeopleLabel.mas_right);
    }];
    
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_label10.mas_bottom).offset(16);
        
    }];

    
}

//获取当地时间
- (NSString *)getCurrentTime {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    return dateTime;
    
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
