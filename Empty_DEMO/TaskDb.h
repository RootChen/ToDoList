//
//  TaskDb.h
//  Empty_DEMO
//
//  Created by 陈根 on 10/17/15.
//  Copyright © 2015 陈根. All rights reserved.
//

#import "BaseDB.h"
#import "Task.h"

@interface TaskDb : BaseDB

+ (id)shareInstance;

//创建任务表
- (void)createTable;

//添加任务
- (BOOL)addTask:(Task *)task;

- (NSArray *)findTasks;

- (BOOL)deleteTask:(Task *)task;

- (BOOL)updateTask:(Task *)task;
@end
