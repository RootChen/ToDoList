//
//  RootViewController.h
//  Empty_DEMO
//
//  Created by 陈根 on 15/7/4.
//  Copyright (c) 2015年 陈根. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)NSMutableArray *data;
@end
