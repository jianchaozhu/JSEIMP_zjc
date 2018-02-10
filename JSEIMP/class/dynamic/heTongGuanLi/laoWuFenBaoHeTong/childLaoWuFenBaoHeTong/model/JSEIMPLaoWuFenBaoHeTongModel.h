//
//  JSEIMPLaoWuFenBaoHeTongModel.h
//  JSEIMP
//
//  Created by 朱建超 on 2018/2/5.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LaoWuFenBaoHeTongModel : NSObject

@property(nonatomic,strong)NSString *ContractId;

@property(nonatomic,strong)NSString *ContractName;

@property(nonatomic,assign)NSInteger Status;

@end

@interface JSEIMPLaoWuFenBaoHeTongModel : NSObject

@property(nonatomic,strong)NSMutableArray<LaoWuFenBaoHeTongModel *> *ContractList;

@property(nonatomic,assign)NSInteger Code;

@end
