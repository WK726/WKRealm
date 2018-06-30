//
//  cat.m
//  Realm
//
//  Created by 王开 on 2018/6/29.
//Copyright © 2018年 com.wk. All rights reserved.
//

#import "cat.h"

@implementation cat
- (NSString *)timeFormat{
    return @"2017-13-12";
}
// Specify default values for properties
+ (NSArray<NSString *> *)requiredProperties
{
    return @[@"c"];
}

+ (NSDictionary *)defaultPropertyValues
{
    return @{@"c":@"wangerxiao"};
}

// Specify properties to ignore (Realm won't persist these)

+ (NSArray *)ignoredProperties
{
    return @[@"timeFormat"];
}

@end
