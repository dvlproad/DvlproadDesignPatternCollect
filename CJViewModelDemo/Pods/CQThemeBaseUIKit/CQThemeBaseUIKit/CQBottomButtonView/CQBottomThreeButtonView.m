//
//  CQBottomThreeButtonView.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2020/5/15.
//  Copyright © 2020 dvlproad. All rights reserved.
//

#import "CQBottomThreeButtonView.h"
#import "CJThemeButtonFactory.h"
#import <CJBaseUIKit/UIButton+CJMoreProperty.h>

@interface CQBottomThreeButtonView () {
    
}
@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;
@property (nonatomic, strong) UIButton *button3;

@end

@implementation CQBottomThreeButtonView

#pragma mark - Init
- (instancetype)initWithTitle1:(NSString *)title1
                        title2:(NSString *)title2
                        title3:(NSString *)title3
                  actionBlock1:(void(^)(UIButton *bButton))actionBlock1
                  actionBlock2:(void(^)(UIButton *bButton))actionBlock2
                  actionBlock3:(void(^)(UIButton *bButton))actionBlock3;
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        [self.button1 setTitle:title1 forState:UIControlStateNormal];
        [self.button1 setCjTouchUpInsideBlock:actionBlock1];
        
        [self.button2 setTitle:title2 forState:UIControlStateNormal];
        [self.button2 setCjTouchUpInsideBlock:actionBlock2];
        
        [self.button3 setTitle:title3 forState:UIControlStateNormal];
        [self.button3 setCjTouchUpInsideBlock:actionBlock3];
    }
    return self;
}

/// 子类重写此方法
- (UIView *)renderBottomContentView {
    UIView *buttonsView = [[UIView alloc] init];
    
    UIButton *button1 = [CJThemeButtonFactory themeBorderButton];
    [buttonsView addSubview:button1];
    self.button1 = button1;
    
    UIButton *button2 = [CJThemeButtonFactory themeBorderButton];
    [buttonsView addSubview:button2];
    self.button2 = button2;
    
    UIButton *button3 = [CJThemeButtonFactory themeBGButton];
    [buttonsView addSubview:button3];
    self.button3 = button3;
    
    NSArray<UIButton *> *bottomButtons = @[button1, button2, button3];
    [bottomButtons mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(buttonsView);
    }];
    [bottomButtons mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:20 leadSpacing:15 tailSpacing:15];
    
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
