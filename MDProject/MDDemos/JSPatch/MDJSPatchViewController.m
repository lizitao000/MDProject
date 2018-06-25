//
//  MDJSPatchViewController.m
//  MDProject
//
//  Created by lizitao on 2018/6/22.
//  Copyright © 2018年 lizitao. All rights reserved.
//

#import "MDJSPatchViewController.h"
#import "MDRuntimeViewController.h"

@interface MDJSPatchViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray <NSString *> *titleArr;

@end

@implementation MDJSPatchViewController

- (instancetype)initWithContent:(NSString *)string
{
    if (self = [super init]) {
        self.title = string;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView = [[UITableView  alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
    [self loadTitleArray];
    [self.tableView reloadData];
    self.title =@"hello world";
    NSLog(@"%@",@([self divideUsingDenominator:1.0]));
    NSLog(@"%@",@([self divideUsingDenominator1:1.0]));
    
}

- (float)divideUsingDenominator:(NSInteger)denominator
{
    NSLog(@"----->%@",@(denominator));
    return 1.f/denominator;
}

- (float)divideUsingDenominator1:(NSInteger)denominator
{
    NSLog(@"----->123%@",@(denominator));
    return 1.f/denominator;
}

- (void)loadTitleArray
{
    self.titleArr = [NSMutableArray new];
    NSArray *array = @[
                       @"JSPatch",                          //15
                       @"Cache",                            //14
                       @"ReactivePage_3",                   //13
                       @"ReactivePage_2",                   //12
                       @"ReactivePage",                     //11
                       @"Invoker",                          //10
                       @"Runtime2",                         //9
                       @"Runtime1",                         //8
                       @"Core Image/人脸识别",                //7
                       @"Core Image/滤镜",                   //6
                       @"Quartz 2D绘图",                     //5
                       @"多线程",                            //4
                       @"Json动态化",                        //3
                       @"DrawImage",                        //2
                       @"模块化实例",                         //1
                       @"RAC开发",                           //0
                       ];
    [self.titleArr addObjectsFromArray:array];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *contentCell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (!contentCell) {
        contentCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    contentCell.backgroundColor = [UIColor lightGrayColor];
    contentCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    contentCell.textLabel.text = [self.titleArr objectAtIndex:indexPath.row];
    return contentCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //会超出数组范围导致crash
    NSString *content = self.titleArr[[indexPath row] + 1];
    NSLog(@"执行了....%@",content);
    [self jump];
}

- (void)jump
{
    [self.navigationController pushViewController:[MDJSPatchViewController new] animated:YES];
}

@end