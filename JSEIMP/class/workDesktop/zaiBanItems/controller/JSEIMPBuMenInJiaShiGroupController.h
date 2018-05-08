//
//  JSEIMPBuMenInJiaShiGroupController.h
//  JSEIMP
//
//  Created by 朱建超 on 2018/3/28.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSEIMPBuMenInJiaShiGroupController : UIViewController

@property(nonatomic,strong)NSString *vcTitle;

@property(nonatomic,strong)NSString *buttonText;

@property(nonatomic,assign)NSInteger activityId;

@property(nonatomic,strong)NSString *option;

@property (nonatomic,strong)NSMutableArray *selectUserNameMArray;//存放选中数据的userName

@property(nonatomic,strong)NSMutableArray *selectUserIdMArray;//存放选中数据的userId

@end
