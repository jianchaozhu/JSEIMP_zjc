//
//  SkyAssociationMenuView.m
//
//  Created by skytoup on 14-10-24.
//  Copyright (c) 2014年 skytoup. All rights reserved.
//

#import "SkyAssociationMenuView.h"

NSString *const IDENTIFIER = @"CELL";

@interface SkyAssociationMenuView () <UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>
{
    NSArray *tables;
}
@end

@implementation SkyAssociationMenuView{

    UIButton *_cancelBtn;
    
    UITableViewCell *_cell;

}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    NSAssert(false, @"cann't not use - initWithCoder:, please user - init");
    return nil;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 初始化选择项
        for(int i=0; i!=3; ++i) {
            sels[i] = -1;
        }
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_button setFrame:CGRectMake(0, 0, 100, 30)];
        
        [self addSubview:_button];
        
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.userInteractionEnabled = YES;
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelBtn.frame = self.frame;
        [_cancelBtn addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_cancelBtn];
        // 初始化菜单
        tables = @[[[UITableView alloc] init], [[UITableView alloc] init], [[UITableView alloc] init] ];
        [tables enumerateObjectsUsingBlock:^(UITableView *table, NSUInteger idx, BOOL *stop) {
            [table registerClass:[UITableViewCell class] forCellReuseIdentifier:IDENTIFIER ];
            table.dataSource = self;
            table.delegate = self;
            table.frame = CGRectMake(0, 0, 0, 0);
            table.backgroundColor = [UIColor clearColor];
            table.tableFooterView = [UIView new];
        }];
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor colorWithRed:.0f green:.0f blue:.0f alpha:.3f];
        _bgView.userInteractionEnabled = YES;
        [_bgView addSubview:[tables objectAtIndex:0] ];
        
    }
    return self;
}

#pragma mark private
/**
 *  调整表视图的位置、大小
 */
- (void)adjustTableViews{
    int w = SCREEN_WIDTH;
    int __block showTableCount = 0;
    [tables enumerateObjectsUsingBlock:^(UITableView *t, NSUInteger idx, BOOL *stop) {
        CGRect rect = t.frame;
        rect.size.height = SCREEN_HEIGHT - _bgView.frame.origin.y;
        t.frame = rect;
        if(t.superview)
            ++showTableCount;
    }];
    
    for(int i=0; i!=showTableCount; ++i){
        UITableView *t = [tables objectAtIndex:i];
        CGRect f = t.frame;
        f.size.width = w / showTableCount;
        f.origin.x = f.size.width * i;
        t.frame = f;
    }
}
/**
 *  取消选择
 */
- (void)cancel{
    [self dismissWithTag:_button.tag];
    if([self.delegate respondsToSelector:@selector(assciationMenuViewCancel)]) {
        [self.delegate assciationMenuViewCancel];
    }
}

/**
 *  保存table选中项
 */
- (void)saveSels{
    [tables enumerateObjectsUsingBlock:^(UITableView *t, NSUInteger idx, BOOL *stop) {
        sels[idx] = t.superview ? t.indexPathForSelectedRow.row : -1;
    }];
}

/**
 *  加载保存的选中项
 */
- (void)loadSels{
    [tables enumerateObjectsUsingBlock:^(UITableView *t, NSUInteger i, BOOL *stop) {
        [t selectRowAtIndexPath:[NSIndexPath indexPathForRow:sels[i] inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
        if((sels[i] != -1 && !t.superview) || !i) {
            [_bgView addSubview:t];
        }
        
    }];
}

#pragma mark public
- (void)setSelectIndexForClass1:(NSInteger)idx_1 class2:(NSInteger)idx_2 class3:(NSInteger)idx_3 {
    sels[0] = idx_1;
    sels[1] = idx_2;
    sels[2] = idx_3;
}

- (void)showAsDrawDownView:(UIButton *)button Tag:(NSInteger)tag{
    
    _button = button;
    _button.tag = tag;
    
    NSLog(@"%zd",_button.tag);
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    CGRect showFrame = button.frame;
    showFrame = [button.superview convertRect:showFrame toView:window];
    CGFloat x = 0.f;
    CGFloat y = showFrame.origin.y+showFrame.size.height;
    CGFloat w = SCREEN_WIDTH;
    CGFloat h = SCREEN_HEIGHT-y;
    _bgView.frame = CGRectMake(x, y, w, h);
    if(!_bgView.superview) {
        [self addSubview:_bgView];
    }
    [self loadSels];
    [self adjustTableViews];
    if(!self.superview) {
        [window addSubview:self];
        self.alpha = .0f;
        [UIView animateWithDuration:.25f animations:^{
            self.alpha = 1.0f;
        }];
    }
    [window bringSubviewToFront:self];
}

- (void)dismissWithTag:(NSInteger)tag{
    if(self.superview) {
        [UIView animateWithDuration:.25f animations:^{
            self.alpha = .0f;
        } completion:^(BOOL finished) {
            [_bgView.subviews enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
                [obj removeFromSuperview];
            }];
            [self removeFromSuperview];
            
            if (tag == 1) {
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"jiaFang" object:_button.titleLabel.text];
                
            }else if (tag == 2){
            
                [[NSNotificationCenter defaultCenter] postNotificationName:@"yiFang" object:_button.titleLabel.text];
            }
            
        }];
    }
}

