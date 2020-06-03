//
//  CJThemeButtonFactory.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2020/1/31.
//  Copyright © 2020 dvlproad. All rights reserved.
//

#import "CJThemeButtonFactory.h"
#import <CJBaseUIKit/UIButton+CJMoreProperty.h>

#import "CJBaseUIKitThemeManager.h"

@implementation CJThemeButtonFactory

/// 以主题色为背景的按钮
+ (UIButton *)themeBGButton {
    UIColor *themeColor = [CJBaseUIKitThemeManager serviceThemeModel].themeColor;
    UIColor *themeDisabledColor = [CJBaseUIKitThemeManager serviceThemeModel].themeDisabledColor;
    UIColor *themeOppositeColor = [CJBaseUIKitThemeManager serviceThemeModel].themeOppositeColor;
    CGFloat buttonCornerRadius = [CJBaseUIKitThemeManager serviceThemeModel].buttonThemeModel.cornerRadius;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = buttonCornerRadius;
    
    [button setTitleColor:themeOppositeColor forState:UIControlStateNormal];
    button.cjNormalBGColor = themeColor;
    button.cjDisabledBGColor = themeDisabledColor;
    
    return button;
}

///以主题色为边框的按钮
+ (UIButton *)themeBorderButton {
    UIColor *themeColor = [CJBaseUIKitThemeManager serviceThemeModel].themeColor;
    UIColor *themeOppositeColor = [CJBaseUIKitThemeManager serviceThemeModel].themeOppositeColor;
    UIColor *themeOppositeDisabledColor = [CJBaseUIKitThemeManager serviceThemeModel].themeOppositeDisabledColor;
    CGFloat buttonCornerRadius = [CJBaseUIKitThemeManager serviceThemeModel].buttonThemeModel.cornerRadius;
    CGFloat buttonSelectedBorderWidth = [CJBaseUIKitThemeManager serviceThemeModel].buttonThemeModel.selectedBorderWidth;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = buttonCornerRadius;
    button.layer.borderWidth = buttonSelectedBorderWidth;
    button.layer.borderColor = themeColor.CGColor;
    
    [button setTitleColor:themeColor forState:UIControlStateNormal];
    button.cjNormalBGColor = themeOppositeColor;
    button.cjDisabledBGColor = themeOppositeDisabledColor;
    
    return button;
}


/**
 *  "提交"/"修改"状态选择按钮(if you want to show editTitle, you should make selected == YES)
 *
 *  @param submitTitle              submitTitle(current selected should be YES)
 *  @param editTitle                editTitle(current selected should be NO)
 *  @param showEditTitle            showEditTitle(if you want to show editTitle, you should make selected == YES)
 *  @param clickSubmitTitleHandle   click submitTitle action
 *  @param clickEditTitleHandle     click editTitle action
 */
+ (UIButton *)submitButtonWithSubmitTitle:(NSString *)submitTitle
                                editTitle:(NSString *)editTitle
                            showEditTitle:(BOOL)showEditTitle
                   clickSubmitTitleHandle:(void(^)(UIButton *button))clickSubmitTitleHandle
                     clickEditTitleHandle:(void(^)(UIButton *button))clickEditTitleHandle
{
    UIButton *submitButton = [self themeNormalSelectedButtonWithNormalTitle:submitTitle selectedTitle:editTitle];
    submitButton.selected = showEditTitle;
    [submitButton setCjTouchUpInsideBlock:^(UIButton *button) {
        if (button.selected) {
            !clickEditTitleHandle ?: clickEditTitleHandle(button);
        } else {
            !clickSubmitTitleHandle ?: clickSubmitTitleHandle(button);
        }
    }];
    
    return submitButton;
}


/// 有状态切换的按钮
+ (CJButton *)themeNormalSelectedButtonWithNormalTitle:(NSString *)normalTitle selectedTitle:(NSString *)selectedTitle {
    UIColor *themeColor = [CJBaseUIKitThemeManager serviceThemeModel].themeColor;
    UIColor *themeDisabledColor = [CJBaseUIKitThemeManager serviceThemeModel].themeDisabledColor;
    UIColor *themeOppositeColor = [CJBaseUIKitThemeManager serviceThemeModel].themeOppositeColor;
    UIColor *themeOppositeDisabledColor = [CJBaseUIKitThemeManager serviceThemeModel].themeOppositeDisabledColor;
    CGFloat buttonCornerRadius = [CJBaseUIKitThemeManager serviceThemeModel].buttonThemeModel.cornerRadius;
    CGFloat buttonSelectedBorderWidth = [CJBaseUIKitThemeManager serviceThemeModel].buttonThemeModel.selectedBorderWidth;
    
    CJButton *button = [CJButton buttonWithType:UIButtonTypeCustom];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = buttonCornerRadius;
    button.cjNormalBorderWidth = 0;
    button.cjSelectedBorderWidth = buttonSelectedBorderWidth;
    
    [button setTitle:normalTitle forState:UIControlStateNormal];
    [button setTitleColor:themeOppositeColor forState:UIControlStateNormal];
//    [button setTitleColor:themeOppositeColor forState:UIControlStateNormal | UIControlStateDisabled];
    button.cjNormalBGColor = themeColor;
    button.cjNormalBorderColor = themeColor;
    button.cjDisabledBGColor = themeDisabledColor;
    button.cjDisabledBorderColor = themeDisabledColor;
    
    [button setTitle:selectedTitle forState:UIControlStateSelected];
    [button setTitleColor:themeColor forState:UIControlStateSelected];
//    [button setTitleColor:themeColor forState:UIControlStateSelected | UIControlStateNormal];
    [button setTitleColor:themeDisabledColor forState:UIControlStateSelected | UIControlStateDisabled];
    button.cjSelectedBGColor = themeOppositeColor;
    button.cjSelectedBorderColor = themeColor;
    button.cjSelectedDisabledBGColor = themeOppositeDisabledColor;
    button.cjSelectedDisabledBorderColor = themeDisabledColor;
    
    return button;
}


@end
