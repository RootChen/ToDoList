//
//  InputTask.m
//  Empty_DEMO
//
//  Created by 陈根 on 15/7/8.
//  Copyright (c) 2015年 陈根. All rights reserved.
//

#import "RootViewController.h"
#import "InputTask.h"
#import "UIColor+expanded.h"

@implementation InputTask
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:(CGRect)frame];
    if (self) {
        _inputText = [[UITextField alloc] initWithFrame:CGRectMake(60, 30, 200, 35)];
        _inputText.delegate = self; // 设置代理
        _inputText.textColor = [UIColor greenColor];
        _inputText.placeholder = @"input";
        _inputText.adjustsFontSizeToFitWidth = YES;
        _inputText.clearsOnBeginEditing = YES;
        _inputText.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        _inputText.borderStyle = UITextBorderStyleRoundedRect;
        self.userInteractionEnabled = YES;
//        [_inputText.window makeKeyAndVisible];
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(265, 30, 50, 35);
        [_button setBackgroundColor:[UIColor greenColor]];
//        [_button addTarget:self action:@selector() forControlEvents:UIControlEventTouchUpInside];
        [_button setTitle:@"Go!" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor colorWithHexString:@"dc143c"] forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor colorWithHexString:@"006400"] forState:UIControlStateHighlighted];
       
//        [_button setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlEventTouchUpInside];
        
//        CGSize imageSize = CGSizeMake(_button.frame.size.width, _button.frame.size.height);
//        UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
//        [[UIColor colorWithHexString:@"afeeee"]set];
//        UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
//        UIImage *pressedColorImg = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        
//        [_button setBackgroundImage:pressedColorImg forState:UIControlStateNormal];
//        
//        CGSize imageSize_select = CGSizeMake(_button.frame.size.width, _button.frame.size.height);
//        UIGraphicsBeginImageContextWithOptions(imageSize_select, 0, [UIScreen mainScreen].scale);
//        [[UIColor colorWithHexString:@"ffc0cb"]set];
//        UIRectFill(CGRectMake(0,0, imageSize_select.width, imageSize_select.height));
//        UIImage *selectImg = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        
//        [_button setBackgroundImage:selectImg forState:UIControlStateHighlighted];
        
        [_button sizeToFit];
        [self addSubview:_inputText];
        [self addSubview:_button];
        
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - textField Delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"textFieldShouldBeginEditing");
    [textField.window makeKeyAndVisible];
    return YES; // [textField becomeFirstResponder];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (!textField.window.isKeyWindow)
    {
        [textField.window makeKeyAndVisible];
    }
    NSLog(@"textFieldDidBeginEditing");
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    NSLog(@"textFieldShouldEndEditing");
    return YES; // [tf resignFirstResponder];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"textFieldDidEndEditing : %@", textField.text);
}

- (BOOL)textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string
{
    NSLog(@"shouldChangeCharactersInRange : %@", string);
    NSLog(@"%@", textField.text);
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    NSLog(@"textFieldShouldClear");
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


@end
