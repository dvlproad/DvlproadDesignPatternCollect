//
//  CQActionSheetUtil.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "CQActionSheetUtil.h"
#import "CJActionSheetView.h"
#import "UIView+CQPopupAction.h"

#import "CQJumpMapUtil.h"

#import "CQOverlayTheme.h"

@implementation CQActionSheetUtil


#pragma mark - 常用的接口（简洁接口）
/**
 *  弹出事项选择
 *
 *  @param itemTitles       可点击的事项标题数组
 *  @param itemClickBlock   点击事件
 */
+ (void)showWithItemTitles:(NSArray<NSString *> *)itemTitles
            itemClickBlock:(void(^)(NSInteger selectIndex))itemClickBlock
{
    NSMutableArray *sheetModels = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < itemTitles.count; i++) {
        CJActionSheetModel *sheetModel = [[CJActionSheetModel alloc] init];
        sheetModel.title = itemTitles[i];
        [sheetModels addObject:sheetModel];
    }
    
    [self showWithSheetModels:sheetModels itemClickBlock:itemClickBlock];
}

/**
 *  弹出图片选择
 *
 *  @param takePhotoHandle 选择"拍摄"的回调
 *  @param pickImageHandle 选择"从手机相册选择"的回调
 */
+ (void)showPickImageSheetWithTakePhotoHandle:(void(^)(void))takePhotoHandle
                              pickImageHandle:(void(^)(void))pickImageHandle
{
    NSMutableArray *sheetModels = [[NSMutableArray alloc] init];
    {
        CJActionSheetModel *takPhotoSheetModel = [[CJActionSheetModel alloc] init];
        //takPhotoSheetModel.title = NSLocalizedString(@"拍摄", nil);
        takPhotoSheetModel.title = [CJBaseOverlayThemeManager serviceThemeModel].overlayTextModel.sheetTakPhotoText;
        [sheetModels addObject:takPhotoSheetModel];
    }
    {
        CJActionSheetModel *pickImageSheetModel = [[CJActionSheetModel alloc] init];
        //pickImageSheetModel.title = NSLocalizedString(@"从手机相册选择", nil);
        pickImageSheetModel.title = [CJBaseOverlayThemeManager serviceThemeModel].overlayTextModel.sheetPickImageText;
        [sheetModels addObject:pickImageSheetModel];
    }
    
    CJActionSheetView *actionSheet = [[CJActionSheetView alloc] initWithSheetModels:sheetModels clickHandle:^(CJActionSheetModel *sheetModel, NSInteger selectIndex) {
        if (selectIndex == 0) {
            !takePhotoHandle ?: takePhotoHandle();
            
        } else if (selectIndex == 1) {
            !pickImageHandle ?: pickImageHandle();
        }
    }];
    
    [self __showActionSheet:actionSheet];
}


/**
 *  弹出地图选择
 *
 *  @param updateDefaultNavigationMap   是否在选择结束后更新默认的导航地图软件
 *  @param baiduMapBlock                选择"百度地图"
 *  @param amapBlock                    选择"高德地图"
 *  @param appleMapBlock                选择"苹果地图"
 */
