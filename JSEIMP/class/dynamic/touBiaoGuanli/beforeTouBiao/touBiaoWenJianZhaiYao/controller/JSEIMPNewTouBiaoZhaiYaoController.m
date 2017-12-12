//
//  JSEIMPNewTouBiaoZhaiYaoController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/9/27.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPNewTouBiaoZhaiYaoController.h"
#import "LMJDropdownMenu.h"
#import <Masonry.h>

#define UIScreesW [UIScreen mainScreen].bounds.size.width
#define UIScreesH [UIScreen mainScreen].bounds.size.height

@interface JSEIMPNewTouBiaoZhaiYaoController ()<UITextFieldDelegate,UITextViewDelegate,LMJDropdownMenuDelegate>

@end

@implementation JSEIMPNewTouBiaoZhaiYaoController{

    UIScrollView *_scrollView;
    
    UIView *_view;
    
    NSString *_currentTimeString;
    
    UIView *_touchView1;
    
    UIView *_touchView2;
    
    UILabel *_label1;
    
    UILabel *_label2;
    
    UILabel *_label3;
    
    UILabel *_label4;
    
    UILabel *_label5;
    
    UILabel *_label6;
    
    UILabel *_label7;
    
    LMJDropdownMenu *_projectNameMenu;
    
    UITextField *_buildCompanyTextField;
    
    UITextField *_zhaiYaoNumberTextField;
    
    UITextField *_createPeopleTextField;

    UILabel *_createTimeLabel;
    
    UITextView *_contentTextView;
    
    UILabel *_contentPlaceLabel;
    
    UITextView *_beiZhuTextView;
    
    UILabel *_beiZhuPlaceLabel;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"新建投标文件摘要";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
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
    
    _touchView1 = [self setupTouchView];
    _touchView2 = [self setupTouchView];
    
    _label1 = [self setupLabelWithText:@"项目名称*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _projectNameMenu = [self setDropDownMenuWithFrame:CGRectMake(16, 54, UIScreesW - 32, 30) Title:@"==请选择项目名称==" Titles:@[@"太阳城一期二标",@"俞泾浦南、四平路西地块综合开发项目总包工程"]];
    
    _label2 = [self setupLabelWithText:@"建设单位*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _buildCompanyTextField = [self setupTextFieldWithPlacedText:@"请填写建设单位"];
    
    _label3 = [self setupLabelWithText:@"摘要文档编号*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _zhaiYaoNumberTextField = [self setupTextFieldWithPlacedText:@"请填写文档编号"];
    
    _label4 = [self setupLabelWithText:@"创建人*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _createPeopleTextField = [self setupTextFieldWithPlacedText:@"请填写创建人姓名"];
    
    _label5 = [self setupLabelWithText:@"创建时间*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _currentTimeString = [self getCurrentTime];
    _createTimeLabel = [self setupLabelWithText:_currentTimeString Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    
    _label6 = [self setupLabelWithText:@"内容*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _contentTextView = [self setupTextView];
    _contentPlaceLabel = [self setupPlaceLabelWithText:@"这里输入文章内容..." Font:[UIFont systemFontOfSize:16]];
    [_contentTextView addSubview:_contentPlaceLabel];
    
    _label7 = [self setupLabelWithText:@"备注*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _beiZhuTextView = [self setupTextView];
    _beiZhuPlaceLabel = [self setupPlaceLabelWithText:@"请填写备注" Font:[UIFont systemFontOfSize:16]];
    [_beiZhuTextView addSubview:_beiZhuPlaceLabel];
    
    [_touchView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.bottom.mas_equalTo(_view);
        make.right.mas_equalTo(_label1.mas_left);
        
    }];
    
    [_touchView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.right.bottom.mas_equalTo(_view);
        make.left.mas_equalTo(_label1.mas_right);
        
    }];
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_view).offset(16);
        make.centerX.mas_equalTo(_view.mas_centerX);
    }];
    //建设单位label
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_projectNameMenu.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_projectNameMenu.mas_centerX);
        
    }];
    [_buildCompanyTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label2.mas_bottom).offset(16);
        make.left.mas_equalTo(_projectNameMenu.mas_left);
        make.right.mas_equalTo(_projectNameMenu.mas_right);
        make.height.mas_equalTo(30);
        
    }];
    //摘要文档编号label
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_buildCompanyTextField.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_buildCompanyTextField.mas_centerX);
        
    }];
    [_zhaiYaoNumberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(_label3.mas_centerX);
        make.top.mas_equalTo(_label3.mas_bottom).offset(16);
        make.left.mas_equalTo(_buildCompanyTextField.mas_left);
        make.right.mas_equalTo(_buildCompanyTextField.mas_right);
        make.height.mas_equalTo(30);
        
    }];
    //创建人label
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_zhaiYaoNumberTextField.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_zhaiYaoNumberTextField.mas_centerX);
        
    }];
    [_createPeopleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(_label4.mas_centerX);
        make.top.mas_equalTo(_label4.mas_bottom).offset(16);
        make.left.mas_equalTo(_zhaiYaoNumberTextField.mas_left);
        make.right.mas_equalTo(_zhaiYaoNumberTextField.mas_right);
        make.height.mas_equalTo(30);
        
    }];
    //创建时间label
    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(_createPeopleTextField.mas_centerX);
        make.top.mas_equalTo(_createPeopleTextField.mas_bottom).offset(16);
        
    }];
    [_createTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(_label5.mas_centerX);
        make.top.mas_equalTo(_label5.mas_bottom).offset(16);
        make.left.mas_equalTo(_createPeopleTextField.mas_left);
        make.right.mas_equalTo(_createPeopleTextField.mas_right);
        
    }];
    
    [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_createTimeLabel.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_createTimeLabel.mas_centerX);
        
    }];
    [_contentTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label6.mas_bottom).offset(8);
        make.left.mas_equalTo(_createTimeLabel.mas_left);
        make.right.mas_equalTo(_createTimeLabel.mas_right);
        make.height.mas_equalTo(120);
        
    }];
    [_contentPlaceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_contentTextView.mas_top).offset(8);
        make.centerX.mas_equalTo(_contentTextView.mas_centerX);
    }];
    
    [_label7 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_contentTextView.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_contentPlaceLabel.mas_centerX);
        
    }];
    [_beiZhuTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label7.mas_bottom).offset(8);
        make.left.mas_equalTo(_contentTextView.mas_left);
        make.right.mas_equalTo(_contentTextView.mas_right);
        make.height.mas_equalTo(120);
        
    }];
    [_beiZhuPlaceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_beiZhuTextView.mas_top).offset(8);
        make.centerX.mas_equalTo(_beiZhuTextView.mas_centerX);
        
    }];
    
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_beiZhuTextView.mas_bottom).offset(16);
        
    }];
    
}

