//
//  JSEIMPTouBiaoBaoZhengJinDetailModel.h
//  JSEIMP
//
//  Created by 朱建超 on 2017/11/25.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TouBiaoBaoZhengJinDetaillModel : NSObject
//建设单位
@property(nonatomic,strong)NSString *Owner;
//缴纳日期
@property(nonatomic,strong)NSString *PayDate;
//退款日期
@property(nonatomic,strong)NSString *RefundDate;
//缴纳账户
@property(nonatomic,strong)NSString *PayAccount;
//是否中标
@property(nonatomic,strong)NSString *Winflg;
//备注
@property(nonatomic,strong)NSString *Comment;

@end

@interface JSEIMPTouBiaoBaoZhengJinDetailModel : NSObject

@property(nonatomic,strong)TouBiaoBaoZhengJinDetaillModel *DepositDetails;

@property(nonatomic,assign)NSInteger Code;

@end