+ (void)showMapsActionSheetWithUpdateMap:(BOOL)updateDefaultNavigationMap
                           baiduMapBlock:(void (^ __nullable)(BOOL canOpenBaiduMap))baiduMapBlock
                               amapBlock:(void (^ __nullable)(BOOL canOpenAmap))amapBlock
                           appleMapBlock:(void (^ __nullable)(void))appleMapBlock
{
    //NSString *sheetBaiduMapText = NSLocalizedString(@"百度地图", nil);
    //NSString *sheetAmapText = NSLocalizedString(@"高德地图", nil);
    //NSString *sheetAppleMapText = NSLocalizedString(@"苹果地图", nil);
    //NSString *sheetNoInstallMapText = NSLocalizedString(@"未安装", nil);
    NSString *sheetBaiduMapText = [CJBaseOverlayThemeManager serviceThemeModel].overlayTextModel.sheetBaiduMapText;
    NSString *sheetAmapText = [CJBaseOverlayThemeManager serviceThemeModel].overlayTextModel.sheetAmapText;
    NSString *sheetAppleMapText = [CJBaseOverlayThemeManager serviceThemeModel].overlayTextModel.sheetAppleMapText;
    NSString *sheetNoInstallMapText = [CJBaseOverlayThemeManager serviceThemeModel].overlayTextModel.sheetNoInstallMapText;
    
    NSMutableArray *sheetModels = [[NSMutableArray alloc] init];
    // 百度地图 BaiduMap
    BOOL canOpenBaiduMap = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"baidumap://"]];
    CJActionSheetModel *baiduMapSheetModel = [[CJActionSheetModel alloc] init];
    baiduMapSheetModel.title = sheetBaiduMapText;
    baiduMapSheetModel.subTitle = canOpenBaiduMap ? @"" : sheetNoInstallMapText;
    [sheetModels addObject:baiduMapSheetModel];
    
    // 高德地图 Amap
    BOOL canOpenAmap = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"amapuri://"]];
    CJActionSheetModel *amapSheetModel = [[CJActionSheetModel alloc] init];
    amapSheetModel.title = sheetAmapText;
    amapSheetModel.subTitle = canOpenAmap ? @"" : sheetNoInstallMapText;
    [sheetModels addObject:amapSheetModel];
    
    // 苹果地图 appleMap
    CJActionSheetModel *appleMapSheetModel = [[CJActionSheetModel alloc] init];
    appleMapSheetModel.title = sheetAppleMapText;
    appleMapSheetModel.subTitle = @"";
    [sheetModels addObject:appleMapSheetModel];
    
    CJActionSheetView *actionSheet = [[CJActionSheetView alloc] initWithSheetModels:sheetModels clickHandle:^(CJActionSheetModel * sheetModel, NSInteger selectIndex) {
        if (selectIndex == 0) {
            if (updateDefaultNavigationMap) {
                [CQJumpMapUtil updateDefaultMapType:CQMapTypeBMKMap];
            }
            !baiduMapBlock ?: baiduMapBlock(canOpenBaiduMap);
            
        }else if (selectIndex == 1) {
            if (updateDefaultNavigationMap) {
                [CQJumpMapUtil updateDefaultMapType:CQMapTypeAMap];
            }
            !amapBlock ?: amapBlock(canOpenAmap);
            
        }else{
            if (updateDefaultNavigationMap) {
                [CQJumpMapUtil updateDefaultMapType:CQMapTypeAppleMap];
            }
            !appleMapBlock ?: appleMapBlock();
        }
    }];
    
    [self __showActionSheet:actionSheet];
}

#pragma mark - 完整的基本接口（请优先考虑上述的常用接口）
/**
 *  弹出事项选择
 *
 *  @param sheetModels          数据数组(取消按钮上方section0中的那些数组)
 *  @param itemClickBlock   点击事件
 */
+ (void)showWithSheetModels:(NSArray<CJActionSheetModel *> *)sheetModels
             itemClickBlock:(void(^)(NSInteger selectIndex))itemClickBlock
{
    CJActionSheetView *actionSheet = [[CJActionSheetView alloc] initWithSheetModels:sheetModels clickHandle:^(CJActionSheetModel *sheetModel, NSInteger selectIndex) {
        if (itemClickBlock) {
            itemClickBlock(selectIndex);
        }
    }];
    
    [self __showActionSheet:actionSheet];
}


#pragma mark - Private Method
+ (void)__showActionSheet:(CJActionSheetView *)actionSheet {
    actionSheet.commonClickAction = ^(CJActionSheetView * _Nonnull actionSheetView) {
        [actionSheetView cjdemo_hidePopupView];
    };
    [actionSheet cjdemo_popupInBottomWithHeight:actionSheet.totalHeight];
}

@end
