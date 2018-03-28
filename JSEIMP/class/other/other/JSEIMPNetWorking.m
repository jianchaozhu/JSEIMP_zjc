//
//  JSEIMPNetWorking.m
//  loginTest
//
//  Created by 朱建超 on 2017/11/2.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPNetWorking.h"
#import <MJExtension.h>
#import "JSEIMPTouBiaoProjectListModel.h"
#import "JSEIMPProjectDetailModel.h"
#import "JSEIMPTouBiaoBaoZhengJinModel.h"
#import "JSEIMPTouBiaoBaoZhengJinDetailModel.h"
#import "JSEIMPFarmerBaoZhengJinModel.h"
#import "JSEIMPFarmerBaoZhengJinDetailModel.h"
#import "JSEIMPProjectJiangXiangModel.h"
#import "JSEIMPProjectJiangXiangDetailModel.h"
#import "JSEIMPTokenModel.h"
#import "JSEIMPAllChengBaoHeTongModel.h"
#import "JSEIMPAllChengBaoHeTongDetailModel.h"
#import "JSEIMPZhuanYeChengBaoHeTongModel.h"
#import "JSEIMPZhuanYeFenBaoHeTongModel.h"
#import "JSEIMPZhuanYeFenBaoHeTongDetailModel.h"
#import "JSEIMPCaiGouHeTongModel.h"
#import "JSEIMPCaiGouHeTongDetailModel.h"
#import "JSEIMPDaiBanItemsModel.h"
#import "JSEIMPDaiBanItemDetailModel.h"
#import "JSEIMPGetTargetActivityIdModel.h"
#import "JSEIMPZaiBanItemsModel.h"
#import "JSEIMPCaoZuoPeopleModel.h"
#import "JSEIMPYiBanItemsModel.h"
#import "JSEIMPGetUserIdModel.h"
#import "JSEIMPBackUserInfoModel.h"
#import "JSEIMPLaoWuFenBaoHeTongModel.h"
#import "JSEIMPLaoWuFenBaoHeTongDetailModel.h"
#import "JSEIMPSheBeiZuLinHeTongModel.h"
#import "JSEIMPSheBeiZuLinHeTongDetailModel.h"
#import "JSEIMPOtherShouRuHeTongModel.h"
#import "JSEIMPOtherShouRuHeTongDetailModel.h"
#import "JSEIMPBuMenModel.h"
#import "JSEIMPUserModel.h"
#import "JSEIMPError.h"

@implementation JSEIMPNetWorking

//错误信息
+(JSEIMPError)transErrorTask:(NSError *)error{
    if (error != nil){
        NSHTTPURLResponse *resp = error.userInfo[AFNetworkingOperationFailingURLResponseErrorKey];
        
        NSLog(@"%@",error);
        
        NSLog(@"%zd",resp.statusCode);
        if (error.code == -1009) {
            return noNet; //无网络访问
        } else if (resp.statusCode == 500) {
            return error_500;//用户名或密码错误
        } else if(resp.statusCode == 400){
            return error_400;//用户名或密码错误
        }else{
            return otherError;
        }
    }
    return noError;
}

//生成请求统一header
+(void)setPublicHeader:(AFHTTPSessionManager *)manager{
    
    NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
    
    NSString *string = [NSString stringWithFormat:@"Bearer %@",[data objectForKey:@"userToken"]];
    
    [manager.requestSerializer setValue:string forHTTPHeaderField:@"Authorization"];
}

//系统登录
+(void)loginWithServerByUserName:(NSString *)username password:(NSString *)password onSuccess:(void (^)())response onError:(void (^)(JSEIMPError))errorCode{
    [self loginWithServer:username password:password UserToken:nil response:response onError:errorCode];
    [self loginWithServerBeforeClearUserDefault];
}
+(void)loginWithServerBeforeClearUserDefault{
    NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
    [data removeObjectForKey:@"username"];
    [data removeObjectForKey:@"password"];
    [data removeObjectForKey:@"userToken"];
}
//登录接口
+(void)loginWithServer:(NSString *)username password:(NSString *)password UserToken:(NSString *)userToken response:(void (^)())responseOJ onError:(void (^)(JSEIMPError))errorCode{
    
    NSDictionary *parameters = @{@"grant_type":@"password",
                                 @"username":username,
                                 @"password":password,
                                 @"client_id":@"ro.client",
                                 @"client_secret":@"secret",
                                 @"scope":@"openid"};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //转换content-Type要用下面的request
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//    [self setPublicHeader:manager];
    [manager POST:API_LOGIN parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        //        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
        //
        //        NSLog(@"%@",[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
        
        NSDictionary *dict = (NSDictionary *)responseObject;
        
        JSEIMPTokenModel *model = [JSEIMPTokenModel mj_objectWithKeyValues:dict];
        
        NSLog(@"%@",model.access_token);
        
        //[self setPublicHeader:manager];
        
        if (responseObject != nil) {
            
            NSLog(@"username:%@,password:%@,token:%@",username,password,model.access_token);
            
            //写入NSUserDefault
            [self writeUserDefalutsWithUserName:username Password:password UserToken:model.access_token];
            
            responseOJ(username);
        } else {
            errorCode(noData);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

//写入userDefault
+(void)writeUserDefalutsWithUserName:(NSString *)username Password:(NSString *)password UserToken:(NSString *)userToken{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:username forKey:@"username"];
    [defaults setValue:password forKey:@"password"];
    [defaults setValue:userToken forKey:@"userToken"];

}

//默认自动登录系统
+(void)loginWithUserDefaults:(void (^)())response onError:(void (^)(JSEIMPError))errorCode{
    [self loginWithDefaults:^(NSString *username, NSString *password,NSString *userToken) {
        if (username == nil || password == nil || userToken == nil) {
            errorCode(noUserData);
        } else {
            [self loginWithServer:username password:password UserToken:userToken
                         response:response onError:errorCode];
        }
    }];
}
+(void)loginWithDefaults:(void(^)(NSString * username,NSString * password,NSString * userToken))info{
    NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
    info([data objectForKey:@"username"],[data objectForKey:@"password"],[data objectForKey:@"userToken"]);
}

//获得投标项目列表
+(void)getTouBiaoListOnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [self setPublicHeader:manager];
    [manager GET:API_TOUBIAOLIST parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPTouBiaoProjectListModel *model = [JSEIMPTouBiaoProjectListModel mj_objectWithKeyValues:dict];
            
            response(model);
            
        } else {
            errorInfo(noError);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"error:%@",error);
        
    }];

}

//获得投标项目明细
+(void)getTouBiaoDetailListWithProjectID:(NSString *)projectID OnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{

    NSString *url = [NSString stringWithFormat:API_TOUBIAODETAIL"?projectId=%@",projectID];

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [self setPublicHeader:manager];
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPProjectDetailModel *model = [JSEIMPProjectDetailModel mj_objectWithKeyValues:dict];
            
            NSString *address = model.ProjectDetails.ADDRESS;
            NSString *buildCompany = model.ProjectDetails.OWNER;
            NSString *guiMo = model.ProjectDetails.SIZE;
            NSString *moneyFrom =  model.ProjectDetails.FINANCIALSOURCE;
            NSString *isZhongBiao = model.ProjectDetails.BIDRESULT;
            NSString *zhaoBiaoStyle;
            NSString *jieShaoPeople;
            NSString *touBiaoPeople;
            NSString *shuoMing;
            
            if (model.ProjectDetails.MODE == nil) {
                
                zhaoBiaoStyle = @"";
            }else{
                
                zhaoBiaoStyle = model.ProjectDetails.MODE;
            }
            if (model.ProjectDetails.CONTRACT == nil) {
                
                jieShaoPeople = @"";
            }else{
            
                jieShaoPeople = model.ProjectDetails.CONTRACT;
            }
            if (model.ProjectDetails.APPLYER == nil) {
                
                touBiaoPeople = @"";
            }else{
            
                touBiaoPeople = model.ProjectDetails.APPLYER;
            }
            if (model.ProjectDetails.COMMENT == nil) {
                
                shuoMing = @"";
            }else{
                
                shuoMing = model.ProjectDetails.COMMENT;
            }
            
            response(address,buildCompany,guiMo,moneyFrom,zhaoBiaoStyle,jieShaoPeople,touBiaoPeople,isZhongBiao,shuoMing);
            
        } else {
            errorInfo(noError);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        errorInfo([self transErrorTask:error]);
    }];
    
}

//获得投标保证金列表
+(void)getTouBiaoBaoZhengJinOnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    
    NSDictionary *paramaters = @{@"DepositType":@"0"};
    [self setPublicHeader:manager];
    [manager POST:API_TOUBIAOBAOZHENJIN parameters:paramaters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPTouBiaoBaoZhengJinModel *model = [JSEIMPTouBiaoBaoZhengJinModel mj_objectWithKeyValues:dict];
            
            NSMutableArray *depositAmountMArray = [NSMutableArray array];
            NSMutableArray *depositIdMArray = [NSMutableArray array];
            NSMutableArray *projectNameMArray = [NSMutableArray array];
            for (int i = 0; i < model.DepositList.count; i++) {
                
                NSString *depositAmount;
                NSString *depositId = model.DepositList[i].DepositId;
                NSString *projectName = model.DepositList[i].ProjectName;
                
                if (model.DepositList[i].DepositAmount == nil) {
                    
                    depositAmount = @"";
                }else{
                
                    depositAmount = model.DepositList[i].DepositAmount;
                }
                
                [depositAmountMArray addObject:depositAmount];
                [depositIdMArray addObject:depositId];
                [projectNameMArray addObject:projectName];
            }
            
            response(depositAmountMArray,depositIdMArray,projectNameMArray);
            
        } else {
            errorInfo();
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];

}

