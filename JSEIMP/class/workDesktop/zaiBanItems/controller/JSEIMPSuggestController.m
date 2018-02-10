//
//  JSEIMPSuggestController.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/1/25.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPSuggestController.h"
#import "JSEIMPNextDealPeopleController.h"

@interface JSEIMPSuggestController ()<UITextViewDelegate>

@property(nonatomic,strong)NSString *textViewText;

@end

@implementation JSEIMPSuggestController{
    
    UITextView *_suggestTextView;
    
    UILabel *_suggestPlaceLabel;
    
    UIView *_touchView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"请填写您的意见";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *sureButton = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(clickSureButton:)];
    
    self.navigationItem.rightBarButtonItem = sureButton;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
    [self setupUI];
}

-(void)returnAction{
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setupUI{
    
    _touchView = [self setupTouchViewWithAction:@selector(touchEvent)];
    
    _suggestTextView = [self setupTextView];
    _suggestPlaceLabel = [self setupPlaceLabelWithText:@"请填写您的意见" Font:[UIFont systemFontOfSize:16]];
    [_suggestTextView addSubview:_suggestPlaceLabel];
    
    [_touchView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.bottom.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view.mas_centerX);
    }];
    
    [_suggestTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.view.mas_top).offset(80);
        make.left.mas_equalTo(self.view.mas_left).offset(16);
        make.right.mas_equalTo(self.view.mas_right).offset(-16);
        make.height.mas_equalTo(120);
        
    }];
    [_suggestPlaceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_suggestTextView.mas_top).offset(8);
        make.left.mas_equalTo(_suggestTextView.mas_left).offset(6);
    }];
}

-(void)clickSureButton:(UIButton *)button{
    
    JSEIMPNextDealPeopleController *nextDealPeopleController = [JSEIMPNextDealPeopleController new];
    
    nextDealPeopleController.processInstanceId = _processInstanceId;
    nextDealPeopleController.activityDefinitionId = _targetActivityId;
    nextDealPeopleController.activityId = _activityId;
    nextDealPeopleController.option = _textViewText;
    
    [self.navigationController pushViewController:nextDealPeopleController animated:YES];
}

-(void)touchEvent{
    
    [self.view endEditing:YES];
}

#pragma mark - <UITextViewDelegate>
-(void)textViewDidChange:(UITextView *)textView{
    
    _textViewText = textView.text;
    
    if (_suggestTextView.hasText) {
        
        _suggestPlaceLabel.hidden = YES;
        
    }else if (!_suggestTextView.hasText){
        
        _suggestPlaceLabel.hidden = NO;
    }
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
    
    [self.view addSubview:textView];
    
    return textView;
    
}

-(UILabel *)setupPlaceLabelWithText:(NSString *)text Font:(UIFont *)font{
    
    UILabel *label = [[UILabel alloc] init];
    
    label.text = text;
    label.font = font;
    label.textColor = [UIColor colorWithRed:190.0 / 255.0 green:190.0 / 255.0 blue:190.0 / 255.0 alpha:1];
    
    return label;
    
}

-(UIView *)setupTouchViewWithAction:(SEL)action{
    
    UIView *view = [UIView new];
    
    view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:view];
    
    //点击手势
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:action];
    
    [view addGestureRecognizer:tapGestureRecognizer];
    
    return view;
}

@end
