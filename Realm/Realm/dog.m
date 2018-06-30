//
//  dog.m
//  Realm
//
//  Created by 王开 on 2018/6/28.
//Copyright © 2018年 com.wk. All rights reserved.
//

#import "dog.h"

@implementation dog
+ (NSDictionary<NSString *,RLMPropertyDescriptor *> *)linkingObjectsProperties
{
    return @{
             @"master" : [RLMPropertyDescriptor descriptorWithClass:NSClassFromString(@"person") propertyName:@"pets"],
             };
}
// Specify default values for properties

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

@end
