//
//  JSEIMPNewProjectShouXuController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/10/17.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPNewProjectShouXuController.h"
#import "HACursor.h"
#import "UIView+Extension.h"
#import <Masonry.h>
#import "HATestView.h"
#import "JSEIMPNewZiZhiCheckShouXuView.h"
#import "LMJDropdownMenu.h"
#import "JSEIMPNewFaBaoShouXuView.h"
#import "JSEIIMPNewHeTongBeiAnView.h"
#import "JSEIMPNewZhiJianShouXuView.h"
#import "JSEIMPNewAnJianShouXiView.h"
#import "JSEIMPNewShiGongXuKeZhengView.h"

#define UIScreenW [UIScreen mainScreen].bounds.size.width
#define UIscreenH [UIScreen mainScreen].bounds.size.height

@interface JSEIMPNewProjectShouXuController ()<UITextViewDelegate,LMJDropdownMenuDelegate,UITextFieldDelegate>

@property (nonatomic, strong) NSMutableArray *pageViews;

@end

@implementation JSEIMPNewProjectShouXuController{
    
    HACursor *_cursor;
    
    UIScrollView *_scrollView1;
    
    UIScrollView *_scrollView2;
    
    UIScrollView *_scrollView3;
    
    UIScrollView *_scrollView4;
    
    UIScrollView *_scrollView5;
    
    UIScrollView *_scrollView6;
    
    JSEIMPNewZiZhiCheckShouXuView *_newZiZhiCheckShouXuView;
    
    JSEIMPNewFaBaoShouXuView *_newFaBaoShouXuView;
    
    JSEIIMPNewHeTongBeiAnView *_newHeTongBeiAnView;
    
    JSEIMPNewZhiJianShouXuView *_newZhiJianShouXuView;
    
    JSEIMPNewAnJianShouXiView *_newAnJianShouXiView;
    
    JSEIMPNewShiGongXuKeZhengView *_newShiGongXuKeZhengView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"新建项目手续办理";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
    [self setupUI];
    
}

- (void)returnAction {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setupUI{
    
    UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:view];
    
    _cursor = [[HACursor alloc]init];
    _cursor.backgroundColor = [UIColor colorWithRed:56.0 / 255.0 green:135.0 / 255.0 blue:250.0 / 255.0 alpha:1];
    _cursor.frame = CGRectMake(0, 64, self.view.width, 45);
    _cursor.titles = self.titles;
    _cursor.pageViews = [self createPageViews];
    _cursor.navLineColor = [UIColor blueColor];
    //设置根滚动视图的高度
    _cursor.rootScrollViewHeight = self.view.frame.size.height - 153;
    //默认值是白色
    _cursor.titleNormalColor = [UIColor whiteColor];
    //默认值是白色
    _cursor.titleSelectedColor = [UIColor orangeColor];
    //是否显示排序按钮
    _cursor.showSortbutton = YES;
    //默认的最小值是5，小于默认值的话按默认值设置
    _cursor.minFontSize = 13;
    //默认的最大值是25，小于默认值的话按默认值设置，大于默认值按设置的值处理
    _cursor.maxFontSize = 16;
    //cursor.isGraduallyChangFont = NO;
    //在isGraduallyChangFont为NO的时候，isGraduallyChangColor不会有效果
    //cursor.isGraduallyChangColor = NO;
    [self.view addSubview:_cursor];
    
}

