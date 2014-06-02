//
//  TUSuperDBCell.h
//  
//
//  Created by 3dlabuser on 14-6-2.
//
//

#import <UIKit/UIKit.h>

@interface TUSuperDBCell : UITableViewCell

@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UITextField *textField;

@property (strong, nonatomic) NSString *key;
@property (strong, nonatomic) id value;

@property (strong, nonatomic) NSManagedObject *hero;

@end
