//
//  InputTask.h
//  Empty_DEMO
//
//  Created by 陈根 on 15/7/8.
//  Copyright (c) 2015年 陈根. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InputTask : UIView<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *inputText;
@property (nonatomic, strong) UIButton    *button;
@property (nonatomic, strong) UIButton    *webBtn;
@end
