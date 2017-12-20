//
//  JSEIMPCalculateMethodView.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/12/18.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPCalculateMethodView.h"
#import <Masonry.h>

@interface JSEIMPCalculateMethodView ()

@property(nonatomic,strong)NSString *calculateMethod;

@end

@implementation JSEIMPCalculateMethodView{
    
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
    
    _label1 = [self setupLabelWithText:@"承包工程款计算方法" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
}

-(void)setNotification{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(calculateMethod:) name:@"calculateMethod" object:nil];
    
}

-(void)calculateMethod:(NSNotification *)notification{
    
    _calculateMethod = notification.object;
    
    _calculateMethodLabel = [self setupLabelWithText:_calculateMethod Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _calculateMethodLabel.numberOfLines = 0;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.mas_top).offset(16);
        make.centerX.mas_equalTo(self.mas_centerX);
        
    }];
    
    [_calculateMethodLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
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
