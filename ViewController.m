//
//  ViewController.m
//  16_09_21_UITableView
//
//  Created by 姚懿恒 on 16/9/21.
//  Copyright © 2016年 姚懿恒. All rights reserved.
//

#import "ViewController.h"
#import "ObjectInRoom.h"

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

    ObjectInRoom *animals = [[ObjectInRoom alloc] init];
    animals.header = @"动物";
    animals.footer = @"这里有一些动物";
    animals.content = @[@"🐻", @"🐈", @"🐩", @"🐱"];

    ObjectInRoom *instruments = [[ObjectInRoom alloc] init];
    instruments.header = @"乐器";
    instruments.footer = @"这里有一些乐器";
    instruments.content = @[@"🎻", @"🎸", @"🎹"];

    ObjectInRoom *elctric = [[ObjectInRoom alloc] init];
    elctric.header = @"电子用品";
    elctric.footer = @"这里有一副耳机跟手机";
    elctric.content = @[@"🎧", @"📱"];

    ObjectInRoom *plants = [[ObjectInRoom alloc] init];
    plants.header = @"植物";
    plants.footer = @"这里有一些植物";
    plants.content = @[@"🌷", @"🍀", @"🍌", @"🌲"];

    _allList = @[animals, instruments, elctric, plants];


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
    //1.取出数组中所对应的section的物品
    ObjectInRoom *items = _allList[section];


    //返回第section组所在的数组(content)所包含的个数
    return items.content.count;
}

#pragma mark 每一行具体有什么数据
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    //创建一个cell
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];

    //1.取出数组中,所对应的项目的字典
    ObjectInRoom *items = _allList[indexPath.section];

    //2.取出对应content中的内容
    NSArray *item = items.content;
    cell.textLabel.text = item[indexPath.row];

    return cell;
}

#pragma mark 第section组需要显示的头部标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    return [_allList[section] header];

}

#pragma mark 第section组需要显示的尾部标题
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{

    return [_allList[section] footer];

}

@end