#pragma mark UITableViewDateSourceDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    _cell = [tableView dequeueReusableCellWithIdentifier:IDENTIFIER];
    if(tableView == [tables objectAtIndex:0]){
        _cell.textLabel.text = [_delegate assciationMenuView:self titleForClass_1:indexPath.row];
    }else if(tableView == [tables objectAtIndex:1]){
        _cell.textLabel.text = [_delegate assciationMenuView:self titleForClass_1:((UITableView*)tables[0]).indexPathForSelectedRow.row class_2:indexPath.row];
    }else if(tableView == [tables objectAtIndex:2]){
        _cell.textLabel.text = [_delegate assciationMenuView:self titleForClass_1:((UITableView*)tables[0]).indexPathForSelectedRow.row class_2:((UITableView*)tables[1]).indexPathForSelectedRow.row class_3:indexPath.row];
    }
    
    _cell.textLabel.font = [UIFont systemFontOfSize:12];
    _cell.textLabel.numberOfLines = 0;
    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return _cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger __block count;
    [tables enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if(obj == tableView) {
            count = [_delegate assciationMenuView:self countForClass:idx];
            *stop = YES;
        }
    }];
    return count;
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableView *t0 = [tables objectAtIndex:0];
    UITableView *t1 = [tables objectAtIndex:1];
    UITableView *t2 = [tables objectAtIndex:2];
    BOOL isNexClass = true;
    if(tableView == t0){
        if([self.delegate respondsToSelector:@selector(assciationMenuView:idxChooseInClass1:)]) {
            isNexClass = [_delegate assciationMenuView:self idxChooseInClass1:indexPath.row];
            
        }
        if(isNexClass) {
            [t1 reloadData];
            if(!t1.superview) {
                [_bgView addSubview:t1];
            }
            if(t2.superview) {
                [t2 removeFromSuperview];
            }
            [self adjustTableViews];
        }else{
            if(t1.superview) {
                [t1 removeFromSuperview];
            }
            if(t2.superview) {
                [t2 removeFromSuperview];
            }
            [self saveSels];
            [self dismissWithTag:_button.tag];
        }
    }else if(tableView == t1) {
        if([self.delegate respondsToSelector:@selector(assciationMenuView:idxChooseInClass1:class2:)]) {
            isNexClass = [_delegate assciationMenuView:self idxChooseInClass1:t0.indexPathForSelectedRow.row class2:indexPath.row];
        }
        if(isNexClass){
            [t2 reloadData];
            if(!t2.superview) {
                [_bgView addSubview:t2];
            }
            [self adjustTableViews];
        }else{
            if(t2.superview) {
                [t2 removeFromSuperview];
            }
            [self saveSels];
            [self dismissWithTag:_button.tag];
        }
    }else if(tableView == t2) {
        
        _cell = [tableView cellForRowAtIndexPath:indexPath];
        
        if([self.delegate respondsToSelector:@selector(assciationMenuView:idxChooseInClass1:class2:class3:)]) {
            isNexClass = [_delegate assciationMenuView:self idxChooseInClass1:t0.indexPathForSelectedRow.row class2:t1.indexPathForSelectedRow.row class3:indexPath.row];
        }
        if(isNexClass) {
            
            if (_button.tag == 1) {
                
                [_button setTitle:[_delegate assciationMenuView:self titleForClass_1:((UITableView*)tables[0]).indexPathForSelectedRow.row class_2:((UITableView*)tables[1]).indexPathForSelectedRow.row class_3:indexPath.row] forState:UIControlStateNormal];
                
            }else if (_button.tag == 2){
            
                [_button setTitle:[_delegate assciationMenuView:self titleForClass_1:((UITableView*)tables[0]).indexPathForSelectedRow.row class_2:((UITableView*)tables[1]).indexPathForSelectedRow.row class_3:indexPath.row] forState:UIControlStateNormal];
            }
            
            [self saveSels];
            [self dismissWithTag:_button.tag];
        }
    }
}

@end
