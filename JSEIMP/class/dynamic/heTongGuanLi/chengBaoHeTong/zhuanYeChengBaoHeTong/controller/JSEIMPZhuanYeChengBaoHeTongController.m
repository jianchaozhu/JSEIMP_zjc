//
//  JSEIMPZhuanYeChengBaoHeTongController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/12/11.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPZhuanYeChengBaoHeTongController.h"
#import "JSEIMPNetWorking.h"
#import "JSEIMPZhuanYeChengBaoHeTongDetailController.h"

static NSString *cellID = @"cellID";

@interface JSEIMPZhuanYeChengBaoHeTongController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UIScrollViewDelegate>

@property(nonatomic,strong)NSMutableArray *contractIdMArray;

@property(nonatomic,strong)NSMutableArray *contractNameMArray;

@property(nonatomic,strong)NSMutableArray *statusMArray;

@property(nonatomic,strong)NSMutableArray *resultArray;

@property(nonatomic,strong)NSMutableArray *finalResultMArray;

@property(nonatomic,strong)NSMutableArray *finalMArray;

@property(nonatomic,assign)NSInteger searchTextLength;

@property(nonatomic,assign)NSInteger lenght;

@end

@implementation JSEIMPZhuanYeChengBaoHeTongController{
    
    UITableView *_tableView;
    
    UITableViewCell *_cell;
    
    UIView *_view;
    
    UISearchBar *_searchBar;
    
    UIButton *_cancel;
}

-(NSMutableArray *)resultArray{
    
    if (!_resultArray) {
        _resultArray = [NSMutableArray array];
    }
    return _resultArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"专业承包合同";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self getData];
    
    [self setupUI];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
}

- (void)returnAction {
    
    [self.navigationController popViewControllerAnimated:YES];
}

//UISearchBar作为tableview的头部
-(UIView *)headView{
    
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 64, 100, 44)];
    _searchBar.keyboardType = UIKeyboardAppearanceDefault;
    _searchBar.placeholder = @"请输入搜索关键字";
    _searchBar.delegate = self;
    //底部的颜色
    _searchBar.searchBarStyle = UISearchBarStyleDefault;
    _searchBar.barStyle = UIBarStyleDefault;
    return _searchBar;
}

//在搜索框中修改搜索内容时，自动触发下面的方法
-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    return YES;
}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    
    if (searchBar.text.length == 0) {
        
        self.navigationController.navigationBarHidden = YES;
        
        _view = [[UIView alloc] initWithFrame:self.view.bounds];
        _view.backgroundColor = [UIColor lightGrayColor];
        _view.alpha = 0.3;
        
        //点击手势
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchEvent)];
        
        [_view addGestureRecognizer:tapGestureRecognizer];
        
        _tableView.scrollEnabled = NO;
        [_tableView addSubview:_view];
    }
    searchBar.showsCancelButton = YES;//取消的字体颜色，
    [searchBar setShowsCancelButton:YES animated:YES];
    
    //改变取消的文本
    for(UIView *view in [[[searchBar subviews] objectAtIndex:0] subviews]) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *cancel =(UIButton *)view;
            [cancel setTitle:@"取消" forState:UIControlStateNormal];
            [cancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
    }
}

#pragma mark - 滚动事件
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    if (_searchBar.text.length > 0) {
        
        self.navigationController.navigationBarHidden = YES;
        [_searchBar resignFirstResponder];
        
        UIButton *cancelBtn = [_searchBar valueForKey:@"cancelButton"]; //首先取出cancelBtn
        cancelBtn.enabled = YES; //把enabled设置为yes
    }
}

#pragma mark - 触摸事件
-(void)touchEvent{
    
    _tableView.scrollEnabled = YES;
    [_view removeFromSuperview];
    [self.view endEditing:YES];
    [_searchBar setShowsCancelButton:NO animated:YES];
    [_searchBar resignFirstResponder];
}

