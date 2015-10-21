//
//  TaskCell.m
//  Empty_DEMO
//
//  Created by 陈根 on 15/7/8.
//  Copyright (c) 2015年 陈根. All rights reserved.
//

#import "TaskCell.h"

@implementation TaskCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _markButton = [UIButton buttonWithType:
                       UIButtonTypeCustom];
        _markButton.frame = CGRectMake(270, 0, 50, 50);
        [_markButton setImage:[UIImage imageNamed:@"checkbox_priority"] forState:UIControlStateNormal];
        [_markButton setImage:[UIImage imageNamed:@"checkbox_checked"] forState:UIControlStateSelected];
        [_markButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_markButton];
        
        _date = [[UILabel alloc] initWithFrame:CGRectMake(250, 40, 70, 20)];
        [self addSubview:_date];

    }
    
    return self;
}

- (void)click:(id)sender {
    if (_buttonClick) {
        _buttonClick();
    }
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
