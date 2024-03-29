//
//  TUSuperDBCell.m
//  
//
//  Created by 3dlabuser on 14-6-2.
//
//

#import "TUSuperDBCell.h"
#define kLabelTextColor [UIColor colorWithRed:0.321569f green:0.4f blue:0.568627f alpha:1.0f]

@implementation TUSuperDBCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.selectionStyle = UITableViewCellSelectionStyleNone;//选中后不变色
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(12.0, 15.0, 67.0, 15.0)];
        self.label.backgroundColor = [UIColor clearColor];
        self.label.font = [UIFont boldSystemFontOfSize:[UIFont smallSystemFontSize]];
        self.label.textAlignment = NSTextAlignmentRight;
        self.label.textColor = kLabelTextColor;
        self.label.text = @"label";
        [self.contentView addSubview:self.label];
        
        self.textField = [[UITextField alloc] initWithFrame:CGRectMake(93.0, 13.0, 170.0, 19.0)];
        self.textField.backgroundColor = [UIColor clearColor];
        self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.textField.enabled = NO;
        self.textField.font = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
        self.textField.text = @"Title";
        [self.contentView addSubview:self.textField];
    }
    return self;
}

#pragma mark - Instence Methods
- (BOOL)isEditable {
    return NO;
}

#pragma mark - Property overrides
- (id)value {
    return self.textField.text;
}
- (void)setValue:(id)aValue {
    if ([aValue isKindOfClass:[NSString class]]) {
        self.textField.text = aValue;
    } else {
        self.textField.text = [aValue description];
    }
}

@end
