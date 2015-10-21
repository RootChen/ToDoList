//
//  AppDelegate.m
//  Empty_DEMO
//
//  Created by 陈根 on 15-6-17.
//  Copyright (c) 2015年 ___FULLUSERNAME___. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor blueColor];
    [self.window makeKeyAndVisible];
//    UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(60, 30, 200, 35)];
//    tf.tag = 101;
//    tf.delegate = self; // 设置代理
//    tf.textColor = [UIColor redColor];
//    tf.placeholder = @"input";
//    tf.adjustsFontSizeToFitWidth = YES;
//    tf.clearsOnBeginEditing = YES;
//    tf.clearButtonMode = UITextFieldViewModeWhileEditing;
//    //    tf.background = [UIImage imageNamed:@"navigation"];
//    tf.borderStyle = UITextBorderStyleRoundedRect;
//    [self.window addSubview:tf];
    
    RootViewController *rootview = [[RootViewController alloc] init];
//    UINavigationController *navgation = [[UINavigationController alloc] initWithRootViewController:rootview];
    self.window.rootViewController = rootview;
    
    return YES;
}
//- (void)test
//{
//    UITextField *tf = (UITextField *)[self.window viewWithTag:101];
//    // 将键盘移除
//    [tf resignFirstResponder];
//}
//
//#pragma mark - TextField Delegate
//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
//{
//    NSLog(@"textFieldShouldBeginEditing");
//    return YES; // [textField becomeFirstResponder];
//}
//
//- (void)textFieldDidBeginEditing:(UITextField *)textField
//{
//    NSLog(@"textFieldDidBeginEditing");
//}
//
//- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
//{
//    NSLog(@"textFieldShouldEndEditing");
//    return YES; // [tf resignFirstResponder];
//}
//
//- (void)textFieldDidEndEditing:(UITextField *)textField
//{
//    NSLog(@"textFieldDidEndEditing : %@", textField.text);
//}
//
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    NSLog(@"shouldChangeCharactersInRange : %@", string);
//    return YES;
//}
//
//- (BOOL)textFieldShouldClear:(UITextField *)textField
//{
//    NSLog(@"textFieldShouldClear");
//    return YES;
//}
//
//- (BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    [textField resignFirstResponder];
//    return YES;
//}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
