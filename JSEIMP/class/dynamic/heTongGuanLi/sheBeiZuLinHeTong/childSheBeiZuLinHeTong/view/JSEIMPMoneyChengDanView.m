//
//  JSEIMPMoneyChengDanView.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/3/5.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPMoneyChengDanView.h"
#import <Masonry.h>

@interface JSEIMPMoneyChengDanView ()

@property(nonatomic,strong)NSString *moneyChengDan;

@end

@implementation JSEIMPMoneyChengDanView{
    
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
    
    _label1 = [self setupLabelWithText:@"租赁设备的运输安装、拆卸、检测、验收的费用承担" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label1.numberOfLines = 0;
}

-(void)setNotification{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moneyChengDan:) name:@"moneyChengDan" object:nil];
    
}

-(void)moneyChengDan:(NSNotification *)notification{
    
    _moneyChengDan = notification.object;
    
    _moneyChengDanLabel = [self setupLabelWithText:_moneyChengDan Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _moneyChengDanLabel.numberOfLines = 0;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.mas_top).offset(16);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_equalTo(260);
    }];
    
    [_moneyChengDanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
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