#pragma mark - 触摸事件
-(void)touchEvent{
    
    [_projectNameMenu hideDropDown];
    [_view endEditing:YES];
    
}

#pragma mark - LMJDropdownMenuDelegate
-(void)dropdownMenuDidShow:(LMJDropdownMenu *)menu{

    _zhaiYaoNumberTextField.enabled = NO;
    _createPeopleTextField.enabled = NO;
    _contentTextView.editable = NO;
    _beiZhuTextView.editable = NO;

}

-(void)dropdownMenuDidHidden:(LMJDropdownMenu *)menu{

    _zhaiYaoNumberTextField.enabled = YES;
    _createPeopleTextField.enabled = YES;
    _contentTextView.editable = YES;
    _beiZhuTextView.editable = YES;

}

#pragma mark - <UITextViewDelegate>
-(void)textViewDidChange:(UITextView *)textView{
    
    if (_contentTextView.hasText) {
        
        _contentPlaceLabel.hidden = YES;
        
    }else if (!_contentTextView.hasText){
        
        _contentPlaceLabel.hidden = NO;
        
    }
    
    if (_beiZhuTextView.hasText) {
        
        _beiZhuPlaceLabel.hidden = YES;
    }else if (!_beiZhuTextView.hasText){
        
        _beiZhuPlaceLabel.hidden = NO;
    }
    
}

