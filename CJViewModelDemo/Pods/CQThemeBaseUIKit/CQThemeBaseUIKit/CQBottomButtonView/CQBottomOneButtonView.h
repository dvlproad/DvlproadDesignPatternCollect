//
//  CQBottomOneButtonView.h
//  CJUIKitDemo
//
//  Created by ciyouzen on 2020/5/15.
//  Copyright © 2020 dvlproad. All rights reserved.
//

#import "CQBottomBaseButtonView.h"
#import <Masonry/Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface CQBottomOneButtonView : CQBottomBaseButtonView {
    
}

#pragma mark - Init
- (instancetype)initWithTitle:(NSString *)title
                  actionBlock:(void(^)(UIButton *bButton))actionBlock;


@end

NS_ASSUME_NONNULL_END
