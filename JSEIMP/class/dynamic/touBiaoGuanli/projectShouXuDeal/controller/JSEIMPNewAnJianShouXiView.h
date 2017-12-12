//
//  JSEIMPNewAnJianShouXiView.h
//  JSEIMP
//
//  Created by 朱建超 on 2017/10/19.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMJDropdownMenu.h"

@interface JSEIMPNewAnJianShouXiView : UIView

@property(nonatomic,strong)UIButton *dealDateButton;

@property(nonatomic,strong)UITextField *anJianYiWaiTextField;

@property(nonatomic,strong)UITextField *anJianGongShangTextField;

@property(nonatomic,strong)UITextField *wenMingCuoShiTextField;

@property(nonatomic,strong)UITextField *mobileGPSTextField;

@property(nonatomic,strong)UITextField *shiPinTextField;

@property(nonatomic,strong)LMJDropdownMenu *anJianZiLiaoMenu;

@property(nonatomic,strong)LMJDropdownMenu *anJianNoteMenu;

@property(nonatomic,strong)UITextView *beiZhuTextView;

@property(nonatomic,strong)UILabel *beiZhuPlaceLabel;

@end
