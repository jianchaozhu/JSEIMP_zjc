//
//  JSEIMPNetWorking.h
//  loginTest
//
//  Created by 朱建超 on 2017/11/2.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSEIMPServerInfo.h"
#import "JSEIMPError.h"

@interface JSEIMPNetWorking : NSObject
/*
 登录，返回错误信息和数据，如果错误信息为空，那么可以进行操作了
 username : 用户名
 password : 密码
 onSuccess : block回调
 onError : 访问发生错误时回调
 */
+(void)loginWithServerByUserName:(NSString *)username password:(NSString *)password
                       onSuccess:(void(^)())response onError:(void(^)(JSEIMPError code))errorCode;

/*
 从userDefaults获取用户名和密码自动登录
 
 */
+(void)loginWithUserDefaults:(void(^)())response onError:(void(^)(JSEIMPError code))errorCode;

//获得投标项目列表
+(void)getTouBiaoListOnSuccess:(void(^)())response onErrorInfo:(void(^)())errorInfo;

//获得投标项目明细
+(void)getTouBiaoDetailListWithProjectID:(NSString *)projectID OnSuccess:(void(^)())response onErrorInfo:(void(^)())errorInfo;

//获得投标保证金列表
+(void)getTouBiaoBaoZhengJinOnSuccess:(void(^)())response onErrorInfo:(void(^)())errorInfo;

//获得投标保证金明细
+(void)getTouBiaoBaoZhengJinDetailWithDepositId:(NSString *)depositId OnSuccess:(void(^)())response onErrorInfo:(void(^)())errorInfo;

//获得农名工保证金列表
+(void)getFarmerBaoZhengJinOnSuccess:(void(^)())response onErrorInfo:(void(^)())errorInfo;

//获得农名工保证金明细
+(void)getFarmerBaoZhengJinDetailWithDepositId:(NSString *)depositId OnSuccess:(void(^)())response onErrorInfo:(void(^)())errorInfo;

//获得项目奖项列表
+(void)getProjectJiangXiangOnSuccess:(void(^)())response onErrorInfo:(void(^)())errorInfo;

//获得项目奖项明细
+(void)getProjectJiangXiangDetailWithProjectId:(NSString *)projectId OnSuccess:(void(^)())response onErrorInfo:(void(^)())errorInfo;

//获得总承包合同列表
+(void)getAllChengBaoHeTongOnSuccess:(void(^)())response onErrorInfo:(void(^)(JSEIMPError))errorInfo;

//获得总承包合同明细
+(void)getAllChengBaoHeTongDetailWithContractId:(NSString *)contractId OnSuccess:(void(^)())response onErrorInfo:(void(^)())errorInfo;

//获得专业承包合同列表
+(void)getZhuanYeChengBaoHeTongOnSuccess:(void(^)())response onErrorInfo:(void(^)(JSEIMPError))errorInfo;

//获得专业承包合同明细
+(void)getZhuanYeChengBaoHeTongDetailWithContractId:(NSString *)contractId OnSuccess:(void(^)())response onErrorInfo:(void(^)())errorInfo;

//获得专业分包合同列表
+(void)getZhuanYeFenBaoHeTongOnSuccess:(void(^)())response onErrorInfo:(void(^)(JSEIMPError))errorInfo;

//获得专业分包合同明细
+(void)getZhuanYeFenBaoHeTongDetailWithContractId:(NSString *)contractId OnSuccess:(void(^)())response onErrorInfo:(void(^)())errorInfo;

//获得采购合同列表
+(void)getCaiGouHeTongOnSuccess:(void(^)())response onErrorInfo:(void(^)(JSEIMPError))errorInfo;

//获得采购合同明细
+(void)getCaiGouHeTongDetailWithContractId:(NSString *)contractId OnSuccess:(void(^)())response onErrorInfo:(void(^)())errorInfo;

//获得劳务分包合同列表
+(void)getLaoWuFenBaoHeTongOnSuccess:(void(^)())response onErrorInfo:(void(^)(JSEIMPError))errorInfo;

