//
//  TUSuperDBEditCell.h
//  ExampleForCoreData
//
//  Created by 3dlabuser on 14-5-31.
//  Copyright (c) 2014年 李昕宇@天津大学. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TUSuperDBEditCell : UITableViewCell<UITextFieldDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UITextField *textField;

@property (strong, nonatomic) NSString *key;
@property (strong, nonatomic) id value;

@property (strong, nonatomic) NSManagedObject *hero;

- (IBAction)validate;

@end
