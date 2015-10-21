//
//  Task.m
//  Empty_DEMO
//
//  Created by 陈根 on 15/7/8.
//  Copyright (c) 2015年 陈根. All rights reserved.
//

#import "Task.h"

@implementation Task
- (id)init
{
    self = [super init];
    
    if (self) {
        NSDate *today = [NSDate date];
        NSDateFormatter *formate = [[NSDateFormatter alloc]init];
        [formate setDateFormat:@"hh:mm:ss"];
//        [formate setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
        _date = [formate stringFromDate:today];
    }
    
    return self;
}
@end
