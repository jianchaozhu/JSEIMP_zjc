//
//  JSEIMPTouBiaoProjectListModel.h
//  JSEIMP
//
//  Created by 朱建超 on 2017/11/24.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProjectListModel : NSObject

@property(nonatomic,strong)NSString *ProjectId;

@property(nonatomic,strong)NSString *ProjectName;

@property(nonatomic,strong)NSString *ProjectCode;

@end

@interface JSEIMPTouBiaoProjectListModel : NSObject

@property(nonatomic,strong)NSMutableArray<ProjectListModel *> *ProjectList;

@property(nonatomic,assign)NSInteger Code;

@end
