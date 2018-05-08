//
//  JSEIMPGetUserIdModel.h
//  JSEIMP
//
//  Created by 朱建超 on 2018/1/30.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetUserIdArrayModel : NSObject

@property(nonatomic,strong)NSString *userId;

@end

@interface GetInComeActivityModel : NSObject

@property(nonatomic,assign)NSInteger ID;

@property(nonatomic,strong)NSMutableArray<GetUserIdArrayModel *> *workItems;

@end

@interface GetUserIdModel : NSObject

@property(nonatomic,strong)GetInComeActivityModel *inComeActivity;

@property(nonatomic,assign)NSInteger canReturnPrevious;
//撤回
@property(nonatomic,assign)NSInteger canRevokeBack;
//取消
@property(nonatomic,assign)NSInteger canDestroy;
//发送
@property(nonatomic,assign)NSInteger canSend;
//签收
@property(nonatomic,assign)NSInteger canSignup;
//抄送
@property(nonatomic,assign)NSInteger canExpandCopy;
//转签
@property(nonatomic,assign)NSInteger canTransferVerify;
//加签
@property(nonatomic,assign)NSInteger canExpandVerify;

@end

@interface JSEIMPGetUserIdModel : NSObject

@property(nonatomic,strong)GetUserIdModel *result;

@end
