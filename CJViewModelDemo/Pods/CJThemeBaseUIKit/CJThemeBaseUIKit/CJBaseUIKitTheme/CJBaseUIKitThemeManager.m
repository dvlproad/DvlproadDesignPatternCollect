//
//  CJBaseUIKitThemeManager.m
//  AppCommonUICollect
//
//  Created by ciyouzen on 2018/9/27.
//  Copyright © 2018年 dvlproad. All rights reserved.
//

#import "CJBaseUIKitThemeManager.h"

@implementation CJBaseUIKitThemeManager

+ (CJBaseUIKitThemeManager *)sharedInstance {
    static CJBaseUIKitThemeManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _serviceThemeModel = [[CJBaseUIKitThemeModel alloc] init];
    }
    return self;
}

/**
 *  获取当前正在使用的主题
 *
 *  @return serviceThemeModel
 */
+ (CJBaseUIKitThemeModel *)serviceThemeModel {
    return [CJBaseUIKitThemeManager sharedInstance].serviceThemeModel;
}

@end
