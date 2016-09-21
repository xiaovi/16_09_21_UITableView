//
//  ViewController.m
//  16_09_21_UITableView
//
//  Created by 姚懿恒 on 16/9/21.
//  Copyright © 2016年 姚懿恒. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *allList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:[self loadTableView]];
    _allList = @[@[@"🐻", @"🐈", @"🐩", @"🐱"],
                 @[@"🌷", @"🍀", @"🍌", @"🌲"],
                 @[@"🎧", @"📱", @"🍫"],
                 @[@"🎻", @"🎸", @"🎹"],
                 @[@"⚛"]
                 ];


}
-(UITableView *)loadTableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds
                                                  style:UITableViewStyleGrouped];
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
    return [_allList[section] count];
}

#pragma mark 每一行具体有什么数据
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];

    cell.textLabel.text = _allList[indexPath.section][indexPath.row];

    return cell;
}


@end
