//
//  CQBottomThreeButtonView.h
//  CJUIKitDemo
//
//  Created by ciyouzen on 2020/5/15.
//  Copyright © 2020 dvlproad. All rights reserved.
//

#import "CQBottomBaseButtonView.h"
#import <Masonry/Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface CQBottomThreeButtonView : CQBottomBaseButtonView {
    
}

#pragma mark - Init
- (instancetype)initWithTitle1:(NSString *)title1
                        title2:(NSString *)title2
                        title3:(NSString *)title3
                  actionBlock1:(void(^)(UIButton *bButton))actionBlock1
                  actionBlock2:(void(^)(UIButton *bButton))actionBlock2
                  actionBlock3:(void(^)(UIButton *bButton))actionBlock3;


@end

NS_ASSUME_NONNULL_END
