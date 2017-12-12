//
//  JSEIMPAllChengBaoHeTongModel.h
//  JSEIMP
//
//  Created by 朱建超 on 2017/12/5.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AllChengBaoHeTongModel : NSObject

@property(nonatomic,strong)NSString *ContractId;

@property(nonatomic,strong)NSString *ContractName;

@property(nonatomic,assign)NSInteger Status;

@end

@interface JSEIMPAllChengBaoHeTongModel : NSObject

@property(nonatomic,strong)NSMutableArray<AllChengBaoHeTongModel *> *ContractList;

@property(nonatomic,assign)NSInteger Code;

@end
