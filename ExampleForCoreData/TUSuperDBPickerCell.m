//
//  TUSuperDBPickerCell.m
//  ExampleForCoreData
//
//  Created by 3dlabuser on 14-6-1.
//  Copyright (c) 2014年 李昕宇@天津大学. All rights reserved.
//

#import "TUSuperDBPickerCell.h"

@interface TUSuperDBPickerCell ()
@property (strong, nonatomic) UIPickerView *pickerView;
@end

@implementation TUSuperDBPickerCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textField.clearButtonMode = UITextFieldViewModeNever;
        self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectZero];
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
        self.textField.inputView = self.pickerView;
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
#pragma mark - Picker view data source methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.values count];
}
#pragma mark - Picker view delegate methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.values objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.value = [self.values objectAtIndex:row];
}
#pragma mark - SuperDBEditCell Overrides
- (void)setValue:(id)value {
    if (nil != value) {
        NSInteger index = [self.values indexOfObject:value];
        if (NSNotFound != index) {
            self.textField.text = value;
        } else {
            self.textField.text = nil;
        }
    }
}
@end