//获得劳务分包合同明细
+(void)getLaoWuFenBaoHeTongDetailWithContractId:(NSString *)contractId OnSuccess:(void(^)())response onErrorInfo:(void(^)())errorInfo;

//获得设备租赁合同列表
+(void)getSheBeiZuLinHeTongOnSuccess:(void(^)())response onErrorInfo:(void(^)(JSEIMPError))errorInfo;

//获得设备租赁合同明细
+(void)getSheBeiZuLinHeTongDetailWithContractId:(NSString *)contractId OnSuccess:(void(^)())response onErrorInfo:(void(^)())errorInfo;

//获得其他收入合同列表
+(void)getOtherShouRuHeTongOnSuccess:(void(^)())response onErrorInfo:(void(^)(JSEIMPError))errorInfo;

//获得待办事项列表
+(void)getDaiBanItemOnSuccess:(void(^)())response onErrorInfo:(void(^)(JSEIMPError error))errorInfo;

//获得待办事项详情
+(void)getDaiBanItemDetailWithContractID:(NSString *)contractId OnSuccess:(void(^)())response onErrorInfo:(void(^)())errorInfo;

//获得在办事项列表
+(void)getZaiBanItemOnSuccess:(void(^)())response onErrorInfo:(void(^)(JSEIMPError error))errorInfo;

//获得已办事项列表
+(void)getYiBanItemOnSuccess:(void(^)())response onErrorInfo:(void(^)(JSEIMPError error))errorInfo;

//合同签收
+(void)PostQianShouWithActivityId:(NSInteger)activityId OnSuccess:(void(^)())response onErrorInfo:(void(^)())errorInfo;

//点击合同同意，获取targetActivityId和activityId
+(void)GetTatgetActivityIdWithActivityId:(NSInteger)activityId OnSuccess:(void(^)())response onErrorInfo:(void(^)())errorInfo;

//点击建议VC里的确定，获得允许的操作人
+(void)getCaoZuoPeopleWithProcessInstanceId:(NSInteger)processInstanceId ActivityDefinitionId:(NSString *)activityDefinitionId OnSuccess:(void(^)())response onErrorInfo:(void(^)())errorInfo;

//选择完项目经理，点击确定之后同意发送到下一步
+(void)PostToNextStepWithCurrentActivityId:(NSInteger)currentActivityId TargetActivityId:(NSString *)targetActivityId ActivityId:(NSString *)activityId UserId:(NSString *)userId LoginId:(NSString *)loginId UserName:(NSString *)userName UserStationId:(NSString *)userStationId UserUnitId:(NSString *)userUnitId RoleId:(NSString *)roleId Opinion:(NSString *)opinion OnSuccess:(void(^)())response onErrorInfo:(void(^)())errorInfo;

//在办中点击退回上一步，获得userId和returnTargetActivityInstanceId
+(void)getUserIdAndReturnTargetActivityInstanceIdWithActivityId:(NSInteger)activityId OnSuccess:(void(^)())response onErrorInfo:(void(^)())errorInfo;

//最后点确定的退回操作
+(void)PostComeBackPeopleStepWithActivityInstanceId:(NSInteger)activityInstanceId ReturnTargetActivityInstanceId:(NSInteger)returnTargetActivityInstanceId ReturnReason:(NSString *)returnReason UserId:(NSString *)userId LoginId:(NSString *)loginId UserName:(NSString *)userName UserStationId:(NSString *)userStationId UserUnitId:(NSString *)userUnitId RoleId:(NSString *)roleId OnSuccess:(void(^)())response onErrorInfo:(void(^)())errorInfo;

//写完退回原因，点击确定获取退回的用户信息
+(void)getUserInfoWithUserId:(NSString *)userId OnSuccess:(void(^)())response onErrorInfo:(void(^)())errorInfo;

//撤回操作
+(void)PostCheHuikStepWithActivityId:(NSInteger)activityId RevokeBackReason:(NSString *)revokeBackReason OnSuccess:(void(^)())response onErrorInfo:(void(^)())errorInfo;

//获得大象云Token
+(void)getDaXiangYunTokenwithSuccessBlock:(void(^)())response;

@end
