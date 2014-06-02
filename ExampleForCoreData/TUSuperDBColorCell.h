//
//  TUSuperDBColorCell.h
//  ExampleForCoreData
//
//  Created by 3dlabuser on 14-6-2.
//  Copyright (c) 2014年 李昕宇@天津大学. All rights reserved.
//

#import "TUSuperDBEditCell.h"
#import "TUColorPicker.h"

@interface TUSuperDBColorCell : TUSuperDBEditCell

@property (strong, nonatomic) TUColorPicker *colorPicker;
- (void)colorPickerChanged:(id)sender;
- (NSAttributedString *)attributedColorString;

@end
