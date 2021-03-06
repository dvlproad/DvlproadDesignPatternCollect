//
//  BindPropertyHomeViewController.m
//  CJViewModelDemo
//
//  Created by ciyouzen on 11/29/18.
//  Copyright © 2018 dvlproad. All rights reserved.
//

#import "BindPropertyHomeViewController.h"

#import "RACBindTvPropertyViewController.h"

@interface BindPropertyHomeViewController ()

@end

@implementation BindPropertyHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = NSLocalizedString(@"Bind Control Property", nil);
    
    NSMutableArray *sectionDataModels = [[NSMutableArray alloc] init];
    //UIView
    {
        CJSectionDataModel *sectionDataModel = [[CJSectionDataModel alloc] init];
        sectionDataModel.theme = @"Bind Control Property(绑定属性)";
        {
            CJModuleModel *bindModule = [[CJModuleModel alloc] init];
            bindModule.title = @"RAC Bind Control Property";
            bindModule.classEntry = [RACBindTvPropertyViewController class];
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
