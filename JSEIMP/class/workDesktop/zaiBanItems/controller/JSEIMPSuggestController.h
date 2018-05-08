//
//  JSEIMPSuggestController.h
//  JSEIMP
//
//  Created by 朱建超 on 2018/1/25.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSEIMPSuggestController : UIViewController

@property(nonatomic,assign)NSInteger processInstanceId;

@property(nonatomic,strong)NSString *targetActivityId;

@property(nonatomic,assign)NSInteger activityId;
//下移节点岗位名
@property(nonatomic,strong)NSString *name;

@end
