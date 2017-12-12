//
//  JSEIMPNewFaBaoShouXuView.h
//  JSEIMP
//
//  Created by 朱建超 on 2017/10/18.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMJDropdownMenu.h"

@interface JSEIMPNewFaBaoShouXuView : UIView

@property(nonatomic,strong)UITextView *beiZhuTextView;

@property(nonatomic,strong)UILabel *beiZhuPlaceLabel;

@property(nonatomic,strong)LMJDropdownMenu *projectManagerMenu;

@property(nonatomic,strong)LMJDropdownMenu *faBaoNoteMenu;

@property(nonatomic,strong)LMJDropdownMenu *noteStoreMenu;

@property(nonatomic,strong)UIButton *endDateButton;

@property(nonatomic,strong)UITextField *jiaoYiMoneyTextField;

@end
