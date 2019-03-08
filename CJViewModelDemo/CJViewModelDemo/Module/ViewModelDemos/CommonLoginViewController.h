//
//  CommonLoginViewController.h
//  STDemoModuleLoginDemo
//
//  Created by ciyouzen on 6/25/15.
//  Copyright (c) 2015 dvlproad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <CJBaseUIKit/CJTextField.h>
#import <CJBaseUIKit/UIColor+CJHex.h>
#import <CJBaseUtil/CJAppLastUtil.h>

@interface CommonLoginViewController : UIViewController {
    
}
@property (nonatomic, strong) UIImageView *portraitBackgroundImageView; /**< 头像背景 */
@property (nonatomic, strong) UIImageView *portraitImageView;   /**< 头像 */
@property (nonatomic, strong) CJTextField *userNameTextField;   /**< 账号(记得关掉自动纠错) */
@property (nonatomic, strong) CJTextField *passwordTextField;   /**< 密码 */
@property (nonatomic, strong) UIButton *backButton;             /**< 返回按钮 */
@property (nonatomic, strong) UIButton *loginButton;            /**< 登录按钮 */
@property (nonatomic, strong) UIButton *findPasswordButton;     /**< 找回密码按钮 */
@property (nonatomic, strong) UIButton *registerButton;         /**< 注册按钮 */
@property (nonatomic, strong) MBProgressHUD *loginStateHUD;     /**< 进展状态HUD */

- (void)bindViewModel;

- (void)showDefaultData;

- (void)userNameTextFieldUpdateToText:(NSString *)userName;
- (void)passwordTextFieldUpdateToText:(NSString *)password;

- (void)loginButtonAction;
- (void)findPasswordButtonAction;
- (void)registerButtonAction;

@end
