//
//  supportType.m
//  RealmTests
//
//  Created by 王开 on 2018/6/28.
//  Copyright © 2018年 com.wk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Realm/Realm.h>
#import "WKStu.h"
@interface supportType : XCTestCase

@end

@implementation supportType

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    WKStu *stu = [[WKStu alloc] init];
    stu.name = @"麻豆更美";
    stu.num = 3;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"mine_asset_loading_activity.png" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    stu.imageData = data;
    RLMRealm *relm = [RLMRealm defaultRealm];
    [relm transactionWithBlock:^{
        [relm addObject:stu];
    }];

}

@end
