//
//  JSEIMPNetWorking.h
//  loginTest
//
//  Created by 朱建超 on 2017/11/2.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
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

//获得待办事项列表
+(void)getDaiBanItemOnSuccess:(void(^)())response onErrorInfo:(void(^)(JSEIMPError error))errorInfo;

@end
