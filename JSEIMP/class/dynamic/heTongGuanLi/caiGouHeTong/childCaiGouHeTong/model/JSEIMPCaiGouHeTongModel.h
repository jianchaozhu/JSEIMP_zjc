//
//  JSEIMPCaiGouHeTongModel.h
//  JSEIMP
//
//  Created by 朱建超 on 2017/12/20.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CaiGouHeTongModel : NSObject

@property(nonatomic,strong)NSString *ContractId;

@property(nonatomic,strong)NSString *ContractName;

@property(nonatomic,assign)NSInteger Status;

@end

@interface JSEIMPCaiGouHeTongModel : NSObject

@property(nonatomic,strong)NSMutableArray<CaiGouHeTongModel *> *ContractList;

@property(nonatomic,assign)NSInteger Code;

@end
