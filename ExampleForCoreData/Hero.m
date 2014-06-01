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

- (BOOL)validateBirthdate:(id *)ioValue error:(NSError **)outError {
    NSDate *date = *ioValue;
    if ([date compare:[NSDate date]] == NSOrderedDescending) {
        if (outError != NULL) {
            NSString *errorStr = NSLocalizedString(@"Birthdate cannot be in the future",
                                                   @"Birthdate cannot be in the future");
            NSDictionary *userInfoDict = [NSDictionary dictionaryWithObject:errorStr
                                                                     forKey:NSLocalizedDescriptionKey];
            NSError *error = [[NSError alloc] initWithDomain:kHeroValidationDomain
                                                        code:kHeroValidationBirthdateCode
                                                    userInfo:userInfoDict];
            *outError = error;
        }
        return NO;
    }
    return YES;
}
- (BOOL)validateNameOrSecretIdentity:(NSError **)outError {
    if ( (0 == [self.name length]) && (0 == [self.secretIdentity length])) {
        if (outError != NULL) {
            NSString *errorString = NSLocalizedString(@"Must provide name or secret identity.",
                                                      @"Must provide name or secret identity.");
            NSDictionary *userInfoDict = [NSDictionary dictionaryWithObject:errorString
                                                                     forKey:NSLocalizedDescriptionKey];
            NSError *error = [[NSError alloc] initWithDomain:kHeroValidationDomain code:kHeroValidationNameOrSecretIdentityCode userInfo:userInfoDict];
            *outError = error;
        }
        return NO;
    }
    return YES;
}
- (BOOL)validateForInsert:(NSError *__autoreleasing *)outError {
    return [self validateNameOrSecretIdentity:outError];
}
- (BOOL)validateForUpdate:(NSError *__autoreleasing *)outError {
    return [self validateNameOrSecretIdentity:outError];
}
@end
