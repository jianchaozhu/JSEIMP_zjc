//
//  JSEIMPServerInfo.h
//  loginTest
//
//  Created by 朱建超 on 2017/11/2.
//  Copyright © 2017年 朱建超. All rights reserved.
//

//测试API
//#define IP @"192.168.2.53:8002"
//周军本地API
//#define IP @"api.jaso.com"
//正式API
#define IP @"192.168.2.55:6002"
//hamazon登录API
#define HALOGINIP @"sso.jaso.com.cn:83"
//hamazon工作流正式API
#define HAWORKIP @"wf.jaso.com.cn:84/app"
//hamazon工作流测试API
//#define HAWORKIP @"192.168.2.53:8030/app"
//登录
#define API_LOGIN @"http://"HALOGINIP"/connect/token"
//获取投标项目列表
#define API_TOUBIAOLIST @"http://"IP"/api/Bidding/Project/GetList"
//获取投标项目明细
#define API_TOUBIAODETAIL @"http://"IP"/api/Bidding/Project/GetDetails"
//获得投标保证金列表
#define API_TOUBIAOBAOZHENJIN @"http://"IP"/api/Bidding/Deposit/GetList"
//获得投标保证金明细
#define API_TOUBIAOBAOZHENJINDETAIL @"http://"IP"/api/Bidding/Deposit/GetDetails"
//获得农名工保证金列表
#define API_FARMERBAOZHENJIN @"http://"IP"/api/Bidding/Deposit/GetList"
//获得农名工保证金明细
#define API_FARMERBAOZHENJINDETAIL @"http://"IP"/api/Bidding/Deposit/GetDetails"
//获得项目奖项列表
#define API_PROJECTJIANGXIANG @"http://"IP"/api/Bidding/Award/GetList"
//获得项目奖项明细
#define API_PROJECTJIANGXIANGDETAIL @"http://"IP"/api/Bidding/Award/GetDetails"
//获得总承包合同列表
#define API_ALLCHENGBAOHETONG @"http://"IP"/api/Contract/Contract/GetList"
//获得总承包合同详情
#define API_ALLCHENGBAOHETONGDETAIL @"http://"IP"/api/Contract/Contract/GetDetails"
//获得专业承包合同列表
#define API_ZHUANYECHENGBAOHETONG @"http://"IP"/api/Contract/Contract/GetList"
//获得专业承包合同详情
#define API_ZHUANYECHENGBAOHETONGDETAIL @"http://"IP"/api/Contract/Contract/GetDetails"
//获得专业分包合同列表
#define API_ZHUANYEFENBAOHETONG @"http://"IP"/api/Contract/Contract/GetList"
//获得专业分包合同详情
#define API_ZHUANYEFENBAOHETONGDETAIL @"http://"IP"/api/Contract/Contract/GetDetails"
//获得采购合同列表
#define API_CAIGOUHETONG @"http://"IP"/api/Contract/Contract/GetList"
//获得采购合同详情
#define API_CAIGOUHETONGDETAIL @"http://"IP"/api/Contract/Contract/GetDetails"
//获得待办事项列表
#define API_DAIBANITEM @"http://"HAWORKIP"/api/services/wf/Instance/GetPendingWorkItems"
//获得代办事项详情
#define API_DAIBANITEMSDETAIL @"http://"IP"/api/Contract/Contract/GetDetails"
//获得在办事项列表
#define API_ZAIBANITEM @"http://"HAWORKIP"/api/services/wf/Instance/GetInTrayWorkItems"
//获得已办事项列表
#define API_YIBANITEM @"http://"HAWORKIP"/api/services/wf/Instance/GetOutTrayWorkItems"
//工作台签收
#define API_CONTRACTQIANSHOU @"http://"HAWORKIP"/api/services/wf/Instance/ActivitySignUpAsync"
//代办中点击合同同意，获取targetActivityId和activityId
#define API_GETTARGETACTIVITYID @"http://"HAWORKIP"/api/services/wf/Instance/GetOutTransitions"
//代办中点击建议VC里的确定，获得允许的操作人
#define API_GETCAOZUOPEOPLE @"http://"HAWORKIP"/api/services/wf/Instance/GetActivityPerformers"
//代办中选择完项目经理，点击确定之后同意发送到下一步
#define API_AGREETONEXTSTEP @"http://"HAWORKIP"/api/services/wf/Instance/ActivitySendAsync"
//在办中点击退回上一步，获得userId和returnTargetActivityInstanceId
#define API_GETUSERID @"http://"HAWORKIP"/api/services/wf/Instance/GetActivityInstance"

