//
//  Hero.m
//  ExampleForCoreData
//
//  Created by 3dlabuser on 14-6-1.
//  Copyright (c) 2014年 李昕宇@天津大学. All rights reserved.
//

#import "Hero.h"


@implementation Hero

@dynamic age;
@dynamic birthdate;
@dynamic favoriteColor;
@dynamic name;
@dynamic secretIdentity;
@dynamic sex;

- (void)awakeFromInsert {
    self.favoriteColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
//    self.birthdate = [NSdate date];
    [super awakeFromInsert];
}

@end
