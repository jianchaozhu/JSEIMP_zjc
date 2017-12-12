//
//  JSEIMPProjectDetailModel.h
//  JSEIMP
//
//  Created by 朱建超 on 2017/11/24.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProjectDetailModel : NSObject

@property(nonatomic,strong)NSString *PROJECTID;

@property(nonatomic,strong)NSString *PROJECTCODE;

@property(nonatomic,strong)NSString *PROJECTNAME;

@property(nonatomic,strong)NSString *ADDRESS;
//建设单位
@property(nonatomic,strong)NSString *OWNER;
//规模
@property(nonatomic,strong)NSString *SIZE;
//资金来源
@property(nonatomic,strong)NSString *FINANCIALSOURCE;
//招标模式
@property(nonatomic,strong)NSString *MODE;
//介绍人
@property(nonatomic,strong)NSString *CONTRACT;
//投标人
@property(nonatomic,strong)NSString *APPLYER;
//是否中标
@property(nonatomic,strong)NSString *BIDRESULT;
//说明
@property(nonatomic,strong)NSString *COMMENT;

@end

@interface JSEIMPProjectDetailModel : NSObject

@property(nonatomic,strong)ProjectDetailModel *ProjectDetails;

@property(nonatomic,assign)NSInteger Code;

@end
