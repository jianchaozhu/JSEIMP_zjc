//
//  JSEIMPShouKuanJieDianView.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/11/6.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPShouKuanJieDianView.h"
#import <Masonry.h>

#define UIScreenW [UIScreen mainScreen].bounds.size.width
#define UIScreenH [UIScreen mainScreen].bounds.size.height

#define height 180

@implementation JSEIMPShouKuanJieDianView{
    
    UILabel *_label;
    
    UILabel *_label1;
    
    UILabel *_nameLabel;
    
    UILabel *_label2;
    
    UILabel *_baiFenBiLabel;
    
    UILabel *_label3;
    
    UILabel *_jieSuanMoneyLabel;
    
    UILabel *_label4;
    
    UILabel *_planShouKuanDateLabel;
    
    NSInteger _number;

}

-(instancetype)init{

    if (self = [super init]) {
        
        [self setupUI];
        
    }

    return self;
}

-(void)setupUI{

    _number = 8;
    
    _label = [self setupLabelWithText:@"收款条款" Font:[UIFont systemFontOfSize:24] TextColor:[UIColor redColor]];
    
    for (int i = 0; i < _number; i++) {
        
        //名称
        _label1 = [self setupLabelWithText:@"名称" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
        _nameLabel = [self setupLabelWithText:@"付款条款的名称是xxx付款条款的名称是xxx" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
        _nameLabel.numberOfLines = 0;
        _nameLabel.textAlignment = NSTextAlignmentRight;
        //百分比
        _label2 = [self setupLabelWithText:@"百分比(%)" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
        _baiFenBiLabel = [self setupLabelWithText:@"付款条款的百分比是xxx" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
        _baiFenBiLabel.textAlignment = NSTextAlignmentRight;
        //结算金额
        _label3 = [self setupLabelWithText:@"结算金额(元)" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
        _jieSuanMoneyLabel = [self setupLabelWithText:@"126,000,000" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
        _jieSuanMoneyLabel.textAlignment = NSTextAlignmentRight;
        //计划收款日期
        _label4 = [self setupLabelWithText:@"计划收款日期" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
        _planShouKuanDateLabel = [self setupLabelWithText:@"2017-11-02" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
        _planShouKuanDateLabel.textAlignment = NSTextAlignmentRight;
        //横线
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor darkGrayColor];
        [self addSubview:_lineView];
        
        _label1.frame = CGRectMake(16, 60 + i * height, 42, 20);
        if (_nameLabel.text.length < 14) {
            
            _nameLabel.frame = CGRectMake(74, 58 + i * height, UIScreenW - 90, 20);
            _label2.frame = CGRectMake(16, 96 + i * height, 92, 20);
            _baiFenBiLabel.frame = CGRectMake(124, 96 + i * height, UIScreenW - 140, 20);
            _label3.frame = CGRectMake(16, 132 + i * height, 116, 20);
            _jieSuanMoneyLabel.frame = CGRectMake(148, 132 + i * height, UIScreenW - 164, 20);
            _label4.frame = CGRectMake(16, 168 + i * height, 124, 20);
            _planShouKuanDateLabel.frame = CGRectMake(156, 168 + i * height, UIScreenW - 172, 20);
            _lineView.frame = CGRectMake(0, 204 + i * height, UIScreenW, 0.5);
        }else if (_nameLabel.text.length > 14){
            
            _nameLabel.frame = CGRectMake(74, 58 + i * height, UIScreenW - 90, 40);
             _label2.frame = CGRectMake(16, 116 + i * height, 92, 20);
            _baiFenBiLabel.frame = CGRectMake(124, 116 + i * height, UIScreenW - 140, 20);
            _label3.frame = CGRectMake(16, 152 + i * height, 116, 20);
            _jieSuanMoneyLabel.frame = CGRectMake(148, 152 + i * height, UIScreenW - 164, 20);
            _label4.frame = CGRectMake(16, 188 + i * height, 124, 20);
            _planShouKuanDateLabel.frame = CGRectMake(156, 188 + i * height, UIScreenW - 172, 20);
            _lineView.frame = CGRectMake(0, 224 + i * height, UIScreenW, 0.5);
        }
        
        
    }

}

-(void)layoutSubviews{

    [super layoutSubviews];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.mas_top).offset(16);
        make.centerX.mas_equalTo(self.mas_centerX);
        
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
