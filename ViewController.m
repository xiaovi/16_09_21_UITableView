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
@property (nonatomic, strong) NSArray *list1;
@property (nonatomic, strong) NSArray *list2;
@property (nonatomic, strong) NSArray *list3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:[self loadTableView]];
    _list1 = @[@"熊猫", @"黑猩猩", @"长颈鹿"];
    _list2 = @[@"郁金香", @"猫薄荷", @"三叶草", @"香蕉"];
    _list3 = @[@"🎧", @"📱", @"🍫", @"🌲"];

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
    return 3;
}

#pragma mark 每组数据中有多少行数据
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return  _list1.count;
    }else if(section == 1)
    {
        return _list2.count;
    }else{
        return  _list3.count;
    }
}

#pragma mark 每一行具体有什么数据
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    NSString *text = nil;
    if (indexPath.section == 0) {
        text = _list1[indexPath.row];

    }else if(indexPath.section == 1){

        text = _list2[indexPath.row];
    }
    else{
        text = _list3[indexPath.row];
    }

    cell.textLabel.text = text;

    return cell;
}


@end
