//
//  JSEIMPCheHuiReasonController.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/2/1.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPCheHuiReasonController.h"
#import "JSEIMPNetWorking.h"
#import "JSEIMPWorkDesktopController.h"
#import <Masonry.h>

@interface JSEIMPCheHuiReasonController ()<UITextViewDelegate>

@property(nonatomic,strong)NSString *textViewText;

@end

@implementation JSEIMPCheHuiReasonController{
    
    UITextView *_cheHuiReasonTextView;
    
    UILabel *_cheHuiReasonPlaceLabel;
    
    UIView *_touchView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"撤回原因";
    
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
    
    _cheHuiReasonTextView = [self setupTextView];
    _cheHuiReasonPlaceLabel = [self setupPlaceLabelWithText:@"请填写撤回原因" Font:[UIFont systemFontOfSize:16]];
    [_cheHuiReasonTextView addSubview:_cheHuiReasonPlaceLabel];
    
    [_touchView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.bottom.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view.mas_centerX);
    }];
    
    [_cheHuiReasonTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.view.mas_top).offset(80);
        make.left.mas_equalTo(self.view.mas_left).offset(16);
        make.right.mas_equalTo(self.view.mas_right).offset(-16);
        make.height.mas_equalTo(120);
        
    }];
    [_cheHuiReasonPlaceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_cheHuiReasonTextView.mas_top).offset(8);
        make.left.mas_equalTo(_cheHuiReasonTextView.mas_left).offset(6);
    }];
}

-(void)clickSureButton:(UIButton *)button{

    [JSEIMPNetWorking PostCheHuikStepWithActivityId:_activityId RevokeBackReason:_textViewText OnSuccess:^{
        
        for(UIViewController *controller in self.navigationController.viewControllers) {
            
            if([controller isKindOfClass:[JSEIMPWorkDesktopController class]]) {
                
                [self.navigationController popToViewController:controller animated:YES];
            }
        }
    } onErrorInfo:nil];
}

-(void)touchEvent{
    
    [self.view endEditing:YES];
}

#pragma mark - <UITextViewDelegate>
-(void)textViewDidChange:(UITextView *)textView{
    
    _textViewText = textView.text;
    
    if (_cheHuiReasonTextView.hasText) {
        
        _cheHuiReasonPlaceLabel.hidden = YES;
        
    }else if (!_cheHuiReasonTextView.hasText){
        
        _cheHuiReasonPlaceLabel.hidden = NO;
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
