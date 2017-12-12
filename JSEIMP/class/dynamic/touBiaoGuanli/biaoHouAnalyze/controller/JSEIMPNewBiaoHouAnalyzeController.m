//
//  JSEIMPNewBiaoHouAnalyzeController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/10/24.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPNewBiaoHouAnalyzeController.h"
#import "LMJDropdownMenu.h"
#import <Masonry.h>

#define UIScreenW [UIScreen mainScreen].bounds.size.width
#define UIScreenH [UIScreen mainScreen].bounds.size.height

@interface JSEIMPNewBiaoHouAnalyzeController ()<LMJDropdownMenuDelegate,UITextViewDelegate,UITextFieldDelegate>

@property(nonatomic,strong)NSMutableArray *projectNameMArray;

@end

@implementation JSEIMPNewBiaoHouAnalyzeController{

    UIScrollView *_scrollView;
    
    UIView *_view;
    
    UIView *_touchView1;
    
    UIView *_touchView2;

    UILabel *_label1;
    
    LMJDropdownMenu *_projectNameMenu;
    
    UILabel *_label2;
    
    UITextField *_kaiBiaoMoneyTextField;
    
    UILabel *_label3;
    
    UITextView *_analyzeTextView;
    
    UILabel *_analyzePlaceLabel;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"新建标书信息";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
    [self setupUI];
    
}

- (void)returnAction {
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - <UITextViewDelegate>
-(void)textViewDidChange:(UITextView *)textView{
    
    if (_analyzeTextView.hasText) {
        
        _analyzePlaceLabel.hidden = YES;
    }else if (!_analyzeTextView.hasText){
        
        _analyzePlaceLabel.hidden = NO;
    }
    
}

#pragma mark - UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{

    _projectNameMenu.mainBtn.enabled = NO;
    
    [self scrollViewFrameChange];

}

-(void)textFieldDidEndEditing:(UITextField *)textField{

    _projectNameMenu.mainBtn.enabled = YES;
    
    [self scrollViewFrameRecover];

}

#pragma mark - UITextViewDelegate
-(void)textViewDidBeginEditing:(UITextView *)textView{
    
    _projectNameMenu.mainBtn.enabled = NO;

    [self scrollViewFrameChange];
    
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    
    _projectNameMenu.mainBtn.enabled = YES;
    
    [self scrollViewFrameRecover];
    
}

#pragma mark - ScrollViewFramebianhua
-(void)scrollViewFrameChange{
    
    [_view mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_analyzeTextView.mas_bottom).offset(226);
        
    }];
    
}

-(void)scrollViewFrameRecover{
    
    [_view mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_analyzeTextView.mas_bottom).offset(10);
        
    }];
    
}

#pragma mark - LMJDropdownMenuDelegate
-(void)dropdownMenuDidShow:(LMJDropdownMenu *)menu{
    
    _analyzeTextView.editable = NO;
    _kaiBiaoMoneyTextField.enabled = NO;
    
    [self scrollViewFrameChange];

}

-(void)dropdownMenuDidHidden:(LMJDropdownMenu *)menu{
    
    _analyzeTextView.editable = YES;
    _kaiBiaoMoneyTextField.enabled = YES;
    
    [self scrollViewFrameRecover];
}

#pragma mark - 触摸事件
-(void)touchEvent{
    
    [_projectNameMenu hideDropDown];
    [self.view endEditing:YES];
    
}

-(void)setupUI{

    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:_scrollView];
    
    _view = [[UIView alloc] initWithFrame:_scrollView.bounds];
    
    _view.backgroundColor = [UIColor whiteColor];
    
    [_scrollView addSubview:_view];
    
    _touchView1 = [self setupTouchView];
    _touchView2 = [self setupTouchView];
    
    _projectNameMArray = [NSMutableArray arrayWithObjects:@"金马路项目建安总承包工程",@"太阳城一期二标", nil];
    
    _label1 = [self setupLabelWithText:@"项目名称*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _projectNameMenu = [self setDropDownMenuWithFrame:CGRectMake(16, 52, UIScreenW - 32, 30) Title:@"==请选择==" Titles:_projectNameMArray Tag:1];
    _label2 = [self setupLabelWithText:@"开标总价(万元)*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _kaiBiaoMoneyTextField = [self setupTextFieldWithPlacedText:@"请填写开标总价"];
    _label3 = [self setupLabelWithText:@"标后分析*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    
    _analyzeTextView = [self setupTextView];
    _analyzePlaceLabel = [self setupPlaceLabelWithText:@"请填写标后分析" Font:[UIFont systemFontOfSize:16]];
    [_analyzeTextView addSubview:_analyzePlaceLabel];
    
    [_touchView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.bottom.mas_equalTo(self.view);
        make.right.mas_equalTo(_label1.mas_left);
        
    }];
    
    [_touchView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.right.bottom.mas_equalTo(self.view);
        make.left.mas_equalTo(_label1.mas_right);
        
    }];
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_view.mas_top).offset(16);
        make.centerX.mas_equalTo(_view.mas_centerX);
        
    }];

    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_projectNameMenu.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_projectNameMenu.mas_centerX);
        
    }];
    [_kaiBiaoMoneyTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label2.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_label2.mas_centerX);
        make.left.right.mas_equalTo(_projectNameMenu);
        make.height.mas_equalTo(30);
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_kaiBiaoMoneyTextField.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_kaiBiaoMoneyTextField.mas_centerX);
        
    }];
    [_analyzeTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label3.mas_bottom).offset(8);
        make.left.mas_equalTo(_kaiBiaoMoneyTextField.mas_left);
        make.right.mas_equalTo(_kaiBiaoMoneyTextField.mas_right);
        make.height.mas_equalTo(120);
        
    }];
    [_analyzePlaceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.top.mas_equalTo(_analyzeTextView.mas_top).offset(8);
        make.left.mas_equalTo(_analyzeTextView.mas_centerX).offset(-53);
        
    }];
    
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_analyzeTextView.mas_bottom).offset(16);
        
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

-(LMJDropdownMenu *)setDropDownMenuWithFrame:(CGRect)frame Title:(NSString *)title Titles:(NSArray *)titles Tag:(NSInteger)tag{
    
    LMJDropdownMenu *dropDownMenu = [[LMJDropdownMenu alloc] init];
    
    dropDownMenu.tag = tag;
    dropDownMenu.delegate = self;
    [dropDownMenu setFrame:frame];
    [dropDownMenu.mainBtn setTitle:title forState:UIControlStateNormal];
    [dropDownMenu.mainBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 3, 0, 10)];
    [dropDownMenu.mainBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    dropDownMenu.mainBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [dropDownMenu setMenuTitles:titles rowHeight:30];
    
    [_view addSubview:dropDownMenu];
    
    return dropDownMenu;
    
}

-(UITextField *)setupTextFieldWithPlacedText:(NSString *)placedText{
    
    UITextField *textField = [[UITextField alloc] init];
    
    textField.layer.borderWidth = 0.5;
    textField.delegate = self;
    textField.textAlignment = NSTextAlignmentCenter;
    textField.placeholder = placedText;
    textField.textColor = [UIColor darkGrayColor];
    textField.font = [UIFont systemFontOfSize:16];
    
    [_view addSubview:textField];
    
    return textField;
    
}

-(UITextView *)setupTextView{
    
    UITextView *textView = [UITextView new];
    
    textView.layer.borderWidth = 0.5;
    //内容可以拖拽
    textView.alwaysBounceVertical = YES;
    //关闭键盘
    textView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    textView.font = [UIFont systemFontOfSize:16];
    textView.delegate = self;
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
