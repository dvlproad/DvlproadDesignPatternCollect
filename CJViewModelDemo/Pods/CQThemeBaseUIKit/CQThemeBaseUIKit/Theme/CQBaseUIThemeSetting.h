//
//  CQBaseUIThemeSetting.h
//  AppCommonUICollect
//
//  Created by ciyouzen on 2019/3/15.
//  Copyright © 2019 dvlproad. All rights reserved.
//
//  此类内置一些主题风格，可用于直接使用，或者自己参考这边的设置来自定义自己的主题

#import <UIKit/UIKit.h>
#import <CJBaseUIKit/UIColor+CJHex.h>
#import <CJThemeBaseUIKit/CJBaseUIKitThemeManager.h>

typedef NS_ENUM(NSUInteger, BaseUIThemeType) {
    BaseUIThemeTypeDefault,
    BaseUIThemeTypeCoffee,
    BaseUIThemeTypeTea,
    BaseUIThemeTypeDriver,
    BaseUIThemeTypeEmployee
};


@interface CQBaseUIThemeSetting : NSObject {
    
}

/// 设置 BaseUI 的 主题风格
+ (void)useBaseUIThemeType:(BaseUIThemeType)themeType;

@end
