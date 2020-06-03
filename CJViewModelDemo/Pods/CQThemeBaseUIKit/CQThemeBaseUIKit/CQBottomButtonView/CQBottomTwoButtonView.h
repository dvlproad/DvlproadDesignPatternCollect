//
//  CQBottomTwoButtonView.h
//  CJUIKitDemo
//
//  Created by ciyouzen on 2020/5/15.
//  Copyright © 2020 dvlproad. All rights reserved.
//

#import "CQBottomBaseButtonView.h"
#import <Masonry/Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface CQBottomTwoButtonView : CQBottomBaseButtonView {
    
}

#pragma mark - Init
- (instancetype)initWithTitle1:(NSString *)title1
                        title1:(NSString *)title2
                  actionBlock1:(void(^)(UIButton *bButton))actionBlock1
                  actionBlock2:(void(^)(UIButton *bButton))actionBlock2;


@end

NS_ASSUME_NONNULL_END
