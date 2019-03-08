//
//  KVOLoginViewModel.m
//  STDemoModuleLoginDemo
//
//  Created by ciyouzen on 2018/9/4.
//  Copyright © 2018年 dvlproad. All rights reserved.
//

#import "KVOLoginViewModel.h"
#import "NSString+STDemoValidate.h"
#import <CJDemoModuleLogin/CJDemoServiceUserManager+Login.h>

@interface KVOLoginViewModel () {
    
}

@end


@implementation KVOLoginViewModel

- (instancetype)initWithUserName:(NSString *)userName password:(NSString *)password {
    self = [super init];
    if (self) {
        _userName = userName;
        _password = password;
    }
    return self;
}


#pragma mark - Update
- (void)updateUserName:(NSString *)userName {
//    _userName = userName;
//    _userNameValid = [self.userName stdemo_checkUserName];
//    _loginValid = self.userNameValid && self.passwordValid;
    
    // 要供外部监听，则属性的改变应该确保能够调用setter方法，所以不应该使用_xxx，而应该self.xxx
    self.userName = userName;
    self.userNameValid = [self.userName stdemo_checkUserName];
    self.loginValid = self.userNameValid && self.passwordValid;
}

- (void)updatePassword:(NSString *)password {
    _password = password;
    _passwordValid = [self.password stdemo_checkPassword];
    _loginValid = self.userNameValid && self.passwordValid;
    
    // 要供外部监听，则属性的改变应该确保能够调用setter方法，所以不应该使用_xxx，而应该self.xxx
    self.password = password;
    self.passwordValid = [self.password stdemo_checkPassword];
    self.loginValid = self.userNameValid && self.passwordValid;
}


#pragma mark - Do
- (void)login {
    if (!self.loginValid) {
        NSString *tryFailureMessage = NSLocalizedString(@"请完善登录信息", nil);
        _tryFailureMessage = tryFailureMessage;
        
        return;
    }
    
    NSString *startMessage = NSLocalizedString(@"正在登录", nil);
    _startMessage = startMessage;
    
    NSString *userName = self.userName;
    NSString *password = self.password;
    [[CJDemoServiceUserManager sharedInstance] loginWithUserName:userName password:password success:^(DemoUser *user) {
        NSString *loginSuccessMessage = NSLocalizedString(@"登录成功", nil);
        self->_successMessage = loginSuccessMessage;
        
    } failure:^(BOOL isRequestFailure, NSString *errorMessage) {
        self->_errorMessage = errorMessage;
    }];
}


@end