- (NSMutableArray *)createPageViews{
    
    NSMutableArray *pageViews = [NSMutableArray array];
    
    for (NSInteger i = 0; i < self.titles.count; i++) {
        
        if (i == 0) {
            
            _cursor.rootScrollView.bounces = NO;
            
            _scrollView1 = [[UIScrollView alloc] initWithFrame:self.view.frame];
            
            _newZiZhiCheckShouXuView = [[JSEIMPNewZiZhiCheckShouXuView alloc] init];
            _newZiZhiCheckShouXuView.beiZhuTextView.delegate = self;
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"projectNames" object:_projectNameMArray];
            
            [_scrollView1 addSubview:_newZiZhiCheckShouXuView];
            
            [_newZiZhiCheckShouXuView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.edges.mas_equalTo(_scrollView1);
                make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
                make.bottom.mas_equalTo(_newZiZhiCheckShouXuView.beiZhuTextView.mas_bottom).offset(16);
                
            }];
            
            [pageViews addObject:_scrollView1];
            
        }else if (i == 1){
            
            _cursor.rootScrollView.bounces = NO;
            
            _newFaBaoShouXuView = [[JSEIMPNewFaBaoShouXuView alloc] init];
            
            _newFaBaoShouXuView.beiZhuTextView.delegate = self;
            _newFaBaoShouXuView.jiaoYiMoneyTextField.delegate = self;
            
            _scrollView2 = [[UIScrollView alloc] initWithFrame:self.view.frame];
            
            [_scrollView2 addSubview:_newFaBaoShouXuView];
            
            [_newFaBaoShouXuView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.edges.mas_equalTo(_scrollView2);
                make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
                make.bottom.mas_equalTo(_newFaBaoShouXuView.beiZhuTextView.mas_bottom).offset(16);
            }];
            
            [pageViews addObject:_scrollView2];
            
        }else if (i == 2){
        
            _cursor.rootScrollView.bounces = NO;
            
            _newHeTongBeiAnView = [[JSEIIMPNewHeTongBeiAnView alloc] init];
            
            _newHeTongBeiAnView.beiZhuTextView.delegate = self;
            
            _scrollView3 = [[UIScrollView alloc] initWithFrame:self.view.frame];
            
            [_scrollView3 addSubview:_newHeTongBeiAnView];
            
            [_newHeTongBeiAnView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.edges.mas_equalTo(_scrollView3);
                make.width.mas_equalTo(UIScreenW);
                make.bottom.mas_equalTo(_newHeTongBeiAnView.beiZhuTextView.mas_bottom).offset(16);
            }];
            
            [pageViews addObject:_scrollView3];
        
        }else if (i == 3){
        
            _cursor.rootScrollView.bounces = NO;
            
            _newZhiJianShouXuView = [[JSEIMPNewZhiJianShouXuView alloc] init];
            
            _newZhiJianShouXuView.beiZhuTextView.delegate = self;
            
            _scrollView4 = [[UIScrollView alloc] initWithFrame:self.view.frame];
            
            [_scrollView4 addSubview:_newZhiJianShouXuView];
            
            [_newZhiJianShouXuView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.edges.mas_equalTo(_scrollView4);
                make.width.mas_equalTo(UIScreenW);
                make.bottom.mas_equalTo(_newZhiJianShouXuView.beiZhuTextView.mas_bottom).offset(16);
            }];
            
            [pageViews addObject:_scrollView4];
            
        }else if (i == 4){
            
            _cursor.rootScrollView.bounces = NO;
            
            _newAnJianShouXiView = [[JSEIMPNewAnJianShouXiView alloc] init];
            
            _newAnJianShouXiView.beiZhuTextView.delegate = self;
            _newAnJianShouXiView.anJianGongShangTextField.delegate = self;
            _newAnJianShouXiView.wenMingCuoShiTextField.delegate = self;
            _newAnJianShouXiView.anJianYiWaiTextField.delegate = self;
            _newAnJianShouXiView.mobileGPSTextField.delegate = self;
            _newAnJianShouXiView.shiPinTextField.delegate = self;
            
            _scrollView5 = [[UIScrollView alloc] initWithFrame:self.view.frame];
            
            [_scrollView5 addSubview:_newAnJianShouXiView];
            
            [_newAnJianShouXiView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.edges.mas_equalTo(_scrollView5);
                make.width.mas_equalTo(UIScreenW);
                make.bottom.mas_equalTo(_newAnJianShouXiView.beiZhuTextView.mas_bottom).offset(16);
            }];
            
            [pageViews addObject:_scrollView5];
            
        }else if (i == 5){
        
            _cursor.rootScrollView.bounces = NO;
            
            _newShiGongXuKeZhengView = [[JSEIMPNewShiGongXuKeZhengView alloc] init];
            
            _newShiGongXuKeZhengView.beiZhuTextView.delegate = self;
            
            _scrollView6 = [[UIScrollView alloc] initWithFrame:self.view.frame];
            
            [_scrollView6 addSubview:_newShiGongXuKeZhengView];
            
            [_newShiGongXuKeZhengView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.edges.mas_equalTo(_scrollView6);
                make.width.mas_equalTo(UIScreenW);
                make.bottom.mas_equalTo(_newShiGongXuKeZhengView.beiZhuTextView.mas_bottom).offset(16);
                
            }];
            
            [pageViews addObject:_scrollView6];
        }
    
    }

    return pageViews;
}


