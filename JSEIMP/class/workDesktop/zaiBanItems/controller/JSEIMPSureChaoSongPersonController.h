//
//  JSEIMPSureChaoSongPersonController.h
//  JSEIMP
//
//  Created by 朱建超 on 2018/3/21.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSEIMPSureChaoSongPersonController : UIViewController

@property (nonatomic,strong)NSMutableArray *selectUserNameMArray;//前控制器选中的userName数据

@property(nonatomic,strong)NSMutableArray *selectUserIdMArray;//前控制器选中的userId数据

@property(nonatomic,assign)NSInteger activityId;

@end
