//
//  JSEIMPTouBiaoGuanLiEditView.h
//  JSEIMP
//
//  Created by 朱建超 on 2017/11/16.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JSEIMPTouBiaoGuanLiEditViewDelagate <NSObject>

//跳转到录入中标通知书控制器
-(void)pushToZhongBiaoTongZhiShuController;

@end

@interface JSEIMPTouBiaoGuanLiEditView : UIView

@property(nonatomic,weak)id<JSEIMPTouBiaoGuanLiEditViewDelagate> delegate;

@end
