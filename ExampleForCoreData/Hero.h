//
//  Hero.h
//  ExampleForCoreData
//
//  Created by 3dlabuser on 14-6-1.
//  Copyright (c) 2014年 李昕宇@天津大学. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Hero : NSManagedObject

@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSDate * birthdate;
@property (nonatomic, retain) id favoriteColor;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * secretIdentity;
@property (nonatomic, retain) NSString * sex;

@end
