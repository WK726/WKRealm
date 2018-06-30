//
//  数据库迁移.m
//  RealmTests
//
//  Created by 王开 on 2018/6/30.
//  Copyright © 2018年 com.wk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Migration.h"
@interface dataBaseMirgation : XCTestCase

@end

@implementation dataBaseMirgation
//1.单纯的数据叠加迁移
//2.某些字段没有了/多了
//3.某些字段和老的字段存在关系
//3.重命名
//4.版本增量式迁移
//[migration enumerateObjects:@"Migration"  block:^(RLMObject * _Nullable oldObject, RLMObject * _Nullable newObject) {
//if (oldSchemaVersion < 1) {
//    newObject[@"fullName"] = [NSString stringWithFormat:@"%@%@",oldObject[@"preName"],oldObject[@"lastName"]];
//}
//if (oldSchemaVersion < 2) {
//    newObject[@"fullName2"] = [NSString stringWithFormat:@"%@",oldObject[@"fullName"]];
//}
//            }];
- (void)setUp {
    //在[appDlegate didFinishLaunchingWithOptions:] 中进行配置
    //获取默认配置，叠加版本号

    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    //1.2叠加版本号（要比上一次的版本号高） 0
    int newVersion = 4;
    config.schemaVersion = newVersion;
    //3.具体的迁移
    [config setMigrationBlock:^(RLMMigration * _Nonnull migration, uint64_t oldSchemaVersion) {
        if (oldSchemaVersion < newVersion) {
            //执行更名动作
            [migration renamePropertyForClass:@"Migration" oldName:@"fullName" newName:@"fullName2"];
            //需要做迁移（需要判断增量式迁移）
            //无需做任何事情，就y已经把数据迁移过来了
//            [migration enumerateObjects:@"Migration"  block:^(RLMObject * _Nullable oldObject, RLMObject * _Nullable newObject) {
////                newObject[@"fullName"] = [NSString stringWithFormat:@"%@%@",oldObject[@"preName"],oldObject[@"lastName"]];
////                newObject[@"fullName2"] = [NSString stringWithFormat:@"%@",oldObject[@"fullName"]];
//            }];
        }
    }];
    //4.让配置生效
    [RLMRealmConfiguration setDefaultConfiguration:config];

    //5.如果需要立即迁移（只需要访问）
    [RLMRealm defaultRealm];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    Migration *model = [[Migration alloc] init];
    model.age = 10;
//    model.preName = @"xx";
//    model.lastName = @"123";
//    model.fullName = @"lsjdlfasldf";
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:model];
    }];
}

@end
