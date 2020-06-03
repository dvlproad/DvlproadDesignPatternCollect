//
//  CQBottomPlayButtonView.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2020/5/15.
//  Copyright © 2020 dvlproad. All rights reserved.
//

#import "CQBottomPlayButtonView.h"
#import "CJThemeButtonFactory.h"
#import <CJBaseUIKit/UIButton+CJMoreProperty.h>

@interface CQBottomPlayButtonView () {
    
}
@property (nonatomic, strong) UIButton *lastButton;         /**< 上一个 */
@property (nonatomic, strong) UIButton *nextButton;         /**< 下一个 */
@property (nonatomic, strong) CJButton *playExamButton;     /**< 开始或继续考试的按钮 */
@property (nonatomic, strong) UIButton *resetButton;        /**< 重置（一旦开始就有重置按钮,一旦点击重置则隐藏） */

//@property (nonatomic, strong) UIView *progressContentView;  /**< 进度视图 */

@end

@implementation CQBottomPlayButtonView

#pragma mark - Init
- (instancetype)initWithLastActionBlock:(void(^)(CQBottomPlayButtonView *bPlayView, UIButton *bButton))lastActionBlock
                        nextActionBlock:(void(^)(CQBottomPlayButtonView *bPlayView, UIButton *bButton))nextActionBlock
                    playExamActionBlock:(void(^)(CQBottomPlayButtonView *bPlayView, UIButton *bButton))playExamActionBlock
                       resetActionBlock:(void(^)(CQBottomPlayButtonView *bPlayView, UIButton *bButton))resetActionBlock
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        [self.lastButton setCjTouchUpInsideBlock:^(UIButton *button) {
            if (lastActionBlock) {
                lastActionBlock(self, button);
            }
        }];
        [self.nextButton setCjTouchUpInsideBlock:^(UIButton *button) {
            if (nextActionBlock) {
                nextActionBlock(self, button);
            }
        }];
        [self.playExamButton setCjTouchUpInsideBlock:^(UIButton *button) {
            if (playExamActionBlock) {
                playExamActionBlock(self, button);
            }
        }];
        [self.resetButton setCjTouchUpInsideBlock:^(UIButton *button) {
            if (resetActionBlock) {
                resetActionBlock(self, button);
            }
        }];
    }
    return self;
}
//- (instancetype)initWithLeftTitle:(NSString *)leftTitle
//                        rightTitle:(NSString *)rightTitle
//                        topTitle:(NSString *)topTitle
//                      bottomTitle:(NSString *)bottomTitle
//                  leftActionBlock:(void(^)(UIButton *bButton))leftActionBlock
//                  rightActionBlock:(void(^)(UIButton *bButton))rightActionBlock
//                  topActionBlock:(void(^)(UIButton *bButton))topActionBlock
//              bottomActionBlock:(void(^)(UIButton *bButton))bottomActionBlock
//{
//    self = [super initWithFrame:CGRectZero];
//    if (self) {
//        [self.lastButton setTitle:leftTitle forState:UIControlStateNormal];
//        [self.lastButton setCjTouchUpInsideBlock:leftActionBlock];
//
//        [self.nextButton setTitle:rightTitle forState:UIControlStateNormal];
//        [self.nextButton setCjTouchUpInsideBlock:rightActionBlock];
//
//        [self.playExamButton setTitle:topTitle forState:UIControlStateNormal];
//        [self.playExamButton setCjTouchUpInsideBlock:topActionBlock];
//
//        [self.resetButton setTitle:bottomTitle forState:UIControlStateNormal];
//        [self.resetButton setCjTouchUpInsideBlock:bottomActionBlock];
//    }
//    return self;
//}

/// 子类重写此方法
- (UIView *)renderBottomContentView {
    UIView *bottomContentView = [[UIView alloc] init];
    
    /* progressView */
    UIView *progressContentView = [self progressContentView];
    [bottomContentView addSubview:progressContentView];
    [progressContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(bottomContentView);
        make.bottom.mas_equalTo(bottomContentView);
        make.height.mas_equalTo(44);
    }];
    
    
    /* buttonsView */
    UIView *buttonsView = [self buttonsView];
    [bottomContentView addSubview:buttonsView];
    [buttonsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(bottomContentView);
        make.bottom.mas_equalTo(progressContentView.mas_top);
        make.top.mas_equalTo(bottomContentView);
    }];
    
    return bottomContentView;
}

/// 按钮视图
- (UIView *)buttonsView {
    UIView *buttonsView = [[UIView alloc] init];
    
    CJButton *playExamButton = [CJThemeButtonFactory themeNormalSelectedButtonWithNormalTitle:@"开始测试" selectedTitle:@"暂停测试"];
    [buttonsView addSubview:playExamButton];
    self.playExamButton = playExamButton;
    
    UIButton *resetButton = [CJThemeButtonFactory themeBorderButton];
    [resetButton setTitle:@"重置" forState:UIControlStateNormal];
    [buttonsView addSubview:resetButton];
    self.resetButton = resetButton;
    
    
    NSArray<UIButton *> *verticalButtons = @[playExamButton, resetButton];
    [verticalButtons mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(buttonsView);
        make.width.mas_equalTo(120);
    }];
    [verticalButtons mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:20 leadSpacing:15 tailSpacing:15];
    
    

    
    UIButton *lastButton = [CJThemeButtonFactory themeBorderButton];
    [lastButton setTitle:@"上一张" forState:UIControlStateNormal];
    [buttonsView addSubview:lastButton];
    [lastButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(playExamButton.mas_left).mas_offset(-15);
        make.width.mas_equalTo(120);
        make.centerY.mas_equalTo(buttonsView);
        make.height.mas_equalTo(playExamButton);
    }];
    self.lastButton = lastButton;


    UIButton *nextButton = [CJThemeButtonFactory themeBorderButton];
    [nextButton setTitle:@"下一张" forState:UIControlStateNormal];
    [buttonsView addSubview:nextButton];
    [nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(playExamButton.mas_right).mas_offset(15);
        make.width.mas_equalTo(lastButton);
        make.centerY.mas_equalTo(lastButton);
        make.height.mas_equalTo(lastButton);
    }];
    self.nextButton = nextButton;
    
    
    return buttonsView;
}

/// 进度视图
- (UIView *)progressContentView {
    UIView *progressContentView = [[UIView alloc] init];
    
    UILabel *leftLabel = [[UILabel alloc] init];
    leftLabel.textAlignment = NSTextAlignmentLeft;
    leftLabel.font = [UIFont systemFontOfSize:17.0];
    leftLabel.textColor = [UIColor redColor];
    leftLabel.text = @"本次已用时:100s";
    [progressContentView addSubview:leftLabel];
    self.leftLabel = leftLabel;
    
    UILabel *rightLabel = [[UILabel alloc] init];
    rightLabel.textAlignment = NSTextAlignmentRight;
    rightLabel.font = [UIFont systemFontOfSize:17.0];
    rightLabel.textColor = [UIColor redColor];
    rightLabel.text = @"当前进度:1/110";
    [progressContentView addSubview:rightLabel];
    self.rightLabel = rightLabel;
    
    [leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(progressContentView).mas_offset(15);
        make.top.bottom.mas_equalTo(progressContentView);
    }];
    
    [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftLabel.mas_right).mas_offset(20);
        make.right.mas_equalTo(progressContentView).mas_offset(-15);
        make.width.mas_equalTo(leftLabel.mas_width).multipliedBy(1/1);
        make.top.bottom.mas_equalTo(progressContentView);
    }];
    
    return progressContentView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
