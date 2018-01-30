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

@end

@interface GetUserIdModel : NSObject

@property(nonatomic,strong)GetInComeActivityModel *inComeActivity;

@property(nonatomic,strong)NSMutableArray<GetUserIdArrayModel *> *workItems;

@end

@interface JSEIMPGetUserIdModel : NSObject

@property(nonatomic,strong)GetUserIdModel *result;

@end
