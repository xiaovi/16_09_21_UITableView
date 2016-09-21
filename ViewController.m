//
//  ViewController.m
//  16_09_21_UITableView
//
//  Created by 姚懿恒 on 16/9/21.
//  Copyright © 2016年 姚懿恒. All rights reserved.
//

#import "ViewController.h"

//将字典的key抽出为宏
#define kHeader @"header"   //头部标题的key
#define kFooter @"footer"   //尾部标题的key
#define kContent @"content" //显示内容的key

@interface ViewController ()<UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *allList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:[self loadTableView]];
    _allList = @[
                 @{
                     kHeader : @"动物",
                     kFooter : @"这里有一些动物",
                     kContent: @[@"🐻", @"🐈", @"🐩", @"🐱"]
                  },
                 @{
                     kHeader : @"电子用品",
                     kFooter : @"这里有一副耳机跟手机",
                     kContent: @[@"🎧", @"📱"]
                     },

                 @{
                     kHeader : @"乐器",
                     kFooter : @"这里有一些乐器",
                     kContent: @[@"🎻", @"🎸", @"🎹"]
                     },
                 @{
                     kHeader : @"其他",
                     kFooter : @"这是一个原子= =",
                     kContent: @[@"⚛"]
                     },
                 @{
                     kHeader : @"植物",
                     kFooter : @"这里有一些植物",
                     kContent: @[@"🌷", @"🍀", @"🍌", @"🌲"]
                     }
                 ];


}
-(UITableView *)loadTableView{
    if (!_tableView) {
        //初始化UITableView, 设置style为UITableViewStyleGrouped.
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds
                                                  style:UITableViewStyleGrouped];
        //将UITableView的数据源设置为控制器本身.
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma mark 以下为数据源方法


#pragma mark 一共有多少组数据
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _allList.count;
}

#pragma mark 每组数据中有多少行数据
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //1.取出数组中,所对应的项目的字典
    NSDictionary *list = _allList[section];

    //2.取出对应key中,content的个数

    NSArray *items = list[kContent];


    //返回第section组所在的数组所包含的个数
    return items.count;
}

#pragma mark 每一行具体有什么数据
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    //创建一个cell
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];

    //1.取出数组中,所对应的项目的字典
    NSDictionary *items = _allList[indexPath.section];

    //2.取出对应key中的内容
    NSArray *item = items[kContent];
    cell.textLabel.text = item[indexPath.row];

    return cell;
}

#pragma mark 第section组需要显示的头部标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    return _allList[section][kHeader];

}

#pragma mark 第section组需要显示的尾部标题
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{

    return _allList[section][kFooter];

}

@end
