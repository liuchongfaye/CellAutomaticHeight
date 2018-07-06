//
//  CommentTableViewCell.h
//  CellAutomaticHeight
//
//  Created by lc on 2018/7/4.
//  Copyright © 2018年 lc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentTableViewCell : UITableViewCell

@property (nonatomic, strong) UIButton *avatarButton;
@property (nonatomic, strong) UILabel *nicknameLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *contentLabel;

@end
