//
//  DRNRoomStatusTitleView.m
//  DonggukLibrary
//
//  Created by 1001246 on 2015. 6. 7..
//  Copyright (c) 2015년 USAIU. All rights reserved.
//

#import "DRNRoomStatusTitleView.h"

// Utility
#import "UIColor+DRNExtension.h"

// Library
#import <Masonry/Masonry.h>

@implementation DRNRoomStatusTitleView

- (instancetype)init
{
    return [self initWithTitle:@""];
}

- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        _title = title;
        _containerView = [[UIView alloc] init];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = _title;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor drn_darkGrayColor];
        
        _closeButton = [[UIButton alloc] init];
        [_closeButton setTitle:@"Close" forState:UIControlStateNormal];
        
        _separator = [[UIView alloc] init];
        _separator.backgroundColor = [UIColor lightGrayColor];
        
        [_containerView addSubview:_titleLabel];
        [_containerView addSubview:_closeButton];
        [_containerView addSubview:_separator];
        [self addSubview:_containerView];
        
        [self makeAutoLayoutConstraints];
    }
    return self;
}

#pragma mark - Layout

- (void)makeAutoLayoutConstraints
{
    [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.and.bottom.equalTo(@.0f);
        make.height.equalTo(@(DRNRoomStatusTitleContainerHeight));
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_containerView);
    }];
    
    [_separator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.and.bottom.equalTo(@.0f);
        make.height.equalTo(@.5f);
    }];
}

#pragma mark - Setter

- (void)setTitle:(NSString *)title
{
    _title = title;
    _titleLabel.text = _title;
}

@end