//
//  Hero.h
//  ExampleForCoreData
//
//  Created by 3dlabuser on 14-6-1.
//  Copyright (c) 2014年 李昕宇@天津大学. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#define kHeroValidationDomain @"cn.edu.tju.ExampleForCoreData.HeroValidationDomain"
#define kHeroValidationBirthdateCode 1000
#define kHeroValidationNameOrSecretIdentityCode 1001

@interface Hero : NSManagedObject

@property (nonatomic, retain, readonly) NSNumber * age;
@property (nonatomic, retain) NSDate * birthdate;
@property (nonatomic, retain) UIColor * favoriteColor;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * secretIdentity;
@property (nonatomic, retain) NSString * sex;

@end
