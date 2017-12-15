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
#define HALOGINIP @"192.168.2.55:83"
//hamazon工作流API
#define HAWORKIP @"192.168.2.55:84"
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
//获得待办事项列表
#define API_DAIBANITEM @"http://"HAWORKIP"/api/services/wf/Instance/GetPendingWorkItems"
