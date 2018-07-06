//
//  CommentTableViewCell.m
//  CellAutomaticHeight
//
//  Created by lc on 2018/7/4.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "CommentTableViewCell.h"
#import "Masonry.h"

@implementation CommentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self configureView];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configureView];
    }
    return self;
}

- (void)configureView {
    CGFloat avatarButtonWidth = 32.0;
    
    self.avatarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.avatarButton.layer.cornerRadius = avatarButtonWidth / 2.0;
    self.avatarButton.clipsToBounds = YES;
    [self.avatarButton setImage:[UIImage imageNamed:@"Avatar.jpg"] forState:UIControlStateNormal];
    [self.contentView addSubview:self.avatarButton];
    
    [self.avatarButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *view = [[UIView alloc] init];
    
    self.nicknameLabel = [[UILabel alloc] init];
    self.nicknameLabel.font = [UIFont systemFontOfSize:13.0];
    self.nicknameLabel.textColor = [UIColor blackColor];
    self.nicknameLabel.text = @"昵称";
    [view addSubview:self.nicknameLabel];
    
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.font = [UIFont systemFontOfSize:12.0];
    self.timeLabel.textColor = [UIColor grayColor];
    self.timeLabel.text = @"4-27";
    [view addSubview:self.timeLabel];
    
    [self.contentView addSubview:view];
    
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.font = [UIFont systemFontOfSize:15.0];
    self.contentLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:self.contentLabel];
    
    [self.avatarButton mas_makeConstraints:^(MASConstraintMaker *make) {
        // 步骤3：设置头像的约束，最重要的思想是：给头像的top与contentView.mas_top之间建立约束
        make.top.equalTo(self.contentView.mas_top).offset(27.0);
        // 设置size与leading（left）的约束，不解释
        make.size.mas_equalTo(CGSizeMake(avatarButtonWidth, avatarButtonWidth));
        make.leading.equalTo(self.contentView.mas_leading).offset(20.0);
    }];
    
    // nicknameLabel与timeLabel也是使用了自动撑开的思想
    [self.nicknameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.top.equalTo(view);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.nicknameLabel.mas_leading);
        make.top.equalTo(self.nicknameLabel.mas_bottom).offset(3.0);
        make.bottom.equalTo(view.mas_bottom);
    }];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.avatarButton.mas_trailing).offset(10.0);
        make.trailing.lessThanOrEqualTo(self.contentView.mas_trailing).offset(-10.0);
        make.centerY.equalTo(self.avatarButton.mas_centerY);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        // 步骤4:设置评论的top与头像的bottom之间的约束
        make.top.equalTo(self.avatarButton.mas_bottom).offset(15.0);
        // 步骤5：设置评论的bottom与contentView.mas_bottom之间的约束
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-25.0);
        make.leading.equalTo(self.avatarButton.mas_leading);
        make.trailing.equalTo(self.contentView.mas_trailing).offset(-20.0);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)buttonClicked:(id)sender {
    NSLog(@"sssss");
}

@end
