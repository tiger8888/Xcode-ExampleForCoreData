//
//  TUHeroListController.h
//  ExampleForCoreData
//
//  Created by 3dlabuser on 14-5-25.
//  Copyright (c) 2014年 李昕宇@天津大学. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TUHeroListController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *heroTableView;
@property (weak, nonatomic) IBOutlet UITabBar *heroTabBar;

@end
