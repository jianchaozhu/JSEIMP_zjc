//
//  JSEIMPProjectJiangXiangModel.h
//  JSEIMP
//
//  Created by 朱建超 on 2017/11/28.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProjectJiangXiangListModel : NSObject
//项目数量
@property(nonatomic,strong)NSString *AwardCount;

@property(nonatomic,strong)NSString *ProjectId;

@property(nonatomic,strong)NSString *ProjectName;

@end

@interface JSEIMPProjectJiangXiangModel : NSObject

@property(nonatomic,strong)NSMutableArray<ProjectJiangXiangListModel *> *AwardList;

@property(nonatomic,assign)NSInteger Code;

@end
