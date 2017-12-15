//
//  JSEIMPDaiBanItemsController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/12/14.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPDaiBanItemsController.h"
#import "JSEIMPNetWorking.h"

@interface JSEIMPDaiBanItemsController ()

@end

@implementation JSEIMPDaiBanItemsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.title = @"待办事项";
    
    [self getData];
}

-(void)getData{
    
    [JSEIMPNetWorking getDaiBanItemOnSuccess:^{
        
    } onErrorInfo:nil];
}

@end
