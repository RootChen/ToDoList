//
//  RootViewController.m
//  Empty_DEMO
//
//  Created by 陈根 on 15/7/4.
//  Copyright (c) 2015年 陈根. All rights reserved.
//

#import "RootViewController.h"
#import "TaskCell.h"
#import "Task.h"
#import "InputTask.h"
#import "TaskDb.h"
#import "MBProgressHUD.h"
#import "CustomURLCache.h"

@interface RootViewController ()
{
    UITableView *_tableView;
    NSMutableArray *_taskList;
    InputTask *_inputTask;

}
@end

@implementation RootViewController

@synthesize webView = _webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView {
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view = view;
    
    [[TaskDb shareInstance] createTable];
   
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 70, 320, kDeviceHeight-70) style:UITableViewStylePlain];
    
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    
    _tableView.rowHeight = 60;
    
    
    _inputTask = [[InputTask alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 65)];

    [_inputTask.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_inputTask.webBtn addTarget:self action:@selector(buttonWebClk:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_inputTask];
//    [self.view addSubview:_button];
    [self.view addSubview:_tableView];
    
}

- (void)buttonAction:(id)sender {
//    NSLog(@"%@", _tf.text);
    Task *task = [[Task alloc] init];
//    task.date = @"今天";
    
    task.content = _inputTask.inputText.text;
    task.isMark =  NO;
//    task.content = _tf.text;
    [_taskList insertObject:task atIndex:0];
    [[TaskDb shareInstance] addTask:task];
    [self loadData];
    _inputTask.inputText.text = @"";
}

- (void)buttonWebClk:(id)sender {
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    webView.delegate = self;
    self.webView = webView;
    [self.view addSubview:_webView];

    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com/"]]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _taskList = [[NSMutableArray alloc] initWithCapacity:20];
    [self loadData];
}

- (void)loadData {
    self.data = [[TaskDb shareInstance]  findTasks];
    [_tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return [_taskList count];
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentify = @"cell";
    
    TaskCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    
    Task *task = [self.data objectAtIndex:indexPath.row];
    
    if (cell == nil) {
        cell = [[TaskCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
    }
    
    cell.markButton.tag = indexPath.row;
    
    cell.buttonClick = ^() {
        task.isMark = !task.isMark;
        [[TaskDb shareInstance] updateTask:task];
       [_tableView reloadData];
    };
    cell.date.text = task.date;
    cell.markButton.selected = task.isMark;
    cell.textLabel.text = task.content;
    
    return cell;

}

//返回YES，表示支持单元格的移动
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//单元格返回的编辑风格，包括删除 添加 和 默认  和不可编辑三种风格
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        //        获取选中删除行索引值
        NSInteger row = [indexPath row];
        //        通过获取的索引值删除数组中的值
        Task *task = [self.data objectAtIndex:indexPath.row];
        [self.data removeObjectAtIndex:row];
        [[TaskDb shareInstance] deleteTask:task];
        //        删除单元格的某一行时，在用动画效果实现删除过程
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cellView = [tableView cellForRowAtIndexPath:indexPath];
    if (cellView.accessoryType == UITableViewCellAccessoryNone) { 
        Task *task = _taskList[indexPath.row];
        task.isMark = !task.isMark;
        [tableView reloadData];
    }else {
        cellView.accessoryType = UITableViewCellAccessoryNone;
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"Loading...";
}
@end
