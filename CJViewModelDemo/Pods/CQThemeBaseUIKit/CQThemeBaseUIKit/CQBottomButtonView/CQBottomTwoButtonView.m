//
//  CQBottomTwoButtonView.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2020/5/15.
//  Copyright © 2020 dvlproad. All rights reserved.
//

#import "CQBottomTwoButtonView.h"
#import "CJThemeButtonFactory.h"
#import <CJBaseUIKit/UIButton+CJMoreProperty.h>

@interface CQBottomTwoButtonView () {
    
}
@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;

@end

@implementation CQBottomTwoButtonView

#pragma mark - Init
- (instancetype)initWithTitle1:(NSString *)title1
                        title1:(NSString *)title2
                  actionBlock1:(void(^)(UIButton *bButton))actionBlock1
                  actionBlock2:(void(^)(UIButton *bButton))actionBlock2
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        [self.button1 setTitle:title1 forState:UIControlStateNormal];
        [self.button1 setCjTouchUpInsideBlock:actionBlock1];
        
        [self.button2 setTitle:title2 forState:UIControlStateNormal];
        [self.button2 setCjTouchUpInsideBlock:actionBlock2];
    }
    return self;
}

/// 子类重写此方法
- (UIView *)renderBottomContentView {
    UIView *buttonsView = [[UIView alloc] init];
    
    UIButton *button1 = [CJThemeButtonFactory themeBorderButton];
    [buttonsView addSubview:button1];
    self.button1 = button1;
    
    UIButton *button2 = [CJThemeButtonFactory themeBGButton];
    [buttonsView addSubview:button2];
    self.button2 = button2;
    
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(buttonsView).mas_offset(15);
        make.top.bottom.mas_equalTo(buttonsView);
    }];
    
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(button1.mas_right).mas_offset(20);
        make.right.mas_equalTo(buttonsView).mas_offset(-15);
        make.width.mas_equalTo(button1.mas_width).multipliedBy(224/105);
        make.top.bottom.mas_equalTo(buttonsView);
    }];
    
    return buttonsView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
