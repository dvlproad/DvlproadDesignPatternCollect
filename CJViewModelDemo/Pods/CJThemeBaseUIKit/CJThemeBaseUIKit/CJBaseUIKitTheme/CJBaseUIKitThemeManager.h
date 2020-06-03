//
//  CJBaseUIKitThemeManager.h
//  AppCommonUICollect
//
//  Created by ciyouzen on 2018/9/27.
//  Copyright © 2018年 dvlproad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CJBaseUIKitThemeModel.h"

@interface CJBaseUIKitThemeManager : NSObject {
    
}
@property (nonatomic, strong) CJBaseUIKitThemeModel *serviceThemeModel;

+ (CJBaseUIKitThemeManager *)sharedInstance;

/**
 *  获取当前正在使用的主题
 *
 *  @return serviceThemeModel
 */
+ (CJBaseUIKitThemeModel *)serviceThemeModel;

@end