#pragma mark - UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    [self scrollViewFrameChange];
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    [self scrollViewFrameRecover];
    
}

#pragma mark - UITextViewDelegate
-(void)textViewDidBeginEditing:(UITextView *)textView{
    
    
    [self scrollViewFrameChange];
    
}

-(void)textViewDidEndEditing:(UITextView *)textView{

    
    [self scrollViewFrameRecover];
    
}

#pragma mark - ScrollViewFramebianhua
-(void)scrollViewFrameChange{
    
    [_view mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_beiZhuTextView.mas_bottom).offset(226);
        
    }];
    
}

-(void)scrollViewFrameRecover{
    
    [_view mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_beiZhuTextView.mas_bottom).offset(10);
        
    }];
    
}

-(UILabel *)setupLabelWithText:(NSString *)text Font:(UIFont *)font TextColor:(UIColor *)textColor{
    
    UILabel *label = [[UILabel alloc] init];
    
    label.textAlignment = NSTextAlignmentCenter;
    label.text = text;
    label.font = font;
    label.textColor = textColor;
    
    [_view addSubview:label];
    
    return label;
    
}

-(UITextField *)setupTextFieldWithPlacedText:(NSString *)placedText{
    
    UITextField *textField = [[UITextField alloc] init];
    
    textField.layer.borderWidth = 0.5;
    textField.placeholder = placedText;
    textField.delegate = self;
    textField.textColor = [UIColor darkGrayColor];
    textField.font = [UIFont systemFontOfSize:16];
    textField.textAlignment = NSTextAlignmentCenter;
    
    [_view addSubview:textField];
    
    return textField;
    
}

-(UITextView *)setupTextView{
    
    UITextView *textView = [UITextView new];
    
    textView.layer.borderWidth = 0.5;
    textView.textAlignment = NSTextAlignmentCenter;
    //内容可以拖拽
    textView.alwaysBounceVertical = YES;
    textView.delegate = self;
    //关闭键盘
    textView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    textView.font = [UIFont systemFontOfSize:16];
    textView.textColor = [UIColor darkGrayColor];
    
    [_view addSubview:textView];
    
    return textView;
    
}

-(UILabel *)setupPlaceLabelWithText:(NSString *)text Font:(UIFont *)font{
    
    UILabel *label = [[UILabel alloc] init];
    
    label.text = text;
    label.font = font;
    label.textColor = [UIColor colorWithRed:190.0 / 255.0 green:190.0 / 255.0 blue:190.0 / 255.0 alpha:1];
    
    return label;
    
}

//获取当地时间
- (NSString *)getCurrentTime {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    return dateTime;

}

-(LMJDropdownMenu *)setDropDownMenuWithFrame:(CGRect)frame Title:(NSString *)title Titles:(NSArray *)titles{
    
    LMJDropdownMenu *dropDownMenu = [[LMJDropdownMenu alloc] init];
    
    dropDownMenu.delegate = self;
    [dropDownMenu setFrame:frame];
    [dropDownMenu.mainBtn setTitle:title forState:UIControlStateNormal];
    [dropDownMenu.mainBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 3, 0, 5)];
    [dropDownMenu.mainBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    dropDownMenu.mainBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [dropDownMenu setMenuTitles:titles rowHeight:30];
    
    [_view addSubview:dropDownMenu];
    
    return dropDownMenu;
    
}

-(UIView *)setupTouchView{
    
    UIView *view = [UIView new];
    
    view.backgroundColor = [UIColor whiteColor];
    
    [_view addSubview:view];
    
    //点击手势
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchEvent)];
    
    [view addGestureRecognizer:tapGestureRecognizer];
    
    return view;
    
}


@end
