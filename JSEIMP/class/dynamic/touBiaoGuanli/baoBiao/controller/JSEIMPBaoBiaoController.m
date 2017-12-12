//
//  JSEIMPBaoBiaoController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/10/25.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPBaoBiaoController.h"
#import "JSEIMPBaoBiaoDetailController.h"

static NSString *cellID = @"cellID";

@interface JSEIMPBaoBiaoController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *projectNameMArray;

@property(nonatomic,strong)NSMutableArray *projectBuildMoneyMArray;

@property(nonatomic,strong)NSMutableArray *buildMianJiMArray;

@property(nonatomic,strong)NSMutableArray *resultArray;

@end

@implementation JSEIMPBaoBiaoController{

    UITableView *_tableView;
    
    UITableViewCell *_cell;
    
    NSMutableArray *_finalMArray;

}

-(NSMutableArray *)resultArray{
    
    if (!_resultArray) {
        _resultArray = [NSMutableArray array];
    }
    return _resultArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"报表";
    
    _projectNameMArray = [NSMutableArray arrayWithObjects:@"瓦屋李新城二期土建安装工程",@"无锡万科金域缇香", nil];
    _projectBuildMoneyMArray = [NSMutableArray arrayWithObjects:@"100",@"120", nil];
    _buildMianJiMArray = [NSMutableArray arrayWithObjects:@"109453.1",@"35628.31", nil];
    
    NSString *string1 = @"工程造价(万元)：";
    NSString *string2 = @"(万元)";
    NSString *string3;
    NSString *string4;
    NSString *string5 = @"   ";
    NSString *string6;
    NSString *string7 = @"建筑面积(平方米)：";
    NSString *string8;
    NSString *string9;
    NSString *string10 = @"平方米";
    NSString *string11;
    
    _finalMArray = [NSMutableArray array];
    
    for (int i = 0; i < _projectBuildMoneyMArray.count; i++) {
        
        string3 = [string1 stringByAppendingString:_projectBuildMoneyMArray[i]];
        string4 = [string3 stringByAppendingString:string2];
        string6 = [string4 stringByAppendingString:string5];
        string8 = [string6 stringByAppendingString:string7];
        string9 = [string8 stringByAppendingString:_buildMianJiMArray[i]];
        string11 = [string9 stringByAppendingString:string10];
        
        [_finalMArray addObject:string11];
    }
    
    [self.resultArray addObjectsFromArray:_projectNameMArray];
    [self setupUI];
    
}

//UISearchBar作为tableview的头部
-(UIView *)headView{
    
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 64, 100, 44)];
    searchBar.keyboardType = UIKeyboardAppearanceDefault;
    searchBar.placeholder = @"请输入搜索关键字";
    searchBar.delegate = self;
    //底部的颜色
    searchBar.searchBarStyle = UISearchBarStyleDefault;
    searchBar.barStyle = UIBarStyleDefault;
    return searchBar;
}

//在搜索框中修改搜索内容时，自动触发下面的方法
-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    return YES;
}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    
    NSLog(@"开始输入搜索内容");
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

-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    NSLog(@"输入搜索内容完毕");
}

//搜框中输入关键字的事件响应
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    NSLog(@"输入的关键字是---%@---%lu",searchText,(unsigned long)searchText.length);
    
    //需要事先情况存放搜索结果的数组
    [self.resultArray removeAllObjects];
    
    
    //加个多线程，否则数量量大的时候，有明显的卡顿现象
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    dispatch_async(globalQueue, ^{
        if (searchText!=nil && searchText.length>0) {
            
            //遍历需要搜索的所有内容，其中self.dataArray为存放总数据的数组
            for (int i = 0; i < _projectNameMArray.count; i++) {
                
                //----------->把所有的搜索结果转成成拼音
                NSString *pinyin = [self transformToPinyin:_projectNameMArray[i]];
                NSLog(@"pinyin--%@",pinyin);
                
                if ([pinyin rangeOfString:searchText options:NSCaseInsensitiveSearch].length >0 ) {
                    //把搜索结果存放self.resultArray数组
                    [self.resultArray addObject:_projectNameMArray[i]];
                    
                    NSLog(@"%@",_resultArray);
                }
            }
            
        }else{
            
            _resultArray = [NSMutableArray arrayWithArray:_projectNameMArray];
        }
        
        //回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            [_tableView reloadData];
        });
    });
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
    searchBar.text = @"";
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    self.resultArray = [NSMutableArray arrayWithArray:_projectNameMArray];
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


-(void)setupUI{
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    _tableView.tableHeaderView = [self headView];
    _tableView.tableFooterView = [[UIView alloc]init];
    
    [self.view addSubview:_tableView];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.resultArray.count;
    
//    return _projectBuildMoneyMArray.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_cell.textLabel.text.length > 20) {
        
        return 100;
    }
    
    return 80;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JSEIMPBaoBiaoDetailController *_baoBiaoDetailController = [JSEIMPBaoBiaoDetailController new];
    
    _baoBiaoDetailController.projectName = _projectNameMArray[indexPath.row];
    _baoBiaoDetailController.projectBuildMoney = _projectBuildMoneyMArray[indexPath.row];
    _baoBiaoDetailController.buildMianJi = _buildMianJiMArray[indexPath.row];
    
    [self.navigationController pushViewController:_baoBiaoDetailController animated:YES];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell= [tableView cellForRowAtIndexPath:indexPath];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    
    _cell.textLabel.text = _resultArray[indexPath.row];
    _cell.detailTextLabel.text = _finalMArray[indexPath.row];
    _cell.textLabel.frame = CGRectMake(40, 40, 20, 50);
    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    _cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _cell.textLabel.numberOfLines = 0;
    _cell.detailTextLabel.numberOfLines = 0;
    
    return _cell;
    
}


@end
