//
//  JSEIMPTouBiaoGuanLiEditView.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/11/16.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPTouBiaoGuanLiEditView.h"

@implementation JSEIMPTouBiaoGuanLiEditView

- (IBAction)zhongBiaoNoteButton:(id)sender {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(pushToZhongBiaoTongZhiShuController)]) {
        
        [self.delegate pushToZhongBiaoTongZhiShuController];
    }
    
}

@end
