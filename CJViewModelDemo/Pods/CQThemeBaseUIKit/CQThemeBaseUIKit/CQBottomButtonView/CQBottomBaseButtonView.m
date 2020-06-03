//
//  CQBottomBaseButtonView.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2020/5/15.
//  Copyright © 2020 dvlproad. All rights reserved.
//

#import "CQBottomBaseButtonView.h"
#import <Masonry/Masonry.h>

@implementation CQBottomBaseButtonView

#pragma mark - Init
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        CGFloat screenBottomHeight = [CQBottomBaseButtonView screenBottomHeight];
        
        UIView *bottomContentView = [self renderBottomContentView];
        [self addSubview:bottomContentView];
        [bottomContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self);
            make.top.mas_equalTo(self).mas_offset(8);
            make.bottom.mas_equalTo(-screenBottomHeight);
        }];
        
        _extraHeight = screenBottomHeight + 8;
    }
    return self;
}

/// 子类重写此方法
- (UIView *)renderBottomContentView {
    UIView *buttonsView = [[UIView alloc] init];
    return buttonsView;
}


#pragma mark - Private Method
/// 屏幕高度
+ (CGFloat)screenHeight {
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    return screenHeight;
}

/// 是否是全面屏
+ (BOOL)isScreenFull {
    CGFloat screenHeight = [self screenHeight];
    BOOL isScreenFull = screenHeight >= 812 && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone;
    return isScreenFull;
}

/// 屏幕底部高度
+ (CGFloat)screenBottomHeight {
    BOOL isScreenFull = [self isScreenFull];
    CGFloat screenBottomHeight = isScreenFull ?  34.0 : 0.0;
    return screenBottomHeight;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