-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    
    //滑动效果
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@ "ResizeForKeyboard"  context:nil];
    [UIView setAnimationDuration:animationDuration];
    //恢复屏幕
    self.view.frame = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height); //64-216
    [UIView commitAnimations];
    
    if (searchBar.text.length == 0) {
        self.navigationController.navigationBarHidden = NO;
        [searchBar setShowsCancelButton:NO animated:YES];
    }
    
    NSLog(@"输入搜索内容完毕");
}

//搜框中输入关键字的事件响应
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    NSLog(@"输入的关键字是---%@---%lu",searchText,(unsigned long)searchText.length);
    
    _tableView.scrollEnabled = YES;
    _lenght = searchText.length;
    
    if (_lenght == 0) {
        
        _view.backgroundColor = [UIColor lightGrayColor];
        _view.alpha = 0.3;
        
        //点击手势
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchEvent)];
        
        [_view addGestureRecognizer:tapGestureRecognizer];
        
        _tableView.scrollEnabled = NO;
        [_tableView addSubview:_view];
        
        [searchBar resignFirstResponder];
        //滑动效果（动画）
        NSTimeInterval animationDuration = 0.30f;
        [UIView beginAnimations:@ "ResizeForKeyboard"  context:nil];
        [UIView setAnimationDuration:animationDuration];
        //将视图的Y坐标向上移动，以使下面腾出地方用于软键盘的显示
        self.view.frame = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height); //64-216
        [UIView commitAnimations];
    }
    
    [_view removeFromSuperview];
    
    //需要事先情况存放搜索结果的数组
    [self.resultArray removeAllObjects];
    
    NSLog(@"%@",self.resultArray);
    
    //加个多线程，否则数量量大的时候，有明显的卡顿现象
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    dispatch_async(globalQueue, ^{
        if (searchText!=nil && searchText.length>0) {
            
            //遍历需要搜索的所有内容，其中self.dataArray为存放总数据的数组
            for (NSString *projectName in _contractNameMArray) {
                
                //----------->把所有的搜索结果转成成拼音
                NSString *pinyin = [self transformToPinyin:projectName];
                NSLog(@"pinyin--%@",pinyin);
                
                if ([pinyin rangeOfString:searchText options:NSCaseInsensitiveSearch].length >0 ) {
                    //把搜索结果存放self.resultArray数组
                    [self.resultArray addObject:projectName];
                    
                    _finalResultMArray = [[NSMutableArray alloc]init];
                    for (NSString *str in self.resultArray) {
                        if (![_finalResultMArray containsObject:str]) {
                            
                            [_finalResultMArray addObject:str];
                            
                        }
                    }
                    
                    if (_finalResultMArray) {
                        [self.resultArray removeAllObjects];
                    }
                    
                    self.resultArray = [NSMutableArray arrayWithArray:_finalResultMArray];
                    
                }
                
            }
            
        }else{
            
            self.resultArray = [NSMutableArray arrayWithArray:_contractNameMArray];
        }
        
        //回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            [_tableView reloadData];
        });
    });
}

//取消的响应事件
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
    self.navigationController.navigationBarHidden = NO;
    searchBar.text = @"";
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    self.resultArray = [NSMutableArray arrayWithArray:_contractNameMArray];
    [_tableView reloadData];
}

//键盘上搜索事件的响应
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    NSLog(@"搜索");
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
}

#pragma mark--获取汉字转成拼音字符串 通讯录模糊搜索 支持拼音检索 首字母 全拼 汉字 搜索
- (NSString *)transformToPinyin:(NSString *)aString{
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    NSArray *pinyinArray = [str componentsSeparatedByString:@" "];
    NSMutableString *allString = [NSMutableString new];
    
    int count = 0;
    
    for (int  i = 0; i < pinyinArray.count; i++)
    {
        
        for(int i = 0; i < pinyinArray.count;i++)
        {
            if (i == count) {
                [allString appendString:@"#"];//区分第几个字母
            }
            [allString appendFormat:@"%@",pinyinArray[i]];
            
        }
        [allString appendString:@","];
        count ++;
        
    }
    
    NSMutableString *initialStr = [NSMutableString new];//拼音首字母
    
    for (NSString *s in pinyinArray)
    {
        if (s.length > 0)
        {
            
            [initialStr appendString:  [s substringToIndex:1]];
        }
    }
    
    [allString appendFormat:@"#%@",initialStr];
    [allString appendFormat:@",#%@",aString];
    
    return allString;
}