#pragma mark - <UITextViewDelegate>
-(void)textViewDidChange:(UITextView *)textView{
    
    if (_newZiZhiCheckShouXuView.beiZhuTextView.hasText) {
        
        _newZiZhiCheckShouXuView.beiZhuPlaceLabel.hidden = YES;
    }else if (!_newZiZhiCheckShouXuView.beiZhuTextView.hasText){
        
        _newZiZhiCheckShouXuView.beiZhuPlaceLabel.hidden = NO;
    }
    
    if (_newFaBaoShouXuView.beiZhuTextView.hasText) {
        
        _newFaBaoShouXuView.beiZhuPlaceLabel.hidden = YES;
    }else if (!_newFaBaoShouXuView.beiZhuTextView.hasText){
        
        _newFaBaoShouXuView.beiZhuPlaceLabel.hidden = NO;
    }
    
    if (_newHeTongBeiAnView.beiZhuTextView.hasText) {
        
        _newHeTongBeiAnView.beiZhuPlaceLabel.hidden = YES;
    }else if (!_newHeTongBeiAnView.beiZhuTextView.hasText){
        
        _newHeTongBeiAnView.beiZhuPlaceLabel.hidden = NO;
    }
    
    if (_newZhiJianShouXuView.beiZhuTextView.hasText) {
        
        _newZhiJianShouXuView.beiZhuPlaceLabel.hidden = YES;
    }else if (!_newZhiJianShouXuView.beiZhuTextView.hasText){
        
        _newZhiJianShouXuView.beiZhuPlaceLabel.hidden = NO;
    }
    
    if (_newAnJianShouXiView.beiZhuTextView.hasText) {
        
        _newAnJianShouXiView.beiZhuPlaceLabel.hidden = YES;
    }else if (!_newAnJianShouXiView.beiZhuTextView.hasText){
        
        _newAnJianShouXiView.beiZhuPlaceLabel.hidden = NO;
    }
    
    if (_newShiGongXuKeZhengView.beiZhuTextView.hasText) {
        
        _newShiGongXuKeZhengView.beiZhuPlaceLabel.hidden = YES;
    }else if (!_newShiGongXuKeZhengView.beiZhuTextView.hasText){
        
        _newShiGongXuKeZhengView.beiZhuPlaceLabel.hidden = NO;
    }
    
}

#pragma mark - UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    _newFaBaoShouXuView.projectManagerMenu.mainBtn.enabled = NO;
    _newFaBaoShouXuView.faBaoNoteMenu.mainBtn.enabled = NO;
    _newFaBaoShouXuView.noteStoreMenu.mainBtn.enabled = NO;
    _newFaBaoShouXuView.endDateButton.enabled = NO;
    
    _newAnJianShouXiView.dealDateButton.enabled = NO;
    _newAnJianShouXiView.anJianZiLiaoMenu.mainBtn.enabled = NO;
    _newAnJianShouXiView.anJianNoteMenu.mainBtn.enabled = NO;
    
    [self scrollViewFrameChange];
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    _newFaBaoShouXuView.projectManagerMenu.mainBtn.enabled = YES;
    _newFaBaoShouXuView.faBaoNoteMenu.mainBtn.enabled = YES;
    _newFaBaoShouXuView.noteStoreMenu.mainBtn.enabled = YES;
    _newFaBaoShouXuView.endDateButton.enabled = YES;
    
    _newAnJianShouXiView.dealDateButton.enabled = YES;
    _newAnJianShouXiView.anJianZiLiaoMenu.mainBtn.enabled = YES;
    _newAnJianShouXiView.anJianNoteMenu.mainBtn.enabled = YES;
    
    [self scrollViewFrameRecover];
    
}

