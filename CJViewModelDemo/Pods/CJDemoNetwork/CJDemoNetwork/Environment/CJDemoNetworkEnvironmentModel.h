//
//  CJDemoNetworkEnvironmentModel.h
//  CJDemoNetworkDemo
//
//  Created by ciyouzen on 2018/9/17.
//  Copyright © 2018年 dvlproad. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  环境模型
 */
@interface CJDemoNetworkEnvironmentModel : NSObject

@property (nonatomic, copy) NSString *eid;      /**< id */
@property (nonatomic, copy) NSString *name;     /**< 名字/描述 */

@property (nonatomic, copy) NSString *schema;   /**< schema */

@property (nonatomic, assign) BOOL useDomain;   /**< 是否使用域名 */
@property (nonatomic, copy) NSString *domain;   /**< 域名 */
@property (nonatomic, copy) NSString *ip;       /**< ip */

@end
