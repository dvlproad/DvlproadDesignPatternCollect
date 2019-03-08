//
//  DemoToast.h
//  CJDemoModuleLoginDemoCommonDemo
//
//  Created by ciyouzen on 2018/9/20.
//  Copyright © 2018年 dvlproad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DemoToast : NSObject

///显示只有文字的提示
+ (void)showMessage:(NSString *)message;

+ (void)showMessage:(NSString *)message inView:(UIView *)view;

///显示含图片的错误提示
+ (void)showErrorMessage:(NSString *)errorMessage;

@end
