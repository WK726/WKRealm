//
//  可空属性&默认值¥忽略属性.m
//  RealmTests
//
//  Created by 王开 on 2018/6/29.
//  Copyright © 2018年 com.wk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "cat.h"
@interface propertys : XCTestCase

@end

@implementation propertys

- (void)testNil {

    cat *cat1 = [[cat alloc] init];
    cat1.a = 1;
    cat1.c = @"ceshi";
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm transactionWithBlock:^{
        [realm addObject:cat1];
    }];
}

@end
