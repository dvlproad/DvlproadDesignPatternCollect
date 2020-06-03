//
//  CQBottomOneButtonView.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2020/5/15.
//  Copyright © 2020 dvlproad. All rights reserved.
//

#import "CQBottomOneButtonView.h"
#import "CJThemeButtonFactory.h"
#import <CJBaseUIKit/UIButton+CJMoreProperty.h>

@interface CQBottomOneButtonView () {
    
}
@property (nonatomic, strong) UIButton *button1;

@end

@implementation CQBottomOneButtonView

#pragma mark - Init
- (instancetype)initWithTitle:(NSString *)title
                  actionBlock:(void(^)(UIButton *bButton))actionBlock
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        [self.button1 setTitle:title forState:UIControlStateNormal];
        [self.button1 setCjTouchUpInsideBlock:actionBlock];
    }
    return self;
}

/// 子类重写此方法
- (UIView *)renderBottomContentView {
    UIView *buttonsView = [[UIView alloc] init];
    
    UIButton *button1 = [CJThemeButtonFactory themeBGButton];
    [buttonsView addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(buttonsView).mas_offset(15);
        make.centerX.mas_equalTo(buttonsView);
        make.top.bottom.mas_equalTo(buttonsView);
    }];
    self.button1 = button1;
    
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
