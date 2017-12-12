//
//  JSEIMPProjectJiangXiangDetailModel.h
//  JSEIMP
//
//  Created by 朱建超 on 2017/11/28.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProjectJiangXiangDetailModel : NSObject
//发证时间
@property(nonatomic,strong)NSString *AwardDate;
//奖项名称
@property(nonatomic,strong)NSString *AwardName;
//奖项等级
@property(nonatomic,strong)NSString *Level;

@end

@interface JSEIMPProjectJiangXiangDetailModel : NSObject

@property(nonatomic,strong)NSMutableArray<ProjectJiangXiangDetailModel *> *AwardDetails;

@property(nonatomic,assign)NSInteger Code;

@end
