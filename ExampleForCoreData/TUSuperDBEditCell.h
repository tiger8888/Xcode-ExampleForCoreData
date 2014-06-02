//
//  TUSuperDBEditCell.h
//  ExampleForCoreData
//
//  Created by 3dlabuser on 14-5-31.
//  Copyright (c) 2014年 李昕宇@天津大学. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TUSuperDBCell.h"

@interface TUSuperDBEditCell : TUSuperDBCell<UITextFieldDelegate, UIAlertViewDelegate>

- (IBAction)validate;

@end
