//
//  CQBaseUIThemeSetting.m
//  AppCommonUICollect
//
//  Created by ciyouzen on 2019/3/15.
//  Copyright © 2019 dvlproad. All rights reserved.
//

#import "CQBaseUIThemeSetting.h"

@implementation CQBaseUIThemeSetting

/// 设置 BaseUI 的 主题风格
+ (void)useBaseUIThemeType:(BaseUIThemeType)themeType {
    switch (themeType) {
        case BaseUIThemeTypeCoffee:
        {
            [self _useBaseUIThemeCoffee];
            break;
        }
        case BaseUIThemeTypeTea:
        {
            [self _useBaseUIThemeTea];
            break;
        }
        case BaseUIThemeTypeDriver:
        {
            [self _useBaseUIThemeDriver];
            break;
        }
        case BaseUIThemeTypeEmployee:
        {
            [self _useBaseUIThemeEmployee];
            break;
        }
        default:
        {
            break;
        }
    }
}

#pragma mark - Theme Coffee
/// 设置 全局默认 的 主题 为 Coffee 主题
+ (void)_useBaseUIThemeCoffee {
    // 设置 全局默认 的 主题
    CJBaseUIKitThemeModel *totalThemeModel = [CJBaseUIKitThemeManager serviceThemeModel];
    totalThemeModel.themeColor = CJColorFromHexString(@"#192B93FF");
    totalThemeModel.themeDisabledColor = CJColorFromHexString(@"#192B9366");
    totalThemeModel.themeOppositeColor = CJColorFromHexString(@"#FFFFFF");
    totalThemeModel.themeOppositeDisabledColor = CJColorFromHexString(@"#FFFFFF4C");
}


#pragma mark - Theme Tea
/// 设置 全局默认 的 主题 为 Tea 主题
+ (void)_useBaseUIThemeTea {
    // 设置 全局默认 的 主题
    CJBaseUIKitThemeModel *totalThemeModel = [CJBaseUIKitThemeManager serviceThemeModel];
    totalThemeModel.themeColor = CJColorFromHexString(@"#192B93FF");
    totalThemeModel.themeDisabledColor = CJColorFromHexString(@"#192B9366");
    totalThemeModel.themeOppositeColor = CJColorFromHexString(@"#FFFFFF");
    totalThemeModel.themeOppositeDisabledColor = CJColorFromHexString(@"#FFFFFF4C");
}


#pragma mark - Theme Driver
/// 设置 全局默认 的 主题 为 Driver 主题
+ (void)_useBaseUIThemeDriver {
    // 设置 全局默认 的 主题
    CJBaseUIKitThemeModel *totalThemeModel = [CJBaseUIKitThemeManager serviceThemeModel];
    totalThemeModel.themeColor = CJColorFromHexString(@"#4499FFFF");
    totalThemeModel.themeDisabledColor = CJColorFromHexString(@"#4499FF66");
    totalThemeModel.themeOppositeColor = CJColorFromHexString(@"#FFFFFF");
    totalThemeModel.themeOppositeDisabledColor = CJColorFromHexString(@"#FFFFFF4C");
    
    totalThemeModel.searchBarThemeModel.cancelText = @"取消";
}

#pragma mark - Theme Employee
/// 设置 全局默认 的 主题 为 Employee 主题
+ (void)_useBaseUIThemeEmployee {
    // 设置 全局默认 的 主题
    CJBaseUIKitThemeModel *totalThemeModel = [CJBaseUIKitThemeManager serviceThemeModel];
    totalThemeModel.themeColor = CJColorFromHexString(@"#172991");
    totalThemeModel.themeDisabledColor = CJColorFromHexStringAndAlpha(@"#172991", 0.6);
    totalThemeModel.themeOppositeColor = CJColorFromHexString(@"#FFFFFF");
    totalThemeModel.themeOppositeDisabledColor = CJColorFromHexString(@"#FFFFFF4C");
    
    totalThemeModel.searchBarThemeModel.cancelText = @"取消";
}

@end
