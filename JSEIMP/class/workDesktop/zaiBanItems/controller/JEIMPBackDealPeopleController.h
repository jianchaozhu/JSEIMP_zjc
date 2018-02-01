//
//  JEIMPBackDealPeopleController.h
//  JSEIMP
//
//  Created by 朱建超 on 2018/1/30.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JEIMPBackDealPeopleController : UIViewController
//userID
@property(nonatomic,strong)NSMutableArray *userIdMArray;
//returnReason
@property(nonatomic,strong)NSString *reason;
//activityId
@property(nonatomic,assign)NSInteger activityId;
//returnTargetActivityInstanceId
@property(nonatomic,assign)NSInteger returnTargetActivityInstanceId;

@end
