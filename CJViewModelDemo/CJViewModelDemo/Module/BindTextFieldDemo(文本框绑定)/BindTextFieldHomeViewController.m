//
//  BindTextFieldHomeViewController.m
//  CJViewModelDemo
//
//  Created by ciyouzen on 11/29/18.
//  Copyright © 2018 dvlproad. All rights reserved.
//

#import "BindTextFieldHomeViewController.h"

#import "RACBindNorTextFieldViewController.h"
#import "RACBindTvTextFieldViewController.h"

@interface BindTextFieldHomeViewController ()

@end

@implementation BindTextFieldHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = NSLocalizedString(@"Bind TextField首页", nil);
    
    NSMutableArray *sectionDataModels = [[NSMutableArray alloc] init];
    //UIView
    {
        CJSectionDataModel *sectionDataModel = [[CJSectionDataModel alloc] init];
        sectionDataModel.theme = @"Bind TextField(数据绑定)";
        {
            CJModuleModel *bindModule = [[CJModuleModel alloc] init];
            bindModule.title = @"RAC Bind Normal TextField";
            bindModule.classEntry = [RACBindNorTextFieldViewController class];
            [sectionDataModel.values addObject:bindModule];
        }
        {
            CJModuleModel *bindModule = [[CJModuleModel alloc] init];
            bindModule.title = @"RAC Bind TableView TextField";
            bindModule.classEntry = [RACBindTvTextFieldViewController class];
            [sectionDataModel.values addObject:bindModule];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    self.sectionDataModels = sectionDataModels;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
