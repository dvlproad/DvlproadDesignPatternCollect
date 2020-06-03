//
//  CJScreenBottomTableViewCell.h
//  CJUIKitDemo
//
//  Created by ciyouzen on 2018/7/3.
//  Copyright © 2018年 dvlproad. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *  与屏幕底部(即边缘)想接触的cell
 */
@interface CJScreenBottomTableViewCell : UITableViewCell {
    
}
@property (nonatomic, strong) UILabel *mainTitleLabel;  /**< 主标题 */
@property (nonatomic, strong) UILabel *subTitleLabel;   /**< 副标题 */
@property (nonatomic, assign) BOOL showBottomLine;      /**< 是否显示cell的底部横线(默认YES) */

@end

NS_ASSUME_NONNULL_END