//获得投标保证金明细
+(void)getTouBiaoBaoZhengJinDetailWithDepositId:(NSString *)depositId OnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    
    NSDictionary *paramaters = @{@"DepositType":@"0",
                                 @"DepositId":depositId};
    [self setPublicHeader:manager];
    [manager POST:API_TOUBIAOBAOZHENJINDETAIL parameters:paramaters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPTouBiaoBaoZhengJinDetailModel *model = [JSEIMPTouBiaoBaoZhengJinDetailModel mj_objectWithKeyValues:dict];
            
            NSString *buildCompany = model.DepositDetails.Owner;
            NSString *jiaoNaDate = model.DepositDetails.PayDate;
            NSString *tuiKuanDate = model.DepositDetails.RefundDate;
            NSString *jiaoNaAccount = model.DepositDetails.PayAccount;
            NSString *isZhongBiao = model.DepositDetails.Winflg;
            NSString *beiZhu = model.DepositDetails.Comment;
            
            NSString *finalJiaoNaDate = [jiaoNaDate stringByReplacingOccurrencesOfString:@"T00:00:00" withString:@""];
            NSString *finalTuiKuanDate = [tuiKuanDate stringByReplacingOccurrencesOfString:@"T00:00:00" withString:@""];
            NSString *finalIsZhongBiao;
            if ([isZhongBiao isEqualToString:@"Y"]) {
                
                finalIsZhongBiao = @"中标";
            }else{
            
                finalIsZhongBiao = @"未中标";
            }
            
            response(buildCompany,finalJiaoNaDate,finalTuiKuanDate,jiaoNaAccount,finalIsZhongBiao,beiZhu);
            
        } else {
            errorInfo();
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];

}

//获得农名工保证金列表
+(void)getFarmerBaoZhengJinOnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    
    NSDictionary *paramaters = @{@"DepositType":@"1"};
    [self setPublicHeader:manager];
    [manager POST:API_FARMERBAOZHENJIN parameters:paramaters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPFarmerBaoZhengJinModel *model = [JSEIMPFarmerBaoZhengJinModel mj_objectWithKeyValues:dict];
            
            NSMutableArray *depositAmountMArray = [NSMutableArray array];
            NSMutableArray *depositIdMArray = [NSMutableArray array];
            NSMutableArray *projectNameMArray = [NSMutableArray array];
            for (int i = 0; i < model.DepositList.count; i++) {
                
                NSString *depositAmount;
                NSString *depositId = model.DepositList[i].DepositId;
                NSString *projectName = model.DepositList[i].ProjectName;
                
                if (model.DepositList[i].DepositAmount == nil) {
                    
                    depositAmount = @"";
                }else{
                    
                    depositAmount = model.DepositList[i].DepositAmount;
                }
                
                [depositAmountMArray addObject:depositAmount];
                [depositIdMArray addObject:depositId];
                [projectNameMArray addObject:projectName];
            }
            
            response(depositAmountMArray,depositIdMArray,projectNameMArray);
            
        } else {
            errorInfo();
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];

}

//获得农名工保证金明细
+(void)getFarmerBaoZhengJinDetailWithDepositId:(NSString *)depositId OnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    
    NSDictionary *paramaters = @{@"DepositType":@"1",
                                 @"DepositId":depositId};
    [self setPublicHeader:manager];
    [manager POST:API_FARMERBAOZHENJINDETAIL parameters:paramaters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPFarmerBaoZhengJinDetailModel *model = [JSEIMPFarmerBaoZhengJinDetailModel mj_objectWithKeyValues:dict];
            
            NSString *buildCompany = model.DepositDetails.Owner;
            NSString *jiaoNaDate = model.DepositDetails.PayDate;
            NSString *tuiKuanDate = model.DepositDetails.RefundDate;
            NSString *jiaoNaAccount = model.DepositDetails.PayAccount;
            NSString *isZhongBiao = model.DepositDetails.Winflg;
            NSString *beiZhu = model.DepositDetails.Comment;
            
            NSString *finalJiaoNaDate = [jiaoNaDate stringByReplacingOccurrencesOfString:@"T00:00:00" withString:@""];
            NSString *finalTuiKuanDate = [tuiKuanDate stringByReplacingOccurrencesOfString:@"T00:00:00" withString:@""];
            NSString *finalIsZhongBiao;
            if ([isZhongBiao isEqualToString:@"Y"]) {
                
                finalIsZhongBiao = @"中标";
            }else{
                
                finalIsZhongBiao = @"未中标";
            }
            
            response(buildCompany,finalJiaoNaDate,finalTuiKuanDate,jiaoNaAccount,finalIsZhongBiao,beiZhu);
            
        } else {
            errorInfo();
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
    
}

//获得项目奖项列表
+(void)getProjectJiangXiangOnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [self setPublicHeader:manager];
    [manager POST:API_PROJECTJIANGXIANG parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPProjectJiangXiangModel *model = [JSEIMPProjectJiangXiangModel mj_objectWithKeyValues:dict];
            
            NSMutableArray *awardCountMArray = [NSMutableArray array];
            NSMutableArray *projectIdMArray = [NSMutableArray array];
            NSMutableArray *projectNameMArray = [NSMutableArray array];
            for (int i = 0; i < model.AwardList.count; i++) {
                
                NSString *awardCount = model.AwardList[i].AwardCount;
                NSString *projectId = model.AwardList[i].ProjectId;
                NSString *projectName;
                
                if (model.AwardList[i].ProjectName == nil) {
                    
                    projectName = @"";
                }else{
                    
                    projectName = model.AwardList[i].ProjectName;
                }
                
                [awardCountMArray addObject:awardCount];
                [projectIdMArray addObject:projectId];
                [projectNameMArray addObject:projectName];
            }
            
            response(awardCountMArray,projectIdMArray,projectNameMArray);
            
        } else {
            errorInfo();
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
    
}

//获得项目奖项明细
+(void)getProjectJiangXiangDetailWithProjectId:(NSString *)projectId OnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *paramaters = @{@"ProjectId":projectId};
    
    [self setPublicHeader:manager];
    [manager POST:API_PROJECTJIANGXIANGDETAIL parameters:paramaters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPProjectJiangXiangDetailModel *model = [JSEIMPProjectJiangXiangDetailModel mj_objectWithKeyValues:dict];
            
            NSMutableArray *awardDateMArray = [NSMutableArray array];
            NSMutableArray *awardNameMArray = [NSMutableArray array];
            NSMutableArray *levelMArray = [NSMutableArray array];
            for (int i = 0; i < model.AwardDetails.count; i++) {
                
                NSString *awardDate = model.AwardDetails[i].AwardDate;
                NSString *awardName = model.AwardDetails[i].AwardName;
                NSString *level = model.AwardDetails[i].Level;
                
                [awardDateMArray addObject:awardDate];
                [awardNameMArray addObject:awardName];
                [levelMArray addObject:level];
            }
            
            response(awardDateMArray,awardNameMArray,levelMArray);
            
        } else {
            errorInfo();
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];

}

//获得总承包合同列表
+(void)getAllChengBaoHeTongOnSuccess:(void (^)())response onErrorInfo:(void (^)(JSEIMPError))errorInfo{
    
    NSArray *parameters = @[@{@"ContractType":@"CONTRACTA"}];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [self setPublicHeader:manager];
    [manager POST:API_ALLCHENGBAOHETONG parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPAllChengBaoHeTongModel *model = [JSEIMPAllChengBaoHeTongModel mj_objectWithKeyValues:dict];
            
            NSMutableArray *contractIdMArray = [NSMutableArray array];
            NSMutableArray *contractNameMArray = [NSMutableArray array];
            NSMutableArray *statusMArray = [NSMutableArray array];
            for (int i = 0; i < model.ContractList.count; i++) {
                
                NSString *contractId = model.ContractList[i].ContractId;
                NSString *contractName = model.ContractList[i].ContractName;
                NSInteger status = model.ContractList[i].Status;
                NSString *heTongStatus;
                
                [contractIdMArray addObject:contractId];
                [contractNameMArray addObject:contractName];
                if (status == 0) {
                    heTongStatus = @"待审";
                }else if (status == 1){
                    heTongStatus = @"审批中";
                }else if (status == 2){
                    heTongStatus = @"已审";
                }else if (status == 3){
                    heTongStatus = @"作废";
                }else if (status == 4){
                    heTongStatus = @"已决算";
                }else if (status == 5){
                    heTongStatus = @"终止";
                }
                [statusMArray addObject:heTongStatus];
            }
            
            NSLog(@"%@,%@,%@",contractIdMArray,contractNameMArray,statusMArray);
            
            response(contractIdMArray,contractNameMArray,statusMArray);
            
        } else {
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        
    }];
}

