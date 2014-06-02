//
//  TUColorPicker.m
//  ExampleForCoreData
//
//  Created by 3dlabuser on 14-6-2.
//  Copyright (c) 2014年 李昕宇@天津大学. All rights reserved.
//

#import "TUColorPicker.h"

@interface TUColorPicker ()
@property (strong, nonatomic) UISlider *redSlider;
@property (strong, nonatomic) UISlider *greenSlider;
@property (strong, nonatomic) UISlider *blueSlider;
@property (strong, nonatomic) UISlider *alphaSlider;
- (IBAction)sliderChanged:(id)sender;
- (UILabel *)labelWithFrame:(CGRect)frame text:(NSString *)text;
@end

@implementation TUColorPicker

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        [self addSubview:[self labelWithFrame:CGRectMake(20.0, 40.0, 60.0, 24.0) text:@"Red"]];
        [self addSubview:[self labelWithFrame:CGRectMake(20.0, 80.0, 60.0, 24.0) text:@"Green"]];
        [self addSubview:[self labelWithFrame:CGRectMake(20.0, 120.0, 60.0, 24.0) text:@"Blue"]];
        [self addSubview:[self labelWithFrame:CGRectMake(20.0, 160.0, 60.0, 24.0) text:@"Alpha"]];
        
        _redSlider = [[UISlider alloc] initWithFrame:CGRectMake(100.0, 40.0, 190.0, 24.0)];
        _greenSlider = [[UISlider alloc] initWithFrame:CGRectMake(100.0, 80.0, 190.0, 24.0)];
        _blueSlider = [[UISlider alloc] initWithFrame:CGRectMake(100.0, 120.0, 190.0, 24.0)];
        _alphaSlider = [[UISlider alloc] initWithFrame:CGRectMake(100.0, 160.0, 190.0, 24.0)];
        
        [_redSlider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
        [_greenSlider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
        [_blueSlider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
        [_alphaSlider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
        
        [self addSubview:_redSlider];
        [self addSubview:_greenSlider];
        [self addSubview:_blueSlider];
        [self addSubview:_alphaSlider];
    }
    return self;
}

#pragma mark - Property Overrides
- (void)setColor:(UIColor *)color {
    _color = color;
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    [_redSlider setValue:components[0]];
    [_greenSlider setValue:components[1]];
    [_blueSlider setValue:components[2]];
    [_alphaSlider setValue:components[3]];
}

- (IBAction)sliderChanged:(id)sender {
    _color = [UIColor colorWithRed:_redSlider.value
                             green:_greenSlider.value
                              blue:_blueSlider.value
                             alpha:_alphaSlider.value];
    [self sendActionsForControlEvents:UIControlEventValueChanged];//这一步是让ColorPicker(作为一个UIControl)发出ValueChanged的事件，来告知将要建立的CellColorPicker的值发生了改变，相应的textField也要跟着变
}

- (UILabel *)labelWithFrame:(CGRect)frame text:(NSString *)text {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.userInteractionEnabled = NO;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
    label.textAlignment = NSTextAlignmentRight;
    label.textColor = [UIColor darkTextColor];
    label.text = text;
    return label;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
