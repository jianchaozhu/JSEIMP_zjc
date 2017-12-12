//
//  JSEIIMPNewHeTongBeiAnView.h
//  JSEIMP
//
//  Created by 朱建超 on 2017/10/19.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMJDropdownMenu.h"

@interface JSEIIMPNewHeTongBeiAnView : UIView

@property(nonatomic,strong)UITextView *beiZhuTextView;

@property(nonatomic,strong)UILabel *beiZhuPlaceLabel;

@property(nonatomic,strong)LMJDropdownMenu *beiAnHeTongMenu;

@property(nonatomic,strong)LMJDropdownMenu *xieYiShuMenu;

@property(nonatomic,strong)UIButton *endDateButton;

@end
