//
//  WKStu.m
//  Realm
//
//  Created by 王开 on 2018/6/26.
//Copyright © 2018年 com.wk. All rights reserved.
//

#import "WKStu.h"

@implementation WKStu
+ (NSString *)primaryKey{
    return @"num";
}

// Specify default values for properties

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[@"image"];
//}

- (UIImage *)image
{
    return [UIImage imageWithData:self.imageData];
}
@end
