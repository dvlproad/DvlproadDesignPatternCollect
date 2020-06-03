//
//  CJBaseUIKitThemeModel.m
//  AppCommonUICollect
//
//  Created by ciyouzen on 2018/9/27.
//  Copyright © 2018年 dvlproad. All rights reserved.
//

#import "CJBaseUIKitThemeModel.h"

@implementation CJBaseUIKitThemeModel

- (instancetype)init {
    self = [super init];
    if (self) {
        // 总的默认主题
        // 总的默认主题
        _themeColor = [UIColor colorWithRed:1/255.0f green:173/255.0f blue:254/255.0f alpha:1.0];  // @"#01adfeFF");
        _themeDisabledColor = [UIColor colorWithRed:1/255.0f green:173/255.0f blue:254/255.0f alpha:0.6];  // (@"#01adfe66");
        _themeOppositeColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1.0];  // (@"#FFFFFF");
        _themeOppositeDisabledColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:0.4];  // (@"#FFFFFF4C");
        
        
        _separateLineColor = [UIColor colorWithRed:224/255.0f green:224/255.0f blue:224/255.0f alpha:1.0];  // (@"#E5E5E5");
        _textMainColor = [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1.0];  // (@"#333333");
        _text666Color = [UIColor colorWithRed:102/255.0f green:102/255.0f blue:102/255.0f alpha:1.0];  // (@"#666666");
        _textAssistColor = [UIColor colorWithRed:144/255.0f green:144/255.0f blue:144/255.0f alpha:1.0];  // (@"#999999");
        _placeholderTextColor = [UIColor colorWithRed:192/255.0f green:192/255.0f blue:192/255.0f alpha:1.0];  // (@"#CCCCCC");
        
        _blankBGColor = [UIColor colorWithRed:40/255.0f green:40/255.0f blue:40/255.0f alpha:0.4];  // (@"#28282878");
        
        _buttonThemeModel = [[CJButtonThemeModel alloc] init];
        _searchBarThemeModel = [[CJSearchBarThemeModel alloc] init];
    }
    return self;
}

@end




@implementation CJButtonThemeModel

- (instancetype)init {
    self = [super init];
    if (self) {
        // Button的默认主题
        _cornerRadius = 15;
        _selectedBorderWidth = 0.5;
    }
    return self;
}

@end

@implementation CJSearchBarThemeModel

- (instancetype)init {
    self = [super init];
    if (self) {
        // SearchBar的默认主题
        _cancelText = @"取消";
    }
    return self;
}

#pragma mark - Setter
- (void)setCancelText:(NSString *)cancelText {
    _cancelText = cancelText;
    
    [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitle:cancelText];
}

@end
