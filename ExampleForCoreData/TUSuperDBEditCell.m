//
//  TUSuperDBEditCell.m
//  ExampleForCoreData
//
//  Created by 3dlabuser on 14-5-31.
//  Copyright (c) 2014年 李昕宇@天津大学. All rights reserved.
//

#import "TUSuperDBEditCell.h"

static NSDictionary *__CoreDataErrors;

@implementation TUSuperDBEditCell

+ (void)initialize {
    NSURL *plistURL = [[NSBundle mainBundle] URLForResource:@"CoreDataErrors" withExtension:@"plist"];
    __CoreDataErrors = [NSDictionary dictionaryWithContentsOfURL:plistURL];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.textField.delegate = self;
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    self.textField.enabled = editing;
}
#pragma mark - SuperDBCell Overrides
- (BOOL)isEditable {
    return YES;
}
#pragma mark - Instance methods
- (IBAction)validate {
    id val = self.value;
    NSError *error;
    if (![self.hero validateValue:&val forKey:self.key error:&error]) {
        NSString *message = nil;
        if ([[error domain] isEqualToString:@"NSCocoaErrorDomain"]) {
            NSString *errorCodeStr = [NSString stringWithFormat:@"%d",[error code]];
            NSLog(@"%d",[error code]);
            NSString *errorMessage = [__CoreDataErrors valueForKey:errorCodeStr];
            NSDictionary *userInfo = [error userInfo];
            message = [NSString stringWithFormat:NSLocalizedString(@"Validation error on: %@ \rFailure Reason: %@",
                                                                   @"Validation error on: %@, Failure Reason: %@"),
                       [userInfo valueForKey:@"NSValidationErrorKey"],
                       errorMessage];
        } else {
            message = [error localizedDescription];
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Validation Error",
                                                                                  @"Validation Error")
                                                        message:message
                                                       delegate:self
                                              cancelButtonTitle:NSLocalizedString(@"Cancel", @"Cancel")
                                              otherButtonTitles:NSLocalizedString(@"Fix", @"Fix"), nil];
        [alert show];
    }
}
#pragma mark - Alert view delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == [alertView cancelButtonIndex]) {
        [self setValue:[self.hero valueForKey:self.key]];
    } else {
        [self.textField becomeFirstResponder];
    }
}
#pragma mark UITextFieldDelegate methods
- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self validate];
}
@end