#pragma mark - UITextViewDelegate
-(void)textViewDidBeginEditing:(UITextView *)textView{
    
    _newZiZhiCheckShouXuView.projectNameMenu.mainBtn.enabled = NO;
    _newZiZhiCheckShouXuView.endDateButton.enabled = NO;
    _newZiZhiCheckShouXuView.ziZhiCheckBookMenu.mainBtn.enabled = NO;
    
    _newFaBaoShouXuView.projectManagerMenu.mainBtn.enabled = NO;
    _newFaBaoShouXuView.faBaoNoteMenu.mainBtn.enabled = NO;
    _newFaBaoShouXuView.noteStoreMenu.mainBtn.enabled = NO;
    _newFaBaoShouXuView.endDateButton.enabled = NO;
    
    _newHeTongBeiAnView.beiAnHeTongMenu.mainBtn.enabled = NO;
    _newHeTongBeiAnView.xieYiShuMenu.mainBtn.enabled = NO;
    _newHeTongBeiAnView.endDateButton.enabled = NO;
    
    _newZhiJianShouXuView.zhiJianNoteMenu.mainBtn.enabled = NO;
    _newZhiJianShouXuView.endDateButton.enabled = NO;
    
    _newAnJianShouXiView.dealDateButton.enabled = NO;
    _newAnJianShouXiView.anJianZiLiaoMenu.mainBtn.enabled = NO;
    _newAnJianShouXiView.anJianNoteMenu.mainBtn.enabled = NO;
    
    _newShiGongXuKeZhengView.xuKeZhengMenu.mainBtn.enabled = NO;
    _newShiGongXuKeZhengView.endDateButton.enabled = NO;

    
    [self scrollViewFrameChange];
    
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    
    _newZiZhiCheckShouXuView.projectNameMenu.mainBtn.enabled = YES;
    _newZiZhiCheckShouXuView.endDateButton.enabled = YES;
    _newZiZhiCheckShouXuView.ziZhiCheckBookMenu.mainBtn.enabled = YES;
    
    _newFaBaoShouXuView.projectManagerMenu.mainBtn.enabled = YES;
    _newFaBaoShouXuView.faBaoNoteMenu.mainBtn.enabled = YES;
    _newFaBaoShouXuView.noteStoreMenu.mainBtn.enabled = YES;
    _newFaBaoShouXuView.endDateButton.enabled = YES;
    
    _newHeTongBeiAnView.beiAnHeTongMenu.mainBtn.enabled = YES;
    _newHeTongBeiAnView.xieYiShuMenu.mainBtn.enabled = YES;
    _newHeTongBeiAnView.endDateButton.enabled = YES;
    
    _newZhiJianShouXuView.zhiJianNoteMenu.mainBtn.enabled = YES;
    _newZhiJianShouXuView.endDateButton.enabled = YES;
    
    _newAnJianShouXiView.dealDateButton.enabled = YES;
    _newAnJianShouXiView.anJianZiLiaoMenu.mainBtn.enabled = YES;
    _newAnJianShouXiView.anJianNoteMenu.mainBtn.enabled = YES;
    
    _newShiGongXuKeZhengView.xuKeZhengMenu.mainBtn.enabled = YES;
    _newShiGongXuKeZhengView.endDateButton.enabled = YES;
    
    [self scrollViewFrameRecover];
    
}

#pragma mark - ScrollViewFramebianhua
-(void)scrollViewFrameChange{
    
    [_newZiZhiCheckShouXuView mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView1);
        make.width.mas_equalTo(UIScreenW);
        make.bottom.mas_equalTo(_newZiZhiCheckShouXuView.beiZhuTextView.mas_bottom).offset(226);
        
    }];
    
    [_newFaBaoShouXuView mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView2);
        make.width.mas_equalTo(UIScreenW);
        make.bottom.mas_equalTo(_newFaBaoShouXuView.beiZhuTextView.mas_bottom).offset(226);
        
    }];
    
    [_newHeTongBeiAnView mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView3);
        make.width.mas_equalTo(UIScreenW);
        make.bottom.mas_equalTo(_newHeTongBeiAnView.beiZhuTextView.mas_bottom).offset(226);
        
    }];
    
    [_newZhiJianShouXuView mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView4);
        make.width.mas_equalTo(UIScreenW);
        make.bottom.mas_equalTo(_newZhiJianShouXuView.beiZhuTextView.mas_bottom).offset(226);
        
    }];
    
    [_newAnJianShouXiView mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView5);
        make.width.mas_equalTo(UIScreenW);
        make.bottom.mas_equalTo(_newAnJianShouXiView.beiZhuTextView.mas_bottom).offset(226);
        
    }];
    
    [_newShiGongXuKeZhengView mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView6);
        make.width.mas_equalTo(UIScreenW);
        make.bottom.mas_equalTo(_newShiGongXuKeZhengView.beiZhuTextView.mas_bottom).offset(226);
        
    }];
    
}

-(void)scrollViewFrameRecover{
    
    [_newZiZhiCheckShouXuView mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView1);
        make.width.mas_equalTo(UIScreenW);
        make.bottom.mas_equalTo(_newZiZhiCheckShouXuView.beiZhuTextView.mas_bottom).offset(10);
        
    }];
    
    [_newFaBaoShouXuView mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView2);
        make.width.mas_equalTo(UIScreenW);
        make.bottom.mas_equalTo(_newFaBaoShouXuView.beiZhuTextView.mas_bottom).offset(10);
        
    }];
    
    [_newHeTongBeiAnView mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView3);
        make.width.mas_equalTo(UIScreenW);
        make.bottom.mas_equalTo(_newHeTongBeiAnView.beiZhuTextView.mas_bottom).offset(10);
        
    }];
    
    [_newZhiJianShouXuView mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView4);
        make.width.mas_equalTo(UIScreenW);
        make.height.mas_equalTo(UIscreenH);
        
    }];
    
    [_newAnJianShouXiView mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView5);
        make.width.mas_equalTo(UIScreenW);
        make.bottom.mas_equalTo(_newAnJianShouXiView.beiZhuTextView.mas_bottom).offset(10);
        
    }];
    
    [_newShiGongXuKeZhengView mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView6);
        make.width.mas_equalTo(UIScreenW);
        make.height.mas_equalTo(UIscreenH);
        
    }];
    
}

@end
