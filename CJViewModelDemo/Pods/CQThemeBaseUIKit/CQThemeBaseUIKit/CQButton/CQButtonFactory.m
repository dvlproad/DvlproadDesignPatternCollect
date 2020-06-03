//
//  CQButtonFactory.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2018/9/3.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "CQButtonFactory.h"
#import <CJThemeBaseUIKit/CJThemeButtonFactory.h>

@implementation CQButtonFactory

#pragma mark - 基础按钮
/// 以主题色为背景的按钮
+ (CJButton *)themeBGButton {
    return [CJThemeButtonFactory themeBGButton];
}

///以主题色为边框的按钮
+ (UIButton *)themeBorderButton {
    return [CJThemeButtonFactory themeBorderButton];
}

/// 有状态切换的按钮
+ (CJButton *)themeNormalSelectedButtonWithNormalTitle:(NSString *)normalTitle selectedTitle:(NSString *)selectedTitle {
    return [CJThemeButtonFactory themeNormalSelectedButtonWithNormalTitle:normalTitle selectedTitle:selectedTitle];
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
    return [CJThemeButtonFactory submitButtonWithSubmitTitle:submitTitle editTitle:editTitle showEditTitle:showEditTitle clickSubmitTitleHandle:clickSubmitTitleHandle clickEditTitleHandle:clickEditTitleHandle];
}

#pragma mark - 登录就会用到的几个按钮
/// 倒计时按钮(获取短信验证码时候使用)
+ (UIButton *)timerButton {
//    UIButton *timerButton = [CJThemeButtonFactory themeBGButton];
    UIButton *timerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    timerButton.layer.masksToBounds = YES;
    timerButton.layer.cornerRadius = 5;
    [timerButton setTitleColor:CJColorFromHexString(@"#ffffff") forState:UIControlStateNormal];
    [timerButton setTitleColor:CJColorFromHexString(@"#01adfe") forState:UIControlStateDisabled];
    
    timerButton.cjNormalBGColor = CJColorFromHexString(@"#01adfe");
    timerButton.cjHighlightedBGColor = CJColorFromHexString(@"#1393d7");
    timerButton.cjDisabledBGColor = CJColorFromHexString(@"#ffffff");
    
    return timerButton;
}

/// 帮助按钮(短信验证码获取不到时候，语音验证码的获取按钮)
+ (UIButton *)helpButtonWithTitle:(NSString *)title {
    UIButton *voiceAuthCodeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //voiceAuthCodeButton.backgroundColor = [UIColor cyanColor];
    [voiceAuthCodeButton setTitle:title forState:UIControlStateNormal];
    voiceAuthCodeButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;//右对齐
    voiceAuthCodeButton.titleLabel.numberOfLines = 0;
    voiceAuthCodeButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [voiceAuthCodeButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
    
    [voiceAuthCodeButton setTitleColor:CJColorFromHexString(@"#f5a623") forState:UIControlStateNormal];
    [voiceAuthCodeButton setTitleColor:CJColorFromHexString(@"#b1b3b6") forState:UIControlStateDisabled];
    
    return voiceAuthCodeButton;
}

/// 状态选择按钮(访问协议的是否"同意"按钮)
+ (UIButton *)stateButtonWithTitle:(NSString *)title normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage {
    UIButton *agreeProtocolButton = [UIButton buttonWithType:UIButtonTypeCustom];
    title = [@" " stringByAppendingString:title];
    [agreeProtocolButton setTitle:title forState:UIControlStateNormal];
    [agreeProtocolButton setImage:normalImage forState:UIControlStateNormal];
    [agreeProtocolButton setImage:selectedImage forState:UIControlStateSelected];
    [agreeProtocolButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [agreeProtocolButton setTitleColor:CJColorFromHexString(@"#b1b3b6") forState:UIControlStateNormal];
    [agreeProtocolButton setImageEdgeInsets:UIEdgeInsetsMake(1, 0, 3, 0)];
    agreeProtocolButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    return agreeProtocolButton;
}

/// 链接按钮(常用于访问网页协议等)
+ (UIButton *)linkButtonWithTitle:(NSString *)title {
    UIButton *linkButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [linkButton setTitle:title forState:UIControlStateNormal];
    [linkButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [linkButton setTitleColor:CJColorFromHexString(@"#169bdb") forState:UIControlStateNormal];
    //    [lookProtocolButton addTarget:self action:@selector(lookProtocolEvent:) forControlEvents:UIControlEventTouchUpInside];
    return linkButton;
}

/// 第三方平台访问按钮(如微信登录)
+ (UIButton *)platformButtonWithTitle:(NSString *)title image:(UIImage *)image {
    UIButton *wechatLoginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    wechatLoginButton.backgroundColor = [UIColor clearColor];
    [wechatLoginButton setImage:image forState:UIControlStateNormal];
    [wechatLoginButton setTitle:title forState:UIControlStateNormal];
    [wechatLoginButton setTitleColor:CJColorFromHexString(@"#1a1a1a") forState:UIControlStateNormal];
    [wechatLoginButton.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [wechatLoginButton cjVerticalImageAndTitle:10]; //写在这边imageView.frame.size为(0,0),所以设置无效
    
    return wechatLoginButton;
}

#pragma mark - 其他

///含图片与文字的按钮，图片在右
+ (UIButton *)imageButtonWithTitle:(NSString *)title rightImage:(UIImage *)rightImage {
    UIButton *imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [imageButton setFrame:CGRectMake(0, 0, 150, 44)];
    [imageButton setTitle:title forState:UIControlStateNormal];
    [imageButton setImage:rightImage forState:UIControlStateNormal];
    [imageButton setAdjustsImageWhenHighlighted:YES];
    [imageButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    CGFloat buttonImageWidth = imageButton.imageView.image.size.width;
    [imageButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -buttonImageWidth, 0, buttonImageWidth)];
    
    CGFloat buttonTitleWidth = imageButton.titleLabel.bounds.size.width+5;
    [imageButton setImageEdgeInsets:UIEdgeInsetsMake(0, buttonTitleWidth, 0, -buttonTitleWidth)];
    
    return imageButton;
}

@end
