//
//  JSEIMPTouBiaoBaoZhengJinModel.h
//  JSEIMP
//
//  Created by 朱建超 on 2017/11/25.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TouBiaoBaoZhengJinListModel : NSObject

//保证金金额
@property(nonatomic,strong)NSString *DepositAmount;

@property(nonatomic,strong)NSString *DepositId;

@property(nonatomic,strong)NSString *ProjectName;

@end

@interface JSEIMPTouBiaoBaoZhengJinModel : NSObject

@property(nonatomic,strong)NSMutableArray<TouBiaoBaoZhengJinListModel *> *DepositList;

@property(nonatomic,assign)NSInteger Code;

@end
