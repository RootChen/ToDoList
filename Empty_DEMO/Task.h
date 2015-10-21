//
//  Task.h
//  Empty_DEMO
//
//  Created by 陈根 on 15/7/8.
//  Copyright (c) 2015年 陈根. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) BOOL isMark;
@property (nonatomic, strong) NSString *date;
@end
