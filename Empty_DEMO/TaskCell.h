//
//  TaskCell.h
//  Empty_DEMO
//
//  Created by 陈根 on 15/7/8.
//  Copyright (c) 2015年 陈根. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskCell : UITableViewCell
@property (nonatomic, strong) UIButton *markButton;
@property (nonatomic, strong) UILabel *date;
@property (nonatomic, copy) void (^buttonClick)();
@end