-(void)getData{
    
    [JSEIMPNetWorking getZhuanYeChengBaoHeTongOnSuccess:^(NSMutableArray *contractIdMArray,NSMutableArray *contractNameMArray,NSMutableArray *statusMArray){
        
        _contractIdMArray = contractIdMArray.copy;
        _contractNameMArray = contractNameMArray.copy;
        _statusMArray = statusMArray.copy;
        
        _finalMArray = [NSMutableArray array];
        
        NSString *string1 = @"合同状态：";
        NSString *string2;
        
        for (int i = 0; i < _statusMArray.count; i++) {
            
            string2 = [string1 stringByAppendingString:_statusMArray[i]];
            
            [_finalMArray addObject:string2];
            
            [self.resultArray addObject:_contractNameMArray[i]];
        }
        
        [_tableView reloadData];
        
    } onErrorInfo:nil];
    
}

-(void)setupUI{
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    _tableView.tableHeaderView = [self headView];
    _tableView.tableFooterView = [[UIView alloc]init];
    
    [self.view addSubview:_tableView];
    
    //添加右边的按钮
    //    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(clickAddButton)];
    //
    //    self.navigationItem.rightBarButtonItem = addButton;
    
}

//-(void)clickAddButton{
//
//    JSEIMPNewChengBaoHeTongController *newChengBaoHeTongController = [JSEIMPNewChengBaoHeTongController new];
//
//    [self.navigationController pushViewController:newChengBaoHeTongController animated:YES];
//
//    //    if (_canInformationPut == YES) {
//
//    //    }
//    //    else if (_canInformationPut == NO){
//    //
//    //        [self setupAlertLabelWithTitle:@"对不起，您没有此权限" Rect:CGRectMake(self.view.center.x - 90, self.view.center.y + 100, 180, 50)];
//    //
//    //    }
//
//}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.resultArray.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *str = self.resultArray[indexPath.row];
    
    CGSize size = [str sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(280, 999) lineBreakMode:NSLineBreakByWordWrapping];
    
    return size.height + 50;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JSEIMPZhuanYeChengBaoHeTongDetailController *zhuanYeChengBaoHeTongDetailController = [JSEIMPZhuanYeChengBaoHeTongDetailController new];
    
    zhuanYeChengBaoHeTongDetailController.contractName = _contractNameMArray[indexPath.row];
    zhuanYeChengBaoHeTongDetailController.status = _statusMArray[indexPath.row];
    zhuanYeChengBaoHeTongDetailController.contractId = _contractIdMArray[indexPath.row];
    
    [self.navigationController pushViewController:zhuanYeChengBaoHeTongDetailController animated:YES];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView cellForRowAtIndexPath:indexPath];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    
    _cell.textLabel.text = self.resultArray[indexPath.row];
    _cell.detailTextLabel.text = _finalMArray[indexPath.row];
    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    _cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _cell.textLabel.numberOfLines = 0;
    _cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
    if ([_statusMArray[indexPath.row] isEqualToString:@"待审"] || [_statusMArray[indexPath.row] isEqualToString:@"审批中"]) {
        _cell.detailTextLabel.textColor = [UIColor orangeColor];
    }else if ([_statusMArray[indexPath.row] isEqualToString:@"已审"]){
        _cell.detailTextLabel.textColor = [UIColor greenColor];
    }
    
    return _cell;
    
}

@end
