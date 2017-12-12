//
//  JSEIMPPropjectChengBaoFanWeiView.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/11/6.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPPropjectChengBaoFanWeiView.h"
#import <Masonry.h>

@interface JSEIMPPropjectChengBaoFanWeiView ()

@property(nonatomic,strong)NSString *chengBaoFanWei;

@end

@implementation JSEIMPPropjectChengBaoFanWeiView{

    UILabel *_label1;

}

-(instancetype)init{

    if (self = [super init]) {
        
        [self setupUI];
        
    }
    
    return self;
}

-(void)setupUI{
    
    //注册通知
    [self setNotification];
    
    _label1 = [self setupLabelWithText:@"承包工程内容及范围" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    
}

-(void)setNotification{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(chengBaoFanWei:) name:@"chengBaoFanWei" object:nil];
    
}

-(void)chengBaoFanWei:(NSNotification *)notification{
    
    _chengBaoFanWei = notification.object;
    
    _projectContentLabel = [self setupLabelWithText:_chengBaoFanWei Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _projectContentLabel.numberOfLines = 0;
}

-(void)layoutSubviews{

    [super layoutSubviews];
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.mas_top).offset(16);
        make.centerX.mas_equalTo(self.mas_centerX);
        
    }];
    
    [_projectContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label1.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_label1.mas_centerX);
        make.left.mas_equalTo(self.mas_left).offset(16);
        make.right.mas_equalTo(self.mas_right).offset(-16);
        
    }];

}

-(UILabel *)setupLabelWithText:(NSString *)text Font:(UIFont *)font TextColor:(UIColor *)textColor{
    
    UILabel *label = [[UILabel alloc] init];
    
    label.text = text;
    label.font = font;
    label.textColor = textColor;
    
    [self addSubview:label];
    
    return label;
    
}

@end
