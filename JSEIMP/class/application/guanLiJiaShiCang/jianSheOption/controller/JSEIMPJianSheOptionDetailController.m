//
//  JSEIMPJianSheOptionDetailController.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/1/2.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPJianSheOptionDetailController.h"
#import <Masonry.h>

#define UIScreenW [UIScreen mainScreen].bounds.size.width
#define UIScreenH [UIScreen mainScreen].bounds.size.height


@interface JSEIMPJianSheOptionDetailController ()

@property(nonatomic,strong)NSMutableArray *titleMArray;

@end

@implementation JSEIMPJianSheOptionDetailController{
    
    UIScrollView *_scrollView;
    
    UIView *_view;
    
    UILabel *_label1;
    
    UILabel *_label2;
    
    UILabel *_label3;
    
    UILabel *_projectNameLabel;
    
    UILabel *_label4;
    
    UILabel *_buildCompanyLabel;
    
    UILabel *_label5;
    
    UILabel *_jianLiCompanyLabel;
    
    UILabel *_label6;
    
    UILabel *_shiGongCompanyLabel;
    
    UILabel *_label7;
    
    UILabel *_projectManagerLabel;
    
    UILabel *_label8;
    
    UILabel *_diaoChaDateLabel;
    
    UILabel *_label9;
    
    UILabel *_label10;
    
    UILabel *_label11;
    
    UILabel *_label12;
    
    UIView *_line1;
    
    UIButton *_button1;
    
    UIView *_buttonView;
    
    UILabel *_label13;
    
    UIButton *_button2;
    
    UILabel *_label14;
    
    UITextView *_textView1;
    
    UILabel *_label15;
    
    UIView *_line2;
    
    UITextView *_textView2;
    
    UIView *_line3;
    
    UILabel *_label16;
    
    UILabel *_jianYiRenLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"建设意见交流评价详情查看";
    
    _titleMArray = [NSMutableArray arrayWithObjects:@"进度目标",@"质量管理",@"安全管理",@"文明施工",@"安装工程",@"装饰工程",@"分包管理",@"配合服务",@"执行力度",@"项目管理", nil];
    
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
    
    _label1 = [self setupLabelWithText:@"上海嘉实（集团）有限公司" TextColor:[UIColor darkTextColor] Font:[UIFont boldSystemFontOfSize:24]];
    _label2 = [self setupLabelWithText:@"单位项目管理评价意见交流单" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label3 = [self setupLabelWithText:@"项目名称" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:16]];
    _projectNameLabel = [self setupLabelWithText:_projectName TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _projectNameLabel.numberOfLines = 0;
    _projectNameLabel.textAlignment = NSTextAlignmentRight;
    _label4 = [self setupLabelWithText:@"建设单位" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:16]];
    _buildCompanyLabel = [self setupLabelWithText:@"上海嘉实集团" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _buildCompanyLabel.numberOfLines = 0;
    _buildCompanyLabel.textAlignment = NSTextAlignmentRight;
    _label5 = [self setupLabelWithText:@"监理单位" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:16]];
    _jianLiCompanyLabel = [self setupLabelWithText:@"上海嘉实集团" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _jianLiCompanyLabel.numberOfLines = 0;
    _jianLiCompanyLabel.textAlignment = NSTextAlignmentRight;
    _label6 = [self setupLabelWithText:@"施工单位" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:16]];
    _shiGongCompanyLabel = [self setupLabelWithText:@"上海嘉实集团" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _shiGongCompanyLabel.numberOfLines = 0;
    _shiGongCompanyLabel.textAlignment = NSTextAlignmentRight;
    _label7 = [self setupLabelWithText:@"项目经理" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:16]];
    _projectManagerLabel = [self setupLabelWithText:@"项目经理是xxx" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _projectManagerLabel.numberOfLines = 0;
    _projectManagerLabel.textAlignment = NSTextAlignmentRight;
    _label8 = [self setupLabelWithText:@"调查日期" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:16]];
    _diaoChaDateLabel = [self setupLabelWithText:_diaoChaDate TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _diaoChaDateLabel.numberOfLines = 0;
    _diaoChaDateLabel.textAlignment = NSTextAlignmentRight;
    _label9 = [self setupLabelWithText:@"管理目标" TextColor:[UIColor darkTextColor] Font:[UIFont boldSystemFontOfSize:16]];
    _label10 = [self setupLabelWithText:@"建设单位评价" TextColor:[UIColor darkTextColor] Font:[UIFont boldSystemFontOfSize:16]];
    _label11 = [self setupLabelWithText:@"不满意事例说明" TextColor:[UIColor darkTextColor] Font:[UIFont boldSystemFontOfSize:16]];
    _label11.textAlignment = NSTextAlignmentRight;
    
    _line2 = [[UIView alloc] init];
    _line2.backgroundColor = [UIColor lightGrayColor];
    [_view addSubview:_line2];
    
    _label15 = [self setupLabelWithText:@"表扬,批评或建议(经理意见)" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:16]];
    
    _textView2 = [self setupTextView];
    _textView2.text = @"表扬,批评或建议(经理意见)是xxxx";
    _textView2.editable = NO;
    _textView2.textColor = [UIColor darkTextColor];
    
    _line3 = [[UIView alloc] init];
    _line3.backgroundColor = [UIColor lightGrayColor];
    [_view addSubview:_line3];
    
    _label16 = [self setupLabelWithText:@"建议人：" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:16]];
    _jianYiRenLabel = [self setupLabelWithText:@"建议人是xxx" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _jianYiRenLabel.textAlignment = NSTextAlignmentRight;
    
    for (int i = 0; i < _titleMArray.count; i++) {
        
        _label12 = [self setupLabelWithText:_titleMArray[i] TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:16]];
        _label12.frame = CGRectMake(8, 314 + 50 * i, 82, 20);
        
        _line1 = [[UIView alloc] init];
        _line1.frame = CGRectMake(0, 300 + 50 * i, self.view.bounds.size.width, 0.5);
        _line1.backgroundColor = [UIColor lightGrayColor];
        
        _button1 = [self setButtonWithTag:i];
        _button1.frame = CGRectMake(85, 316 + 50 * i, 16, 16);
        
        [_view addSubview:_label12];
        [_view addSubview:_line1];
        
        _buttonView = [self setView];
        _buttonView.frame = CGRectMake(4, 4, 8, 8);
        
        [_button1 addSubview:_buttonView];
        
        _label13 = [self setupLabelWithText:@"满意" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:16]];
        _label13.frame = CGRectMake(102, 316 + 50 * i, 34, 16);
        
        _button2 = [self setButtonWithTag:i + 10];
        _button2.frame = CGRectMake(136, 316 + 50 * i, 16, 16);
        
        _label14 = [self setupLabelWithText:@"不满意" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:16]];
        _label14.frame = CGRectMake(154, 316 + 50 * i, 50, 16);
        
        _textView1 = [self setupTextView];
        _textView1.frame = CGRectMake(210, 302 + 50 * i, UIScreenW -212, 46);
        _textView1.text = @"”不满意事例“的说明是xxxx";
        _textView1.editable = NO;
        _textView1.textColor = [UIColor darkTextColor];
        
    }
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(_view.mas_centerX);
        make.top.mas_equalTo(_view.mas_top).offset(16);
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label1.mas_bottom).offset(8);
        make.centerX.mas_equalTo(_label1.mas_centerX);
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_view.mas_left).offset(8);
        make.top.mas_equalTo(_label2.mas_bottom).offset(16);
        make.width.mas_equalTo(66);
    }];
    
    [_projectNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label3.mas_right).offset(8);
        make.right.mas_equalTo(_view.mas_right).offset(-8);
        make.centerY.mas_equalTo(_label3.mas_centerY);
    }];
    
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label3.mas_left);
        make.top.mas_equalTo(_projectNameLabel.mas_bottom).offset(8);
        make.right.mas_equalTo(_label3.mas_right);
    }];
    
    [_buildCompanyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label4.mas_right).offset(8);
        make.right.mas_equalTo(_projectNameLabel.mas_right);
        make.centerY.mas_equalTo(_label4.mas_centerY);
    }];
    
    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label4.mas_left);
        make.top.mas_equalTo(_buildCompanyLabel.mas_bottom).offset(8);
        make.right.mas_equalTo(_label4.mas_right);
    }];
    
    [_jianLiCompanyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label5.mas_right).offset(8);
        make.right.mas_equalTo(_buildCompanyLabel.mas_right);
        make.centerY.mas_equalTo(_label5.mas_centerY);
    }];
    
    [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label5.mas_left);
        make.top.mas_equalTo(_jianLiCompanyLabel.mas_bottom).offset(8);
        make.right.mas_equalTo(_label5.mas_right);
    }];
    
    [_shiGongCompanyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label6.mas_right).offset(8);
        make.right.mas_equalTo(_jianLiCompanyLabel.mas_right);
        make.centerY.mas_equalTo(_label6.mas_centerY);
    }];
    
    [_label7 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label6.mas_left);
        make.top.mas_equalTo(_shiGongCompanyLabel.mas_bottom).offset(8);
        make.right.mas_equalTo(_label6.mas_right);
    }];
    
    [_projectManagerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label7.mas_right).offset(8);
        make.right.mas_equalTo(_shiGongCompanyLabel.mas_right);
        make.centerY.mas_equalTo(_label7.mas_centerY);
    }];
    
    [_label8 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label7.mas_left);
        make.top.mas_equalTo(_projectManagerLabel.mas_bottom).offset(8);
        make.right.mas_equalTo(_label7.mas_right);
    }];
    
    [_diaoChaDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label8.mas_right).offset(8);
        make.right.mas_equalTo(_projectManagerLabel.mas_right);
        make.centerY.mas_equalTo(_label8.mas_centerY);
    }];
    
    [_label9 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label8.mas_left);
        make.top.mas_equalTo(_label8.mas_bottom).offset(16);
        make.right.mas_equalTo(_label8.mas_right);
    }];
    
    [_label10 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label9.mas_right).offset(16);
        make.centerY.mas_equalTo(_label9.mas_centerY);
        make.width.mas_equalTo(98);
    }];
    
    [_label11 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label10.mas_right).offset(8);
        make.centerY.mas_equalTo(_label10.mas_centerY);
        make.right.mas_equalTo(_diaoChaDateLabel.mas_right);
    }];
    
    [_line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_view.mas_left);
        make.top.mas_equalTo(_textView1.mas_bottom).offset(2);
        make.right.mas_equalTo(_view.mas_right);
        make.height.mas_equalTo(0.5);
    }];
    
    [_label15 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label12.mas_left);
        make.top.mas_equalTo(_line2.mas_bottom).offset(16);
        make.width.mas_equalTo(240);
    }];
    
    [_textView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_line2.mas_bottom).offset(2);
        make.left.mas_equalTo(_textView1.mas_left);
        make.right.mas_equalTo(_textView1.mas_right);
        make.height.mas_equalTo(_textView1.mas_height);
    }];
    
    [_line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_view.mas_left);
        make.top.mas_equalTo(_textView2.mas_bottom).offset(2);
        make.right.mas_equalTo(_view.mas_right);
        make.height.mas_equalTo(0.5);
    }];
    
    [_label16 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label15.mas_left);
        make.top.mas_equalTo(_line3.mas_bottom).offset(16);
        make.width.mas_equalTo(66);
    }];
    
    [_jianYiRenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label16.mas_right).offset(16);
        make.centerY.mas_equalTo(_label16.mas_centerY);
        make.right.mas_equalTo(_diaoChaDateLabel.mas_right);
    }];
    
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo(UIScreenW);
        make.bottom.mas_equalTo(_jianYiRenLabel.mas_bottom).offset(16);
    }];
}

-(UITextView *)setupTextView{
    
    UITextView *textView = [UITextView new];
    
    textView.layer.borderWidth = 0.5;
    //内容可以拖拽
    textView.alwaysBounceVertical = YES;
    //关闭键盘
    textView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    textView.font = [UIFont systemFontOfSize:16];
    
    [_view addSubview:textView];
    
    return textView;
    
}

-(UIView *)setView{
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor blueColor];
    view.layer.cornerRadius = 4;
    view.clipsToBounds = YES;
    
    return view;
}

-(UIButton *)setButtonWithTag:(NSInteger)tag{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"" forState:UIControlStateNormal];
    [button setTitleColor:nil forState:UIControlStateNormal];
    [button setTag:tag];
    button.layer.borderWidth = 1.0;
    button.layer.cornerRadius = 8;
    button.clipsToBounds = YES;
    [_view addSubview:button];
    
    return button;
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
