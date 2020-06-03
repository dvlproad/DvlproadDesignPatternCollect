//
//  CJThemeButtonFactory.h
//  CJUIKitDemo
//
//  Created by ciyouzen on 2020/1/31.
//  Copyright © 2020 dvlproad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CJBaseUIKit/CJButton.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJThemeButtonFactory : NSObject

/// 以主题色为背景的按钮
+ (CJButton *)themeBGButton;

///以主题色为边框的按钮
+ (UIButton *)themeBorderButton;

/// 有状态切换的按钮
+ (CJButton *)themeNormalSelectedButtonWithNormalTitle:(NSString *)normalTitle selectedTitle:(NSString *)selectedTitle;

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
                     clickEditTitleHandle:(void(^)(UIButton *button))clickEditTitleHandle;

@end

NS_ASSUME_NONNULL_END
