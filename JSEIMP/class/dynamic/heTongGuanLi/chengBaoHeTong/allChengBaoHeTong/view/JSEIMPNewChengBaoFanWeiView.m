//
//  JSEIMPNewChengBaoFanWeiView.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/11/15.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPNewChengBaoFanWeiView.h"
#import <Masonry.h>

@interface JSEIMPNewChengBaoFanWeiView ()<UITextViewDelegate>

@end

@implementation JSEIMPNewChengBaoFanWeiView{

    UILabel *_label1;
    
    UIView *_touchView1;
    
    UIView *_touchView2;
    
}

-(instancetype)init{

    if (self = [super init]) {
        
        [self setupUI];
    }

    return self;
}

-(void)setupUI{

    _touchView1 = [self setupTouchView];
    _touchView2 = [self setupTouchView];
    
    _label1 = [self setupLabelWithText:@"承包工程内容及范围" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _chengBaoFanTextView = [self setupTextView];
    _chengBaoFanWeiPlaceLabel = [self setupPlaceLabelWithText:@"请填写承包工程内容及范围" Font:[UIFont systemFontOfSize:16]];
    [_chengBaoFanTextView addSubview:_chengBaoFanWeiPlaceLabel];

}

-(void)layoutSubviews{

    [super layoutSubviews];
    
    [_touchView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.bottom.mas_equalTo(self);
        make.right.mas_equalTo(_label1.mas_left);
        
    }];
    
    [_touchView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.right.bottom.mas_equalTo(self);
        make.left.mas_equalTo(_label1.mas_right);
        
    }];
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.mas_top).offset(16);
        make.centerX.mas_equalTo(self.mas_centerX);
        
    }];
    [_chengBaoFanTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label1.mas_bottom).offset(16);
        make.left.mas_equalTo(self.mas_left).offset(16);
        make.right.mas_equalTo(self.mas_right).offset(-16);
        make.height.mas_equalTo(200);
        
    }];
    [_chengBaoFanWeiPlaceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.top.mas_equalTo(_chengBaoFanTextView.mas_top).offset(8);
        make.left.mas_equalTo(_chengBaoFanTextView.mas_left).offset(6);
        
    }];

}

#pragma mark - 触摸事件
-(void)touchEvent{
    
    [self endEditing:YES];
    
}

#pragma mark - <UITextViewDelegate>
-(void)textViewDidChange:(UITextView *)textView{
    
    if (_chengBaoFanTextView.hasText) {
        
        _chengBaoFanWeiPlaceLabel.hidden = YES;
    }else if (!_chengBaoFanTextView.hasText){
        
        _chengBaoFanWeiPlaceLabel.hidden = NO;
    }

}

#pragma mark - UITextViewDelegate
-(void)textViewDidBeginEditing:(UITextView *)textView{
    
    if (self.delagete && [self.delagete respondsToSelector:@selector(changeScrollViewFrame)]) {
        
        [self.delagete changeScrollViewFrame];
    }
}

-(void)textViewDidEndEditing:(UITextView *)textView{

    if (self.delagete && [self.delagete respondsToSelector:@selector(recoverScrollViewFrame)]) {
        
        [self.delagete recoverScrollViewFrame];
    }

}

-(UILabel *)setupLabelWithText:(NSString *)text Font:(UIFont *)font TextColor:(UIColor *)textColor{
    
    UILabel *label = [[UILabel alloc] init];

    label.text = text;
    label.font = font;
    label.textColor = textColor;
    
    [self addSubview:label];
    
    return label;
    
}

-(UITextView *)setupTextView{
    
    UITextView *textView = [UITextView new];
    
    textView.layer.borderWidth = 0.5;
    textView.delegate = self;
    //内容可以拖拽
    textView.alwaysBounceVertical = YES;
    //关闭键盘
    textView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    textView.font = [UIFont systemFontOfSize:16];
    textView.textColor = [UIColor darkGrayColor];
    
    [self addSubview:textView];
    
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
    
    [self addSubview:view];
    
    //点击手势
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchEvent)];
    
    [view addGestureRecognizer:tapGestureRecognizer];
    
    return view;
    
}

@end