//获得总承包合同明细
+(void)getAllChengBaoHeTongDetailWithContractId:(NSString *)contractId OnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *paramaters = @{@"ContractId":contractId};
    
    [self setPublicHeader:manager];
    [manager POST:API_ALLCHENGBAOHETONGDETAIL parameters:paramaters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPAllChengBaoHeTongDetailModel *model = [JSEIMPAllChengBaoHeTongDetailModel mj_objectWithKeyValues:dict];
            
            NSString *contractCode = model.ContractDetails.CONTRACTCODE;
            NSString *projectName = model.ContractDetails.PROJECTNAME;
            NSString *jiaFangName = model.ContractDetails.PARTYAName;
            NSString *yiFangName = model.ContractDetails.PARTYBName;
            NSString *contractType = model.ContractDetails.CONTRACTTYPE;
            NSString *amount = model.ContractDetails.AMOUNT;
            NSString *qianYueDate = model.ContractDetails.CONTRACTDATE;
            NSString *startDate = model.ContractDetails.STARTDATE;
            NSString *endDate = model.ContractDetails.ENDDATE;
            NSString *days = model.ContractDetails.DAYS;
            NSString *qualityBaoXiuMoney = [NSString stringWithFormat:@"%@ %%",model.ContractDetails.REPAIEFEE];
            NSString *wenMingShiGongMoney = model.ContractDetails.CIVILIZATIONFEE;
            NSString *creator = model.ContractDetails.CREATOR;
            NSString *chengBaoFanWei = model.ContractDetails.CONTENTTERM;
            NSString *qualityTiaoKuan = model.ContractDetails.QUALITYTERM;
            NSString *shiGongTiaoKuan = model.ContractDetails.CIVILTERM;
            NSString *otherTiaoKuan = model.ContractDetails.OTHERTERM;
            
            NSString *finalQianYueDate = [qianYueDate stringByReplacingOccurrencesOfString:@"T00:00:00" withString:@""];
            NSString *finalStartDate = [startDate stringByReplacingOccurrencesOfString:@"T00:00:00" withString:@""];
            NSString *finalEndDate = [endDate stringByReplacingOccurrencesOfString:@"T00:00:00" withString:@""];
           
            NSMutableArray *fileTypeMArray = [NSMutableArray array];
            NSMutableArray *fileNameMArray = [NSMutableArray array];
            NSMutableArray *filePathMArray = [NSMutableArray array];
            NSString *api = FIlEIP;
            for (int i = 0; i < model.Files.count; i++) {
                
                NSString *fileType = model.Files[i].FILEEXT;
                NSString *fileName = model.Files[i].FILENAME;
                NSString *filePath = [api stringByAppendingString:model.Files[i].FILEPATH];
                
                [fileTypeMArray addObject:fileType];
                [fileNameMArray addObject:fileName];
                [filePathMArray addObject:filePath];
            }
            response(contractCode,projectName,jiaFangName,yiFangName,contractType,amount,finalQianYueDate,finalStartDate,finalEndDate,days,qualityBaoXiuMoney,wenMingShiGongMoney,creator,chengBaoFanWei,qualityTiaoKuan,shiGongTiaoKuan,otherTiaoKuan,fileTypeMArray,fileNameMArray,filePathMArray);
            
        } else {
            errorInfo();
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//获得专业承包合同列表
+(void)getZhuanYeChengBaoHeTongOnSuccess:(void (^)())response onErrorInfo:(void (^)(JSEIMPError))errorInfo{
    
    NSArray *parameters = @[@{@"ContractType":@"CONTRACTA1"}];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [self setPublicHeader:manager];
    [manager POST:API_ZHUANYECHENGBAOHETONG parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPZhuanYeChengBaoHeTongModel *model = [JSEIMPZhuanYeChengBaoHeTongModel mj_objectWithKeyValues:dict];
            
            NSMutableArray *contractIdMArray = [NSMutableArray array];
            NSMutableArray *contractNameMArray = [NSMutableArray array];
            NSMutableArray *statusMArray = [NSMutableArray array];
            for (int i = 0; i < model.ContractList.count; i++) {
                
                NSString *contractId = model.ContractList[i].ContractId;
                NSString *contractName = model.ContractList[i].ContractName;
                NSInteger status = model.ContractList[i].Status;
                NSString *heTongStatus;
                
                [contractIdMArray addObject:contractId];
                [contractNameMArray addObject:contractName];
                if (status == 0) {
                    heTongStatus = @"待审";
                }else if (status == 1){
                    heTongStatus = @"审批中";
                }else if (status == 2){
                    heTongStatus = @"已审";
                }else if (status == 3){
                    heTongStatus = @"作废";
                }else if (status == 4){
                    heTongStatus = @"已决算";
                }else if (status == 5){
                    heTongStatus = @"终止";
                }
                [statusMArray addObject:heTongStatus];
            }
            
            response(contractIdMArray,contractNameMArray,statusMArray);
            
        } else {
            errorInfo(noData);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//获得专业承包合同明细
+(void)getZhuanYeChengBaoHeTongDetailWithContractId:(NSString *)contractId OnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *paramaters = @{@"ContractId":contractId};
    [self setPublicHeader:manager];
    [manager POST:API_ZHUANYECHENGBAOHETONGDETAIL parameters:paramaters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPAllChengBaoHeTongDetailModel *model = [JSEIMPAllChengBaoHeTongDetailModel mj_objectWithKeyValues:dict];
            
            NSString *contractCode = model.ContractDetails.CONTRACTCODE;
            NSString *projectName = model.ContractDetails.PROJECTNAME;
            NSString *jiaFangName = model.ContractDetails.PARTYAName;
            NSString *yiFangName = model.ContractDetails.PARTYBName;
            NSString *contractType = model.ContractDetails.CONTRACTTYPE;
            NSString *amount = model.ContractDetails.AMOUNT;
            NSString *qianYueDate = model.ContractDetails.CONTRACTDATE;
            NSString *startDate = model.ContractDetails.STARTDATE;
            NSString *endDate = model.ContractDetails.ENDDATE;
            NSString *days = model.ContractDetails.DAYS;
            NSString *qualityBaoXiuMoney = [NSString stringWithFormat:@"%@ %%",model.ContractDetails.REPAIEFEE];
            NSString *wenMingShiGongMoney = model.ContractDetails.CIVILIZATIONFEE;
            NSString *creator = model.ContractDetails.CREATOR;
            NSString *chengBaoFanWei = model.ContractDetails.CONTENTTERM;
            NSString *qualityTiaoKuan = model.ContractDetails.QUALITYTERM;
            NSString *shiGongTiaoKuan = model.ContractDetails.CIVILTERM;
            NSString *otherTiaoKuan = model.ContractDetails.OTHERTERM;
            
            NSString *finalQianYueDate = [qianYueDate stringByReplacingOccurrencesOfString:@"T00:00:00" withString:@""];
            NSString *finalStartDate = [startDate stringByReplacingOccurrencesOfString:@"T00:00:00" withString:@""];
            NSString *finalEndDate = [endDate stringByReplacingOccurrencesOfString:@"T00:00:00" withString:@""];
           
            NSMutableArray *fileTypeMArray = [NSMutableArray array];
            NSMutableArray *fileNameMArray = [NSMutableArray array];
            NSMutableArray *filePathMArray = [NSMutableArray array];
            NSString *api = @"http://nimp.jaso.com.cn:6001/";
            for (int i = 0; i < model.Files.count; i++) {
                
                NSString *fileType = model.Files[i].FILEEXT;
                NSString *fileName = model.Files[i].FILENAME;
                NSString *filePath = [api stringByAppendingString:model.Files[i].FILEPATH];
                
                [fileTypeMArray addObject:fileType];
                [fileNameMArray addObject:fileName];
                [filePathMArray addObject:filePath];
            }
            response(contractCode,projectName,jiaFangName,yiFangName,contractType,amount,finalQianYueDate,finalStartDate,finalEndDate,days,qualityBaoXiuMoney,wenMingShiGongMoney,creator,chengBaoFanWei,qualityTiaoKuan,shiGongTiaoKuan,otherTiaoKuan,fileTypeMArray,fileNameMArray,filePathMArray);
            
        } else {
            errorInfo();
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//获得专业分包合同列表
+(void)getZhuanYeFenBaoHeTongOnSuccess:(void (^)())response onErrorInfo:(void (^)(JSEIMPError))errorInfo{
    
    NSArray *parameters = @[@{@"ContractType":@"CONTRACTB"}];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [self setPublicHeader:manager];
    [manager POST:API_ZHUANYEFENBAOHETONG parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPZhuanYeFenBaoHeTongModel *model = [JSEIMPZhuanYeFenBaoHeTongModel mj_objectWithKeyValues:dict];
            
            NSMutableArray *contractIdMArray = [NSMutableArray array];
            NSMutableArray *contractNameMArray = [NSMutableArray array];
            NSMutableArray *statusMArray = [NSMutableArray array];
            for (int i = 0; i < model.ContractList.count; i++) {
                
                NSString *contractId = model.ContractList[i].ContractId;
                NSString *contractName = model.ContractList[i].ContractName;
                NSInteger status = model.ContractList[i].Status;
                NSString *heTongStatus;
                
                [contractIdMArray addObject:contractId];
                [contractNameMArray addObject:contractName];
                if (status == 0) {
                    heTongStatus = @"待审";
                }else if (status == 1){
                    heTongStatus = @"审批中";
                }else if (status == 2){
                    heTongStatus = @"已审";
                }else if (status == 3){
                    heTongStatus = @"作废";
                }else if (status == 4){
                    heTongStatus = @"已决算";
                }else if (status == 5){
                    heTongStatus = @"终止";
                }
                [statusMArray addObject:heTongStatus];
            }
            
            response(contractIdMArray,contractNameMArray,statusMArray);
            
        } else {
            errorInfo(noData);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//获得专业分包合同明细
+(void)getZhuanYeFenBaoHeTongDetailWithContractId:(NSString *)contractId OnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *paramaters = @{@"ContractId":contractId};
    [self setPublicHeader:manager];
    [manager POST:API_ZHUANYEFENBAOHETONGDETAIL parameters:paramaters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPZhuanYeFenBaoHeTongDetailModel *model = [JSEIMPZhuanYeFenBaoHeTongDetailModel mj_objectWithKeyValues:dict];
            
            NSString *contractCode = model.ContractDetails.CONTRACTCODE;
            NSString *projectName = model.ContractDetails.PROJECTNAME;
            NSString *jiaFangName = model.ContractDetails.PARTYAName;
            NSString *yiFangName = model.ContractDetails.PARTYBName;
            NSString *diSanFangName = model.ContractDetails.PARTYCName;
            NSString *contractType = model.ContractDetails.CONTRACTTYPE;
            NSString *amount = model.ContractDetails.AMOUNT;
            NSString *qianYueDate = model.ContractDetails.CONTRACTDATE;
            NSString *startDate = model.ContractDetails.STARTDATE;
            NSString *endDate = model.ContractDetails.ENDDATE;
            NSString *days = model.ContractDetails.DAYS;
            NSString *qualityBaoXiuMoney = [NSString stringWithFormat:@"%@ %%",model.ContractDetails.REPAIEFEE];
            NSString *creator = model.ContractDetails.CREATOR;
            NSString *chengBaoFanWei = model.ContractDetails.CONTENTTERM;
            NSString *calculateMethod = model.ContractDetails.FUNDTERM;
            NSString *qualityBiaoZhun = model.ContractDetails.QUALITYTERM;
            NSString *wenMingShiGong = model.ContractDetails.CIVILTERM;
            NSString *fuKuanTiaoKuan = model.ContractDetails.PAYMENTTERM;
            NSString *jiaoFuTuiHuan = model.ContractDetails.DEPOSITTERM;
            NSString *otherTiaoKuan = model.ContractDetails.OTHERTERM;
            
            NSString *finalQianYueDate = [qianYueDate stringByReplacingOccurrencesOfString:@"T00:00:00" withString:@""];
            NSString *finalStartDate = [startDate stringByReplacingOccurrencesOfString:@"T00:00:00" withString:@""];
            NSString *finalEndDate = [endDate stringByReplacingOccurrencesOfString:@"T00:00:00" withString:@""];
           
            NSMutableArray *fileTypeMArray = [NSMutableArray array];
            NSMutableArray *fileNameMArray = [NSMutableArray array];
            NSMutableArray *filePathMArray = [NSMutableArray array];
            NSString *api = @"http://nimp.jaso.com.cn:6001/";
            for (int i = 0; i < model.Files.count; i++) {
                
                NSString *fileType = model.Files[i].FILEEXT;
                NSString *fileName = model.Files[i].FILENAME;
                NSString *filePath = [api stringByAppendingString:model.Files[i].FILEPATH];
                
                [fileTypeMArray addObject:fileType];
                [fileNameMArray addObject:fileName];
                [filePathMArray addObject:filePath];
            }
            response(contractCode,projectName,jiaFangName,yiFangName,diSanFangName,contractType,amount,finalQianYueDate,finalStartDate,finalEndDate,days,qualityBaoXiuMoney,creator,chengBaoFanWei,calculateMethod,qualityBiaoZhun,wenMingShiGong,fuKuanTiaoKuan,jiaoFuTuiHuan,otherTiaoKuan,fileTypeMArray,fileNameMArray,filePathMArray);
            
        } else {
            errorInfo();
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//获得采购合同列表
+(void)getCaiGouHeTongOnSuccess:(void (^)())response onErrorInfo:(void (^)(JSEIMPError))errorInfo{
    
    NSArray *parameters = @[@{@"ContractType":@"CONTRACTC"}];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [self setPublicHeader:manager];
    [manager POST:API_CAIGOUHETONG parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPCaiGouHeTongModel *model = [JSEIMPCaiGouHeTongModel mj_objectWithKeyValues:dict];
            
            NSMutableArray *contractIdMArray = [NSMutableArray array];
            NSMutableArray *contractNameMArray = [NSMutableArray array];
            NSMutableArray *statusMArray = [NSMutableArray array];
            for (int i = 0; i < model.ContractList.count; i++) {
                
                NSString *contractId = model.ContractList[i].ContractId;
                NSString *contractName = model.ContractList[i].ContractName;
                NSInteger status = model.ContractList[i].Status;
                NSString *heTongStatus;
                
                [contractIdMArray addObject:contractId];
                [contractNameMArray addObject:contractName];
                if (status == 0) {
                    heTongStatus = @"待审";
                }else if (status == 1){
                    heTongStatus = @"审批中";
                }else if (status == 2){
                    heTongStatus = @"已审";
                }else if (status == 3){
                    heTongStatus = @"作废";
                }else if (status == 4){
                    heTongStatus = @"已决算";
                }else if (status == 5){
                    heTongStatus = @"终止";
                }
                [statusMArray addObject:heTongStatus];
            }
            
            response(contractIdMArray,contractNameMArray,statusMArray);
            
        } else {
            errorInfo(noData);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//获得采购合同明细
+(void)getCaiGouHeTongDetailWithContractId:(NSString *)contractId OnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *paramaters = @{@"ContractId":contractId};
    [self setPublicHeader:manager];
    [manager POST:API_CAIGOUHETONGDETAIL parameters:paramaters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPCaiGouHeTongDetailModel *model = [JSEIMPCaiGouHeTongDetailModel mj_objectWithKeyValues:dict];
            
            NSString *contractCode = model.ContractDetails.CONTRACTCODE;
            NSString *projectName = model.ContractDetails.PROJECTNAME;
            NSString *jiaFangName = model.ContractDetails.PARTYAName;
            NSString *yiFangName = model.ContractDetails.PARTYBName;
            NSString *diSanFangName = model.ContractDetails.PARTYCName;
            NSString *contractType = model.ContractDetails.CONTRACTTYPE;
            NSString *amount = model.ContractDetails.AMOUNT;
            NSString *qianYueDate = model.ContractDetails.CONTRACTDATE;
            NSString *creator = model.ContractDetails.CREATOR;
            NSString *qualityBiaoZhun = model.ContractDetails.QUALITYTERM;
            NSString *jiaoFuPlace = model.ContractDetails.DELIVERYTERM;
            NSString *fuKuanTiaoKuan = model.ContractDetails.PAYMENTTERM;
            NSString *yanShouMethod = model.ContractDetails.ACCEPTTERM;
            NSString *weiYueZeRen = model.ContractDetails.BREACHTERM;
            NSString *otherTiaoKuan = model.ContractDetails.OTHERTERM;
            
            NSString *finalQianYueDate = [qianYueDate stringByReplacingOccurrencesOfString:@"T00:00:00" withString:@""];
            
            NSMutableArray *fileTypeMArray = [NSMutableArray array];
            NSMutableArray *fileNameMArray = [NSMutableArray array];
            NSMutableArray *filePathMArray = [NSMutableArray array];
            NSString *api = @"http://nimp.jaso.com.cn:6001/";
            for (int i = 0; i < model.Files.count; i++) {
                
                NSString *fileType = model.Files[i].FILEEXT;
                NSString *fileName = model.Files[i].FILENAME;
                NSString *filePath;
                
                if (model.Files[i].FILEPATH == nil) {
                    
                    filePath = [api stringByAppendingString:@""];
                }else{
                    filePath = [api stringByAppendingString:model.Files[i].FILEPATH];
                }
                
                [fileTypeMArray addObject:fileType];
                [fileNameMArray addObject:fileName];
                [filePathMArray addObject:filePath];
            }
            response(contractCode,projectName,jiaFangName,yiFangName,diSanFangName,contractType,amount,finalQianYueDate,creator,qualityBiaoZhun,jiaoFuPlace,fuKuanTiaoKuan,yanShouMethod,weiYueZeRen,otherTiaoKuan,fileTypeMArray,fileNameMArray,filePathMArray);
            
        } else {
            errorInfo();
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//获得劳务分包合同列表
+(void)getLaoWuFenBaoHeTongOnSuccess:(void (^)())response onErrorInfo:(void (^)(JSEIMPError))errorInfo{
    
    NSArray *parameters = @[@{@"ContractType":@"CONTRACTD"}];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [self setPublicHeader:manager];
    [manager POST:API_LAOWUFENBAOHETONG parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPLaoWuFenBaoHeTongModel *model = [JSEIMPLaoWuFenBaoHeTongModel mj_objectWithKeyValues:dict];

            NSMutableArray *contractIdMArray = [NSMutableArray array];
            NSMutableArray *contractNameMArray = [NSMutableArray array];
            NSMutableArray *statusMArray = [NSMutableArray array];
            for (int i = 0; i < model.ContractList.count; i++) {

                NSString *contractId = model.ContractList[i].ContractId;
                NSString *contractName = model.ContractList[i].ContractName;
                NSInteger status = model.ContractList[i].Status;
                NSString *heTongStatus;

                [contractIdMArray addObject:contractId];
                [contractNameMArray addObject:contractName];
                if (status == 0) {
                    heTongStatus = @"待审";
                }else if (status == 1){
                    heTongStatus = @"审批中";
                }else if (status == 2){
                    heTongStatus = @"已审";
                }else if (status == 3){
                    heTongStatus = @"作废";
                }else if (status == 4){
                    heTongStatus = @"已决算";
                }else if (status == 5){
                    heTongStatus = @"终止";
                }
                [statusMArray addObject:heTongStatus];
            }
            
            response(contractIdMArray,contractNameMArray,statusMArray);
            
        } else {
            errorInfo(noData);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//获得劳务分包合同明细
+(void)getLaoWuFenBaoHeTongDetailWithContractId:(NSString *)contractId OnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *paramaters = @{@"ContractId":contractId};
    [self setPublicHeader:manager];
    [manager POST:API_LAOWUFENBAOHETONGDETAIL parameters:paramaters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPLaoWuFenBaoHeTongDetailModel *model = [JSEIMPLaoWuFenBaoHeTongDetailModel mj_objectWithKeyValues:dict];
            
            NSString *contractCode = model.ContractDetails.CONTRACTCODE;
            NSString *projectName = model.ContractDetails.PROJECTNAME;
            NSString *jiaFangName = model.ContractDetails.PARTYAName;
            NSString *yiFangName = model.ContractDetails.PARTYBName;
            NSString *diSanFangName = model.ContractDetails.PARTYCName;
            NSString *contractType = model.ContractDetails.CONTRACTTYPE;
            NSString *amount = model.ContractDetails.AMOUNT;
            NSString *qianYueDate = model.ContractDetails.CONTRACTDATE;
            NSString *startDate = model.ContractDetails.STARTDATE;
            NSString *endDate = model.ContractDetails.ENDDATE;
            NSString *days = model.ContractDetails.DAYS;
            NSString *creator = model.ContractDetails.CREATOR;
            NSString *chengBaoFanWei = model.ContractDetails.CONTENTTERM;
            NSString *qualityBiaoZhun = model.ContractDetails.QUALITYTERM;
            NSString *caiLiaoSheBei = model.ContractDetails.EQUIPMENTTERM;
            NSString *fuKuanTiaoKuan = model.ContractDetails.PAYMENTTERM;
            NSString *baoZhengJinPayBack = model.ContractDetails.DEPOSITTERM;
            NSString *otherTiaoKuan = model.ContractDetails.OTHERTERM;
            
            if (diSanFangName != nil) {
                
                diSanFangName = model.ContractDetails.PARTYCName;
            }else if (diSanFangName == nil){
                
                diSanFangName = @"";
            }
            NSString *finalQianYueDate = [qianYueDate stringByReplacingOccurrencesOfString:@"T00:00:00" withString:@""];
            NSString *finalStartDate = [startDate stringByReplacingOccurrencesOfString:@"T00:00:00" withString:@""];
            NSString *finalEndDate = [endDate stringByReplacingOccurrencesOfString:@"T00:00:00" withString:@""];
            
            NSMutableArray *fileTypeMArray = [NSMutableArray array];
            NSMutableArray *fileNameMArray = [NSMutableArray array];
            NSMutableArray *filePathMArray = [NSMutableArray array];
            NSString *api = FIlEIP;
            for (int i = 0; i < model.Files.count; i++) {
                
                NSString *fileType = model.Files[i].FILEEXT;
                NSString *fileName = model.Files[i].FILENAME;
                NSString *filePath;
                
                if (model.Files[i].FILEPATH == nil) {
                    
                    filePath = [api stringByAppendingString:@""];
                }else{
                    filePath = [api stringByAppendingString:model.Files[i].FILEPATH];
                }
                
                [fileTypeMArray addObject:fileType];
                [fileNameMArray addObject:fileName];
                [filePathMArray addObject:filePath];
            }
            response(contractCode,projectName,jiaFangName,yiFangName,diSanFangName,contractType,amount,finalQianYueDate,finalStartDate,finalEndDate,days, creator,chengBaoFanWei,qualityBiaoZhun,caiLiaoSheBei,fuKuanTiaoKuan,baoZhengJinPayBack,otherTiaoKuan,fileTypeMArray,fileNameMArray,filePathMArray);
            
        } else {
            errorInfo();
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//获得设备租赁合同列表
+(void)getSheBeiZuLinHeTongOnSuccess:(void (^)())response onErrorInfo:(void (^)(JSEIMPError))errorInfo{
    
    NSArray *parameters = @[@{@"ContractType":@"CONTRACTE"}];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [self setPublicHeader:manager];
    [manager POST:API_SHEBEIZULINHETONG parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPSheBeiZuLinHeTongModel *model = [JSEIMPSheBeiZuLinHeTongModel mj_objectWithKeyValues:dict];
            
            NSMutableArray *contractIdMArray = [NSMutableArray array];
            NSMutableArray *contractNameMArray = [NSMutableArray array];
            NSMutableArray *statusMArray = [NSMutableArray array];
            for (int i = 0; i < model.ContractList.count; i++) {
                
                NSString *contractId = model.ContractList[i].ContractId;
                NSString *contractName = model.ContractList[i].ContractName;
                NSInteger status = model.ContractList[i].Status;
                NSString *heTongStatus;
                
                [contractIdMArray addObject:contractId];
                [contractNameMArray addObject:contractName];
                if (status == 0) {
                    heTongStatus = @"待审";
                }else if (status == 1){
                    heTongStatus = @"审批中";
                }else if (status == 2){
                    heTongStatus = @"已审";
                }else if (status == 3){
                    heTongStatus = @"作废";
                }else if (status == 4){
                    heTongStatus = @"已决算";
                }else if (status == 5){
                    heTongStatus = @"终止";
                }
                [statusMArray addObject:heTongStatus];
            }
            
            response(contractIdMArray,contractNameMArray,statusMArray);
            
        } else {
            errorInfo(noData);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//获得设备租赁合同明细
+(void)getSheBeiZuLinHeTongDetailWithContractId:(NSString *)contractId OnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *paramaters = @{@"ContractId":contractId};
    [self setPublicHeader:manager];
    [manager POST:API_SHEBEIZULINHETONGDETAIL parameters:paramaters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPSheBeiZuLinHeTongDetailModel *model = [JSEIMPSheBeiZuLinHeTongDetailModel mj_objectWithKeyValues:dict];
            
            NSString *contractCode = model.ContractDetails.CONTRACTCODE;
            NSString *projectName = model.ContractDetails.PROJECTNAME;
            NSString *contractType = model.ContractDetails.CONTRACTTYPE;
            NSString *amount = model.ContractDetails.AMOUNT;
            NSString *jiaFangName = model.ContractDetails.PARTYAName;
            NSString *yiFangName = model.ContractDetails.PARTYBName;
            NSString *diSanFangName = model.ContractDetails.PARTYCName;
            NSString *chengBaoMethod = model.ContractDetails.CONTRACTMODE;
            NSString *baoXiuJin = model.ContractDetails.REPAIEFEE;
            NSString *qianYueDate = model.ContractDetails.CONTRACTDATE;
            NSString *creator = model.ContractDetails.CREATOR;
            NSString *zuLinAndJieSuanMethod = model.ContractDetails.CONTENTTERM;
            NSString *moneyChengDan = model.ContractDetails.PERIODCOSTTERM;
            NSString *weiYueZeRen = model.ContractDetails.BREACHTERM;
            NSString *fuKuanTiaoKuan = model.ContractDetails.PAYMENTTERM;
            NSString *otherYueDing = model.ContractDetails.OTHERTERM;
         
            if (diSanFangName != nil) {
                
                diSanFangName = model.ContractDetails.PARTYCName;
            }else if (diSanFangName == nil){
                
                diSanFangName = @"";
            }
            NSString *finalQianYueDate = [qianYueDate stringByReplacingOccurrencesOfString:@"T00:00:00" withString:@""];
            
            NSMutableArray *fileTypeMArray = [NSMutableArray array];
            NSMutableArray *fileNameMArray = [NSMutableArray array];
            NSMutableArray *filePathMArray = [NSMutableArray array];
            NSString *api = FIlEIP;
            for (int i = 0; i < model.Files.count; i++) {
                
                NSString *fileType = model.Files[i].FILEEXT;
                NSString *fileName = model.Files[i].FILENAME;
                NSString *filePath;
                
                if (model.Files[i].FILEPATH == nil) {
                    
                    filePath = [api stringByAppendingString:@""];
                }else{
                    filePath = [api stringByAppendingString:model.Files[i].FILEPATH];
                }
                
                [fileTypeMArray addObject:fileType];
                [fileNameMArray addObject:fileName];
                [filePathMArray addObject:filePath];
            }
            response(contractCode,projectName,contractType,amount,jiaFangName,yiFangName,diSanFangName,chengBaoMethod,baoXiuJin,finalQianYueDate, creator,zuLinAndJieSuanMethod,moneyChengDan,weiYueZeRen,fuKuanTiaoKuan,otherYueDing,fileTypeMArray,fileNameMArray,filePathMArray);
            
        } else {
            errorInfo();
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//获得其他收入合同列表
+(void)getOtherShouRuHeTongOnSuccess:(void (^)())response onErrorInfo:(void (^)(JSEIMPError))errorInfo{
    
    NSArray *parameters = @[@{@"ContractType":@"CONTRACTF"}];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [self setPublicHeader:manager];
    [manager POST:API_OTHERSHOURUHETONG parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPOtherShouRuHeTongModel *model = [JSEIMPOtherShouRuHeTongModel mj_objectWithKeyValues:dict];
            
            NSMutableArray *contractIdMArray = [NSMutableArray array];
            NSMutableArray *contractNameMArray = [NSMutableArray array];
            NSMutableArray *statusMArray = [NSMutableArray array];
            for (int i = 0; i < model.ContractList.count; i++) {
                
                NSString *contractId = model.ContractList[i].ContractId;
                NSString *contractName = model.ContractList[i].ContractName;
                NSInteger status = model.ContractList[i].Status;
                NSString *heTongStatus;
                
                [contractIdMArray addObject:contractId];
                [contractNameMArray addObject:contractName];
                if (status == 0) {
                    heTongStatus = @"待审";
                }else if (status == 1){
                    heTongStatus = @"审批中";
                }else if (status == 2){
                    heTongStatus = @"已审";
                }else if (status == 3){
                    heTongStatus = @"作废";
                }else if (status == 4){
                    heTongStatus = @"已决算";
                }else if (status == 5){
                    heTongStatus = @"终止";
                }
                [statusMArray addObject:heTongStatus];
            }
            
            response(contractIdMArray,contractNameMArray,statusMArray);
            
        } else {
            errorInfo(noData);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//获得其他收入合同明细
+(void)getOtherShouRuHeTongDetailWithContractId:(NSString *)contractId OnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *paramaters = @{@"ContractId":contractId};
    [self setPublicHeader:manager];
    [manager POST:API_OTHERSHOURUHETONGDETAIL parameters:paramaters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPOtherShouRuHeTongDetailModel *model = [JSEIMPOtherShouRuHeTongDetailModel mj_objectWithKeyValues:dict];
            
            NSString *contractCode = model.ContractDetails.CONTRACTCODE;
            NSString *projectName = model.ContractDetails.PROJECTNAME;
            NSString *contractType = model.ContractDetails.CONTRACTTYPE;
            NSString *amount = model.ContractDetails.AMOUNT;
            NSString *jiaFangName = model.ContractDetails.PARTYAName;
            NSString *yiFangName = model.ContractDetails.PARTYBName;
            NSString *diSanFangName = model.ContractDetails.PARTYCName;
            NSString *qianYueDate = model.ContractDetails.CONTRACTDATE;
            NSString *creator = model.ContractDetails.CREATOR;
            NSString *contentAndRange = model.ContractDetails.CONTENTTERM;
            NSString *fuKuanTiaoKuan = model.ContractDetails.PAYMENTTERM;
            NSString *otherTiaoKuan = model.ContractDetails.OTHERTERM;
            
            if (diSanFangName != nil) {
                
                diSanFangName = model.ContractDetails.PARTYCName;
            }else if (diSanFangName == nil){
                
                diSanFangName = @"";
            }
            NSString *finalQianYueDate = [qianYueDate stringByReplacingOccurrencesOfString:@"T00:00:00" withString:@""];
            
            NSMutableArray *fileTypeMArray = [NSMutableArray array];
            NSMutableArray *fileNameMArray = [NSMutableArray array];
            NSMutableArray *filePathMArray = [NSMutableArray array];
            NSString *api = FIlEIP;
            for (int i = 0; i < model.Files.count; i++) {
                
                NSString *fileType = model.Files[i].FILEEXT;
                NSString *fileName = model.Files[i].FILENAME;
                NSString *filePath;
                
                if (model.Files[i].FILEPATH == nil) {
                    
                    filePath = [api stringByAppendingString:@""];
                }else{
                    filePath = [api stringByAppendingString:model.Files[i].FILEPATH];
                }
                
                [fileTypeMArray addObject:fileType];
                [fileNameMArray addObject:fileName];
                [filePathMArray addObject:filePath];
            }
            response(contractCode,projectName,jiaFangName,yiFangName,diSanFangName,contractType,amount,finalQianYueDate, creator,contentAndRange,fuKuanTiaoKuan,otherTiaoKuan,fileTypeMArray,fileNameMArray,filePathMArray);
            
        } else {
            errorInfo();
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//获得待办事项列表
+(void)getDaiBanItemOnSuccess:(void (^)())response onErrorInfo:(void (^)(JSEIMPError))errorInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [self setPublicHeader:manager];
    [manager GET:API_DAIBANITEM parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPDaiBanItemsModel *model = [JSEIMPDaiBanItemsModel mj_objectWithKeyValues:dict];
            
            NSMutableArray *activityIdMArray = [NSMutableArray array];
            NSMutableArray *IDMArray = [NSMutableArray array];
            NSMutableArray *activityNameMArray = [NSMutableArray array];
            NSMutableArray *nameMArray = [NSMutableArray array];
            NSMutableArray *timeMArray = [NSMutableArray array];
            NSMutableArray *contractIdMArray = [NSMutableArray array];
            for (int i = 0; i < model.result.items.count; i++) {
                
                NSInteger activityID = model.result.items[i].activityId;
                NSString *ID = model.result.items[i].ID;
                NSString *activityName = model.result.items[i].activityName;
                NSString *name = model.result.items[i].name;
                NSString *time = model.result.items[i].processCreationTime;
                
                NSString *processCreationTime = [time substringToIndex:10];
                
                [activityIdMArray addObject:@(activityID)];
                [IDMArray addObject:ID];
                [activityNameMArray addObject:activityName];
                [nameMArray addObject:name];
                [timeMArray addObject:processCreationTime];
                
                for (int j = 0; j < model.result.items[i].dataFields.count; j++) {
                    
                    NSString *dataType = model.result.items[i].dataFields[j].dataType;
                    NSString *value = model.result.items[i].dataFields[j].value;
                    
                    if ([dataType isEqualToString:@"REFERENCE"]) {
                        
                        [contractIdMArray addObject:value];
                    }
                }
            }
            response(activityIdMArray,IDMArray,activityNameMArray,nameMArray,timeMArray,contractIdMArray);
        } else {
            
            errorInfo(noData);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//获得代办事项详情
+(void)getDaiBanItemDetailWithContractID:(NSString *)contractId OnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *paramaters = @{@"ContractId":contractId};
    [self setPublicHeader:manager];
    [manager POST:API_DAIBANITEMSDETAIL parameters:paramaters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPDaiBanItemDetailModel *model = [JSEIMPDaiBanItemDetailModel mj_objectWithKeyValues:dict];
            
            NSString *contractCode = model.ContractDetails.CONTRACTCODE;
            NSString *projectName = model.ContractDetails.PROJECTNAME;
            NSString *jiaFangName = model.ContractDetails.PARTYAName;
            NSString *yiFangName = model.ContractDetails.PARTYBName;
            NSString *contractType = model.ContractDetails.CONTRACTTYPE;
            NSString *amount = model.ContractDetails.AMOUNT;
            NSString *qianYueDate = model.ContractDetails.CONTRACTDATE;
            NSString *creator = model.ContractDetails.CREATOR;
            NSInteger status = model.ContractDetails.STATUS;
            NSString *finalQianYueDate = [qianYueDate stringByReplacingOccurrencesOfString:@"T00:00:00" withString:@""];
            NSString *heTongStatus;
            if (status == 0) {
                heTongStatus = @"待审";
            }else if (status == 1){
                heTongStatus = @"审批中";
            }else if (status == 2){
                heTongStatus = @"已审";
            }else if (status == 3){
                heTongStatus = @"作废";
            }else if (status == 4){
                heTongStatus = @"已决算";
            }else if (status == 5){
                heTongStatus = @"终止";
            }
            
            NSMutableArray *fileTypeMArray = [NSMutableArray array];
            NSMutableArray *fileNameMArray = [NSMutableArray array];
            NSMutableArray *filePathMArray = [NSMutableArray array];
            NSString *api = @"http://nimp.jaso.com.cn:6001/";
            for (int i = 0; i < model.Files.count; i++) {
                
                NSString *fileType = model.Files[i].FILEEXT;
                NSString *fileName = model.Files[i].FILENAME;
                NSString *filePath;
                
                if (model.Files[i].FILEPATH == nil) {
                    
                    filePath = [api stringByAppendingString:@""];
                }else{
                    filePath = [api stringByAppendingString:model.Files[i].FILEPATH];
                }
                
                [fileTypeMArray addObject:fileType];
                [fileNameMArray addObject:fileName];
                [filePathMArray addObject:filePath];
            }
            response(contractCode,projectName,jiaFangName,yiFangName,contractType,amount,finalQianYueDate,creator,heTongStatus);
            
        } else {
            errorInfo();
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//获得在办事项列表
+(void)getZaiBanItemOnSuccess:(void (^)())response onErrorInfo:(void (^)(JSEIMPError))errorInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [self setPublicHeader:manager];
    [manager GET:API_ZAIBANITEM parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPZaiBanItemsModel *model = [JSEIMPZaiBanItemsModel mj_objectWithKeyValues:dict];
            
            NSMutableArray *activityIdMArray = [NSMutableArray array];
            NSMutableArray *IDMArray = [NSMutableArray array];
            NSMutableArray *activityNameMArray = [NSMutableArray array];
            NSMutableArray *nameMArray = [NSMutableArray array];
            NSMutableArray *timeMArray = [NSMutableArray array];
            NSMutableArray *contractIdMArray = [NSMutableArray array];
            NSMutableArray *processInstanceIdMArray = [NSMutableArray array];
            for (int i = 0; i < model.result.items.count; i++) {
                
                NSInteger activityID = model.result.items[i].activityId;
                NSString *ID = model.result.items[i].ID;
                NSString *activityName = model.result.items[i].activityName;
                NSString *name = model.result.items[i].name;
                NSString *time = model.result.items[i].processCreationTime;
                
                NSString *processCreationTime = [time substringToIndex:10];
                
                [activityIdMArray addObject:@(activityID)];
                [IDMArray addObject:ID];
                [activityNameMArray addObject:activityName];
                [nameMArray addObject:name];
                [timeMArray addObject:processCreationTime];
                
                for (int j = 0; j < model.result.items[i].dataFields.count; j++) {
                    
                    NSString *dataType = model.result.items[i].dataFields[j].dataType;
                    NSString *value = model.result.items[i].dataFields[j].value;
                    NSInteger processInstanceId = model.result.items[i].dataFields[j].processInstanceId;
                    
                    if ([dataType isEqualToString:@"REFERENCE"]) {
                        
                        [contractIdMArray addObject:value];
                        [processInstanceIdMArray addObject:@(processInstanceId)];
                    }
                }
            }
            response(activityIdMArray,IDMArray,activityNameMArray,nameMArray,timeMArray,contractIdMArray,processInstanceIdMArray);
        } else {
            
            errorInfo(noData);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//获得已办事项列表
+(void)getYiBanItemOnSuccess:(void (^)())response onErrorInfo:(void (^)(JSEIMPError))errorInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [self setPublicHeader:manager];
    [manager GET:API_YIBANITEM parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPYiBanItemsModel *model = [JSEIMPYiBanItemsModel mj_objectWithKeyValues:dict];
            
            NSMutableArray *activityIdMArray = [NSMutableArray array];
            NSMutableArray *IDMArray = [NSMutableArray array];
            NSMutableArray *activityNameMArray = [NSMutableArray array];
            NSMutableArray *nameMArray = [NSMutableArray array];
            NSMutableArray *timeMArray = [NSMutableArray array];
            NSMutableArray *contractIdMArray = [NSMutableArray array];
            for (int i = 0; i < model.result.items.count; i++) {
                
                NSInteger activityID = model.result.items[i].activityId;
                NSString *ID = model.result.items[i].ID;
                NSString *activityName = model.result.items[i].activityName;
                NSString *name = model.result.items[i].name;
                NSString *time = model.result.items[i].processCreationTime;
                
                NSString *processCreationTime = [time substringToIndex:10];
                
                [activityIdMArray addObject:@(activityID)];
                [IDMArray addObject:ID];
                [activityNameMArray addObject:activityName];
                [nameMArray addObject:name];
                [timeMArray addObject:processCreationTime];
                
                for (int j = 0; j < model.result.items[i].dataFields.count; j++) {
                    
                    NSString *dataType = model.result.items[i].dataFields[j].dataType;
                    NSString *value = model.result.items[i].dataFields[j].value;
                    
                    if ([dataType isEqualToString:@"REFERENCE"]) {
                        
                        [contractIdMArray addObject:value];
                    }
                }
            }
            response(activityIdMArray,IDMArray,activityNameMArray,nameMArray,timeMArray,contractIdMArray);
        } else {
            
            errorInfo(noData);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//合同签收
+(void)PostQianShouWithActivityId:(NSInteger)activityId OnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    NSDictionary *parameters = @{@"activityId":@(activityId)};
    
    [self setPublicHeader:manager];
    [manager POST:API_CONTRACTQIANSHOU parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            response();
        } else {
            errorInfo();
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//点击合同同意，获取targetActivityId和activityId
+(void)GetTatgetActivityIdWithActivityId:(NSInteger)activityId OnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *parameters = @{@"activityInstanceId":@(activityId)};
    
    [self setPublicHeader:manager];
    [manager GET:API_GETTARGETACTIVITYID parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPGetTargetActivityIdModel *model = [JSEIMPGetTargetActivityIdModel mj_objectWithKeyValues:dict];
            
            NSMutableArray *targetActivityIdMArray = [NSMutableArray array];
            for (int i = 0; i < model.result.items.count; i++) {
                
                NSString *targetActivityId = model.result.items[i].to;
                
                [targetActivityIdMArray addObject:targetActivityId];
            }
            
            response(targetActivityIdMArray);
        } else {
            
            errorInfo(noData);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

////点击建议VC里的确定，获得允许的操作人
+(void)getCaoZuoPeopleWithProcessInstanceId:(NSInteger)processInstanceId ActivityDefinitionId:(NSString *)activityDefinitionId OnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *parameters = @{@"ProcessInstanceId":@(processInstanceId),
                                 @"ActivityDefinitionId":activityDefinitionId
                                 };
    
    [self setPublicHeader:manager];
    [manager GET:API_GETCAOZUOPEOPLE parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPCaoZuoPeopleModel *model = [JSEIMPCaoZuoPeopleModel mj_objectWithKeyValues:dict];
            
            NSMutableArray *loginIdMArray = [NSMutableArray array];
            NSMutableArray *roleIdMArray = [NSMutableArray array];
            NSMutableArray *userIdMArray = [NSMutableArray array];
            NSMutableArray *userNameMArray = [NSMutableArray array];
            NSMutableArray *userSatationIdMArray = [NSMutableArray array];
            NSMutableArray *userUnitIdMArray = [NSMutableArray array];
            for (int i = 0; i < model.result.items.count; i++) {
                
                NSString *loginId = model.result.items[i].loginId;
                NSString *roleId = model.result.items[i].roleId;
                NSString *userId = model.result.items[i].userId;
                NSString *userName = model.result.items[i].userName;
                NSString *userSatationId = model.result.items[i].userStationId;
                NSString *userUnitId = model.result.items[i].userUnitId;
                
                [loginIdMArray addObject:loginId];
                [roleIdMArray addObject:roleId];
                [userIdMArray addObject:userId];
                [userNameMArray addObject:userName];
                [userSatationIdMArray addObject:userSatationId];
                [userUnitIdMArray addObject:userUnitId];
            }
            response(loginIdMArray,roleIdMArray,userIdMArray,userNameMArray,userSatationIdMArray,userUnitIdMArray);
        } else {
            
            errorInfo(noData);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//选择完项目经理，点击确定之后同意发送到下一步
+(void)PostToNextStepWithCurrentActivityId:(NSInteger)currentActivityId TargetActivityId:(NSString *)targetActivityId ActivityId:(NSString *)activityId UserId:(NSString *)userId LoginId:(NSString *)loginId UserName:(NSString *)userName UserStationId:(NSString *)userStationId UserUnitId:(NSString *)userUnitId RoleId:(NSString *)roleId Opinion:(NSString *)opinion OnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    NSDictionary *parameters = @{@"currentActivityId":@(currentActivityId),
                                 @"targetActivityId":targetActivityId,
                                 @"targetActivityPerformers":@[@{@"activityId":activityId,@"performers":@[@{@"userId":userId,@"loginId":loginId,@"userName":userName,@"userStationId":userStationId,@"userUnitId":userUnitId,@"roleId":roleId}]}],@"opinion":opinion
                                 };
    
    [self setPublicHeader:manager];
    [manager POST:API_AGREETONEXTSTEP parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            response();
        } else {
            errorInfo();
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//在办中点击退回上一步，获得userId和returnTargetActivityInstanceId
+(void)getUserIdAndReturnTargetActivityInstanceIdWithActivityId:(NSInteger)activityId OnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *parameters = @{@"activityInstanceId":@(activityId)};
    
    [self setPublicHeader:manager];
    [manager GET:API_GETUSERID parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPGetUserIdModel *model = [JSEIMPGetUserIdModel mj_objectWithKeyValues:dict];
            
            NSInteger returnTargetActivityInstanceId = model.result.inComeActivity.ID;
            NSInteger canReturnPrevious = model.result.canReturnPrevious;
            NSInteger canRevokeBack = model.result.canRevokeBack;//撤回
            NSInteger canDestroy = model.result.canDestroy;//取消
            NSInteger canSend = model.result.canSend;//发送
            NSInteger canSignup = model.result.canSignup;//签收
            NSInteger canExpandCopy = model.result.canExpandCopy;//抄送
            NSInteger canTransferVerify = model.result.canTransferVerify;//转签
            
            NSMutableArray *userIdMArray = [NSMutableArray array];
            for (int i = 0; i < model.result.inComeActivity.workItems.count; i++) {
                
                NSString *userId = model.result.inComeActivity.workItems[i].userId;
                
                [userIdMArray addObject:userId];
            }
            
            response(canReturnPrevious,canRevokeBack,canDestroy,canSend,canSignup,canExpandCopy,canTransferVerify,returnTargetActivityInstanceId,userIdMArray);
        } else {
            
            errorInfo(noData);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//写完退回原因，点击确定获取退回的用户信息
+(void)getUserInfoWithUserId:(NSString *)userId OnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *parameters = @{@"userId":userId};
    
    [self setPublicHeader:manager];
    [manager GET:API_GETUSERINFO parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPBackUserInfoModel *model = [JSEIMPBackUserInfoModel mj_objectWithKeyValues:dict];
            
            NSString *loginId = model.result.loginId;
            NSString *roleId = model.result.roleId;
            NSString *userId = model.result.userId;
            NSString *userName = model.result.userName;
            NSString *userStationId = model.result.userStationId;
            NSString *userUnitId = model.result.userUnitId;
            
            response(loginId,roleId,userId,userName,userStationId,userUnitId);
        } else {
            
            errorInfo(noData);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//最后点确定的退回操作
+(void)PostComeBackPeopleStepWithActivityInstanceId:(NSInteger)activityInstanceId ReturnTargetActivityInstanceId:(NSInteger)returnTargetActivityInstanceId ReturnReason:(NSString *)returnReason UserId:(NSString *)userId LoginId:(NSString *)loginId UserName:(NSString *)userName UserStationId:(NSString *)userStationId UserUnitId:(NSString *)userUnitId RoleId:(NSString *)roleId OnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    NSDictionary *parameters = @{@"activityInstanceId":@(activityInstanceId),
                                 @"returnTargetActivityInstanceId":@(returnTargetActivityInstanceId),
                                 @"returnReason":returnReason,
                                 @"targetPerformer":@{@"userId":userId,
                                                      @"loginId":loginId,
                                                      @"userName":userName,
                                                      @"userStationId":userStationId,
                                                      @"userUnitId":userUnitId,
                                                      @"roleId":roleId
                                                      }
                                 };
    
    [self setPublicHeader:manager];
    [manager POST:API_POSTCOMEBACK parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            response();
        } else {
            errorInfo();
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//撤回操作
+(void)PostCheHuikStepWithActivityId:(NSInteger)activityId RevokeBackReason:(NSString *)revokeBackReason OnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    NSDictionary *parameters = @{@"activityId":@(activityId),
                                 @"revokeBackReason":revokeBackReason};
    
    [self setPublicHeader:manager];
    [manager POST:API_POSTCHEHUI parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            response();
        } else {
            errorInfo();
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//取消操作
+(void)PostCancelStepWithActivityId:(NSInteger)activityId OnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    NSDictionary *parameters = @{@"activityId":@(activityId)};
    
    [self setPublicHeader:manager];
    [manager POST:API_POSTCANCEL parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            response();
        } else {
            errorInfo();
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//获得部门列表
+(void)getBuMenListWithShangJiBuMen:(NSString *)shangJiBuMen IsIncludeZiJieDian:(NSString *)isIncludeZiJieDian SkipCount:(NSInteger)skipCount MaxResultCount:(NSInteger)maxResultCount OnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *parameters = @{@"ParentId":shangJiBuMen,
                                 @"IncludeOffspring":isIncludeZiJieDian,
                                 @"SkipCount":@(skipCount),
                                 @"MaxResultCount":@(maxResultCount)
                                 };
    
    [self setPublicHeader:manager];
    [manager GET:API_GETBUMENLIST parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPBuMenModel *model = [JSEIMPBuMenModel mj_objectWithKeyValues:dict];
            
            NSMutableArray *buMenNameMArray = [NSMutableArray array];
            for (int i = 0; i < model.result.count; i++) {
                
                NSString *buMenName = model.result[i].unitName;
                
                [buMenNameMArray addObject:buMenName];
            }
            
            response(buMenNameMArray);
        } else {
            
            errorInfo(noData);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//获得全部用户列表
+(void)getUserListWithSkipCount:(NSInteger)skipCount MaxResultCount:(NSInteger)maxResultCount OnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *parameters = @{@"SkipCount":@(skipCount),
                                 @"MaxResultCount":@(maxResultCount)
                                 };
    
    [self setPublicHeader:manager];
    [manager GET:API_GETUSERLIST parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPUserModel *model = [JSEIMPUserModel mj_objectWithKeyValues:dict];
            
            NSMutableArray *userNameMArray = [NSMutableArray array];
            NSMutableArray *userIdMArray = [NSMutableArray array];
            for (int i = 0; i < model.result.count; i++) {
                
                NSString *userName = model.result[i].userName;
                NSString *userId = model.result[i].userId;
                
                if (userName == nil) {
                 
                    userName = @"";
                }if (userId == nil) {
                    
                    userId = @"";
                }
                [userNameMArray addObject:userName];
                [userIdMArray addObject:userId];
            }

            response(userNameMArray,userIdMArray);
        } else {
            
            errorInfo(noData);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//获得无岗位用户列表
+(void)getUserListWithStationIdIfNull:(NSString *)stationIdIfNull SkipCount:(NSInteger)skipCount MaxResultCount:(NSInteger)maxResultCount OnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *parameters = @{@"tationIdIfNull":stationIdIfNull,
                                 @"SkipCount":@(skipCount),
                                 @"MaxResultCount":@(maxResultCount)
                                 };
    
    [self setPublicHeader:manager];
    [manager GET:API_GETUSERLIST parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            
            JSEIMPUserModel *model = [JSEIMPUserModel mj_objectWithKeyValues:dict];
            
            NSMutableArray *userNameMArray = [NSMutableArray array];
            NSMutableArray *userIdMArray = [NSMutableArray array];
            for (int i = 0; i < model.result.count; i++) {
                
                NSString *userName = model.result[i].userName;
                NSString *userId = model.result[i].userId;
                
                if (userName == nil) {
                    
                    userName = @"";
                }if (userId == nil) {
                    
                    userId = @"";
                }
                [userNameMArray addObject:userName];
                [userIdMArray addObject:userId];
            }
            
            response(userNameMArray,userIdMArray);
        } else {
            
            errorInfo(noData);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//获得大象云Token
+(void)getDaXiangYunTokenwithSuccessBlock:(void (^)())response{
    
    NSDictionary *dict = @{@"app_id" : @"a029791e04a446b6b6bfdfcb3f0e09ca" , @"security_key" : @"9c5b08326c064f04ae2f7bb2367309a0"};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager POST:@"https://open.daxiangyun.com/dx/api/auth/token" parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = responseObject[@"data"];
            NSString *token = dict[@"token"];
            NSString *apiString = @"https://open.daxiangyun.com/dx/api/f/v1/file/status?token=";
            NSString *tokenString = [apiString stringByAppendingString:token];
            NSString *finalURLString = [tokenString stringByAppendingString:@"&path=opendx/a029791e04a446b6b6bfdfcb3f0e09ca/2eebe594b24c455f8140b602e3cb73c2/2eebe594b24c455f8140b602e3cb73c2.rvt"];
            
            if (finalURLString) {
                
                [self getModelStatusWithURLString:finalURLString SuccessBlock:^(NSString *urlString){
                    
                    response(urlString);
                }];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (!error) {
            
        }

        NSLog(@"%@",error);
    }];
}

//抄送操作
+(void)PostChaoSongStepWithActivityInstanceId:(NSInteger)activityInstanceId TargetUsers:(NSMutableArray *)targetUsers OnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    NSDictionary *parameters = @{@"activityInstanceId":@(activityInstanceId),
                                 @"targetUsers":targetUsers
                                 };
    NSLog(@"targetUsers：%@",targetUsers);
    
    [self setPublicHeader:manager];
    [manager POST:API_POSTCHAOSONG parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            response();
        } else {
            errorInfo();
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//转签操作
+(void)PostZhuanQianStepWithReason:(NSString *)reason ActivityInstanceId:(NSInteger)activityInstanceId TargetUsers:(NSMutableArray *)targetUsers OnSuccess:(void (^)())response onErrorInfo:(void (^)())errorInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    NSDictionary *parameters = @{@"reason":reason,
                                 @"activityInstanceId":@(activityInstanceId),
                                 @"targetUsers":targetUsers
                                 };
    NSLog(@"targetUsers：%@",targetUsers);
    
    [self setPublicHeader:manager];
    [manager POST:API_POSTZHUANQIAN parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            response();
        } else {
            errorInfo();
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

//获取模型
+(void)getModelStatusWithURLString:(NSString *)urlString SuccessBlock:(void (^)())response{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager GET:urlString parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSDictionary *dict = responseObject[@"data"];
            
            if ([dict[@"status"] isEqualToString:@"Ready"]) {
                
                NSString *urlString = dict[@"url"];
                
                NSString *finalURLString = [urlString stringByAppendingString:@"&props=1"];
                
                response(finalURLString);
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (!error) {
            
        }
        
        NSLog(@"%@",error);
    }];
    
}


@end
