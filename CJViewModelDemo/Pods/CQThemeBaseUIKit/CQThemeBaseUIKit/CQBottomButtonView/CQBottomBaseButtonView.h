//
//  CQBottomBaseButtonView.h
//  CJUIKitDemo
//
//  Created by ciyouzen on 2020/5/15.
//  Copyright © 2020 dvlproad. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CQBottomBaseButtonView : UIView {
    
}
@property (nonatomic, assign, readonly) CGFloat extraHeight; // 视图上除button外的其他高度

/// 子类重写此方法
- (UIView *)renderBottomContentView;

@end

NS_ASSUME_NONNULL_END
