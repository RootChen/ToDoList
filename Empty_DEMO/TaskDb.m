//
//  TaskDb.m
//  Empty_DEMO
//
//  Created by 陈根 on 10/17/15.
//  Copyright © 2015 陈根. All rights reserved.
//

#import "TaskDb.h"
#import "Task.h"

static TaskDb *instnce;

@implementation TaskDb

+ (id)shareInstance {
    if (instnce == nil) {
        instnce = [[[self class] alloc] init];
    }
    return instnce;
}

- (void)createTable {
    NSString *sql = @"CREATE TABLE IF NOT EXISTS Task (content TEXT,isMark TEXT,date TEXT primary key);";
    [self createTable:sql];
}

- (BOOL)addTask:(Task *)task {
    NSString *sql = @"INSERT INTO Task (content,isMark,date) VALUES (?,?,?)";
    
    NSArray *params = [NSArray arrayWithObjects:task.content,
                       [NSString stringWithFormat: @"%d",task.isMark],
                       [NSString stringWithFormat:@"%@", task.date], nil];
    
    return [self dealData:sql paramsarray:params];
}

- (NSMutableArray *)findTasks {
    NSString *sql = @"SELECT content,isMark,date FROM Task";
    NSMutableArray *data = [self selectData:sql columns:3];


    
    NSMutableArray *tasks = [NSMutableArray array];
    
    for (NSArray *row in data) {
        NSString *content = [row objectAtIndex:0];
        bool isMark = [[row objectAtIndex:1] isEqualToString:@"0"]?NO:YES;;
        NSString *date = [row objectAtIndex:2];
        
        Task *task = [[Task alloc] init];
        task.content = content;
        task.isMark = isMark;
        task.date = date;
        [tasks addObject:task];
        
    }
    
    return tasks;
}

- (BOOL)deleteTask:(Task *)task {
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM Task WHERE date = '%@'", [NSString stringWithFormat:@"%@", task.date]];
    
    NSArray *params = [NSArray arrayWithObjects:task.content,
                       [NSString stringWithFormat: @"%d",task.isMark],
                       [NSString stringWithFormat:@"%@", task.date], nil];
    
    return [self dealData:sql paramsarray:params];
}

- (BOOL)updateTask:(Task *)task {
    
    NSString *sql = [NSString stringWithFormat:@"UPDATE Task SET isMark = '%@' WHERE date = '%@' ",[NSString stringWithFormat: @"%d",task.isMark], [NSString stringWithFormat:@"%@", task.date]];
    NSArray *params = [NSArray arrayWithObjects:task.content,
                       [NSString stringWithFormat: @"%d",task.isMark],
                       [NSString stringWithFormat:@"%@", task.date], nil];
    
    return [self dealData:sql paramsarray:params];
}
@end
