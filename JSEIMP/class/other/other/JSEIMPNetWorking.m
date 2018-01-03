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

//获得待办事项列表
+(void)getDaiBanItemOnSuccess:(void (^)())response onErrorInfo:(void (^)(JSEIMPError))errorInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    [self setPublicHeader:manager];
    
//    NSInteger count = 20;
//    NSString *url = [NSString stringWithFormat:API_DAIBANITEM"?MaxResultCount=%zd",count];
//    NSDictionary *parameters = @{@"MaxResultCount":@20};
    
    [manager GET:API_YIBANITEM parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if (responseObject != nil) {
            
            NSLog(@"成功");
        } else {
            
            errorInfo(noData);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

@end
