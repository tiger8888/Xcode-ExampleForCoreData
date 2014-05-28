//
//  TUHeroListController.h
//  ExampleForCoreData
//
//  Created by 3dlabuser on 14-5-25.
//  Copyright (c) 2014年 李昕宇@天津大学. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kSelectedTabDefaultsKey @"Selected Tab"

enum {
    kByName,
    KBySecretIdentity
};

@interface TUHeroListController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITabBarDelegate, NSFetchedResultsControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *heroTableView;
@property (weak, nonatomic) IBOutlet UITabBar *heroTabBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;

- (IBAction)addHero:(id)sender;
@end
