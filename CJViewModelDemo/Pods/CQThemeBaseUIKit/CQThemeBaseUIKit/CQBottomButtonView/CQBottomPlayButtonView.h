//
//  CQBottomPlayButtonView.h
//  CJUIKitDemo
//
//  Created by ciyouzen on 2020/5/15.
//  Copyright © 2020 dvlproad. All rights reserved.
//

#import "CQBottomBaseButtonView.h"
#import <Masonry/Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface CQBottomPlayButtonView : CQBottomBaseButtonView {
    
}
@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UILabel *rightLabel;

#pragma mark - Init
- (instancetype)initWithLastActionBlock:(void(^)(CQBottomPlayButtonView *bPlayView, UIButton *bButton))lastActionBlock
                        nextActionBlock:(void(^)(CQBottomPlayButtonView *bPlayView, UIButton *bButton))nextActionBlock
                    playExamActionBlock:(void(^)(CQBottomPlayButtonView *bPlayView, UIButton *bButton))playExamActionBlock
                       resetActionBlock:(void(^)(CQBottomPlayButtonView *bPlayView, UIButton *bButton))resetActionBlock;

@end

NS_ASSUME_NONNULL_END
