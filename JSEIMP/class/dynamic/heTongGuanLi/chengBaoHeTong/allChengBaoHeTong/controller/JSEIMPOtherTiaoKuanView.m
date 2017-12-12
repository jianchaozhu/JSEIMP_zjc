//
//  JSEIMPOtherTiaoKuanView.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/11/7.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPOtherTiaoKuanView.h"
#import <Masonry.h>

@interface JSEIMPOtherTiaoKuanView ()

@property(nonatomic,strong)NSString *otherTiaoKuan;

@end

@implementation JSEIMPOtherTiaoKuanView{
    
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
    
    _label1 = [self setupLabelWithText:@"其他条款" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    
}

-(void)setNotification{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(qualityTiaoKuan:) name:@"otherTiaoKuan" object:nil];
    
}

-(void)qualityTiaoKuan:(NSNotification *)notification{
    
    _otherTiaoKuan = notification.object;
    
    _otherTiaoKuanLabel = [self setupLabelWithText:_otherTiaoKuan Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _otherTiaoKuanLabel.numberOfLines = 0;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(self.mas_top).offset(16);
        
    }];
    
    [_otherTiaoKuanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label1.mas_bottom).offset(16);
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
