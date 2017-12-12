//
//  JSEIMPNewStaffBeiAnController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/10/20.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPNewStaffBeiAnController.h"
#import "LMJDropdownMenu.h"
#import <Masonry.h>

#define UIScreenW [UIScreen mainScreen].bounds.size.width
#define UIscreenH [UIScreen mainScreen].bounds.size.height

@interface JSEIMPNewStaffBeiAnController ()<UITextViewDelegate,LMJDropdownMenuDelegate>

@property(nonatomic,strong)NSMutableArray *beiAnGangWeiMArray;

@property(nonatomic,strong)NSMutableArray *beiAnPeopleMArray;

@end

@implementation JSEIMPNewStaffBeiAnController{

    UIScrollView *_scrollView;
    
    UIView *_view;
    
    UIView *_touchView1;
    
    UIView *_touchView2;
    
    UILabel *_label1;
    
    LMJDropdownMenu *_beiAnGangWeiMenu;
    
    UILabel *_label2;
    
    LMJDropdownMenu *_beiAnPeopleMenu;

    UILabel *_label3;
    
    UITextView *_beiZhuTextView;
    
    UILabel *_beiZhuPlaceLabel;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"新建人员备案情况";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
    [self setupUI];
    
}

- (void)returnAction {
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 触摸事件
-(void)touchEvent{
    
    [_beiAnGangWeiMenu hideDropDown];
    [_beiAnPeopleMenu hideDropDown];
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
    
    _beiAnGangWeiMArray = [NSMutableArray arrayWithObjects:@"项目经理",@"技术负责人",@"施工员",@"质量员",@"安全员",@"材料员",@"资料员",@"预算员", nil];
    _beiAnPeopleMArray = [NSMutableArray arrayWithObjects:@"姚辉",@"谢帆",@"张奇",@"秦慰",@"杨军",@"朱建超",@"梅峰",@"赵志豪",@"周军",@"张立杰",@"罗九五",@"杨翔", nil];
    
    _label1 = [self setupLabelWithText:@"备案岗位" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _beiAnGangWeiMenu = [self setDropDownMenuWithFrame:CGRectMake(16, 52, UIScreenW - 32, 30) Title:@"==请选择备案岗位==" Titles:_beiAnGangWeiMArray Tag:1];
    _label2 = [self setupLabelWithText:@"备案人员" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _beiAnPeopleMenu = [self setDropDownMenuWithFrame:CGRectMake(16, 132, UIScreenW - 32, 30) Title:@"==请选择备案人员=" Titles:_beiAnPeopleMArray Tag:2];
    _label3 = [self setupLabelWithText:@"备注" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];

    _beiZhuTextView = [self setupTextView];
    _beiZhuPlaceLabel = [self setupPlaceLabelWithText:@"请填写备注" Font:[UIFont systemFontOfSize:16]];
    [_beiZhuTextView addSubview:_beiZhuPlaceLabel];
    
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
        
        make.top.mas_equalTo(_beiAnGangWeiMenu.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_beiAnGangWeiMenu.mas_centerX);
        
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_beiAnPeopleMenu.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_beiAnPeopleMenu.mas_centerX);
        
    }];
    
    [_beiZhuTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label3.mas_bottom).offset(8);
        make.left.mas_equalTo(_beiAnPeopleMenu.mas_left);
        make.right.mas_equalTo(_beiAnPeopleMenu.mas_right);
        make.height.mas_equalTo(120);
        
    }];
    
    [_beiZhuPlaceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.top.mas_equalTo(_beiZhuTextView.mas_top).offset(8);
        make.left.mas_equalTo(_beiZhuTextView.mas_left).offset(6);
        
    }];
    
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_beiZhuTextView.mas_bottom).offset(10);
        
    }];
    
    
}

#pragma mark - <UITextViewDelegate>
-(void)textViewDidChange:(UITextView *)textView{
    
    if (_beiZhuTextView.hasText) {
        
        _beiZhuPlaceLabel.hidden = YES;
    }else if (!_beiZhuTextView.hasText){
        
        _beiZhuPlaceLabel.hidden = NO;
    }
    
}

#pragma mark - UITextViewDelegate
-(void)textViewDidBeginEditing:(UITextView *)textView{
    
    _beiAnGangWeiMenu.mainBtn.enabled = NO;
    _beiAnPeopleMenu.mainBtn.enabled = NO;
    
    [self scrollViewFrameChange];
    
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    
    _beiAnGangWeiMenu.mainBtn.enabled = YES;
    _beiAnPeopleMenu.mainBtn.enabled = YES;
    
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


#pragma mark - LMJDropdownMenuDelegate
-(void)dropdownMenuDidShow:(LMJDropdownMenu *)menu{
    
    _beiZhuTextView.editable = NO;
    
    if (_beiAnPeopleMenu.listView.frame.size.height > 300) {
        
        [_view mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.mas_equalTo(_scrollView);
            make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
            make.bottom.mas_equalTo(_beiAnPeopleMenu.listView.mas_bottom).offset(16);
            
        }];
    }
    
    if (menu.tag == 1) {
        
        _beiAnPeopleMenu.mainBtn.enabled = NO;
    }else if (menu.tag == 2){
    
        _beiAnGangWeiMenu.mainBtn.enabled = NO;
    }
}

-(void)dropdownMenuDidHidden:(LMJDropdownMenu *)menu{

    _beiZhuTextView.editable = YES;
    
    if (menu.tag == 1) {
        
        _beiAnPeopleMenu.mainBtn.enabled = YES;
    }else if (menu.tag == 2){
        
        _beiAnGangWeiMenu.mainBtn.enabled = YES;
    }
    
    [self scrollViewFrameRecover];
}

-(void)scrollViewFrameRecover{
    
    [_view mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_beiZhuTextView.mas_bottom).offset(10);
        
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

-(LMJDropdownMenu *)setDropDownMenuWithFrame:(CGRect)frame Title:(NSString *)title Titles:(NSArray *)titles Tag:(NSInteger)tag{
    
    LMJDropdownMenu *dropDownMenu = [[LMJDropdownMenu alloc] init];
    
    dropDownMenu.tag = tag;
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

-(UILabel *)setupLabelWithText:(NSString *)text Font:(UIFont *)font TextColor:(UIColor *)textColor{
    
    UILabel *label = [[UILabel alloc] init];
    
    label.text = text;
    label.font = font;
    label.textColor = textColor;
    
    [_view addSubview:label];
    
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
