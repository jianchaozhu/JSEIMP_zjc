//
//  JSEIMPNewZiZhiCheckShouXuView.h
//  JSEIMP
//
//  Created by 朱建超 on 2017/10/18.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMJDropdownMenu.h"

@interface JSEIMPNewZiZhiCheckShouXuView : UIView

@property(nonatomic,strong)NSMutableArray *projectNameMArray;

@property(nonatomic,strong)UITextView *beiZhuTextView;

@property(nonatomic,strong)LMJDropdownMenu *projectNameMenu;

@property(nonatomic,strong)UILabel *beiZhuPlaceLabel;

@property(nonatomic,strong)UIButton *endDateButton;

@property(nonatomic,strong)LMJDropdownMenu *ziZhiCheckBookMenu;

@end
