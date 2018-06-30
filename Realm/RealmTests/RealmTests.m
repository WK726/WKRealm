//
//  RealmTests.m
//  RealmTests
//
//  Created by 王开 on 2018/6/26.
//  Copyright © 2018年 com.wk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WKStu.h"
#import <Realm/Realm.h>
@interface RealmTests : XCTestCase

@end

@implementation RealmTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testSaveModel{
//    WKStu *stu = [[WKStu alloc] initWithValue:@[@2,@"土豆"]];
    
    RLMRealm *realm = [RLMRealm defaultRealm];
//    [realm beginWriteTransaction];
//    [realm addObject:stu];
//    [realm commitWriteTransaction];
    [realm transactionWithBlock:^{
//        [realm addObject:stu];
        [WKStu createInRealm:realm withValue:@{@"num":@22,@"name":@"王开"}];
    }];
     
}

- (void)testUpdate{
    WKStu *stu = [[WKStu alloc] initWithValue:@[@2,@"土豆"]];
    RLMRealm *realm = [RLMRealm defaultRealm];
    //方式3
    [realm transactionWithBlock:^{
//        [realm addOrUpdateObject:stu];
        [WKStu createOrUpdateInRealm:realm withValue:@[@2,@"土豆2"]];
    }];
    //方式1
    //stu ，已经被realm所管理，而且，已经和磁盘上的对象，进行地址映射
//    [realm transactionWithBlock:^{
//        [realm addObject:stu];
//    }];
//    //这里的模型，一定是被realm管理的模型
//    [realm transactionWithBlock:^{
//        stu.name = @"王二小在山边吃草";
//    }];
    
    //方式2
//    RLMResults *reslut = [WKStu objectsWhere:@"name = '王二小'"];
//    WKStu *stu = reslut.firstObject;
//    [realm transactionWithBlock:^{
//        stu.name = @"王二";
//    }];

}

- (void)testDeleteModel{
    RLMRealm *realm = [RLMRealm defaultRealm];
//    RLMResults *results = [WKStu objectsWhere:@"name = '王二小'"];
//    WKStu *stu = results.firstObject;
    //删除的模型，一定要是呗realm所管理的
    [realm transactionWithBlock:^{
//        [realm deleteObject:stu];
        [realm deleteAllObjects];
    }];
    
    RLMResults *res = [WKStu allObjects];
    for (WKStu *stu in res) {
        [realm transactionWithBlock:^{
            [realm deleteObject:stu];
        }];
    }
    
    //根据主键删除一个模型
    WKStu *stuOel = [WKStu objectInRealm:realm forPrimaryKey:@2];
    [realm transactionWithBlock:^{
        [realm deleteObject:stuOel];
    }];
}

- (void)textQuery
{
    //所有的查询（包括查询查询和属性访问）在realm中是延迟加载的，只有当属性呗访问时，才能都读区相应的数据
    RLMResults *stuRes = [WKStu allObjects];
    WKStu *stu = [[WKStu alloc] initWithValue:@[@3,@"土豆"]];
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:stu];
    }];
    //RLMResults 是顺时变化的
    NSLog(@"%@",stuRes);
    
}

- (void)testQuery2{
    RLMResults<WKStu *> *stus = [WKStu objectsWhere:@"num > 1"];
    
    NSLog(@"%@",stus);
    RLMResults *sort = [stus sortedResultsUsingKeyPath:@"name" ascending:YES];
    NSLog(@"%@",stus);
    RLMResults *subStus = [stus objectsWhere:@"num > 2"];
    [subStus objectsWhere:@"num > 3"];
    
    //sql 分页加载（其实就是懒加载RLMResults里的数据）
    //第一个参数：跳过几条
    //第二个参数：取多少条
    //select *from stu limit 3，3
    RLMResults *stuRes = [WKStu allObjects];
    for (int i = 3; i <= 6; i++) {
        WKStu *stu = stuRes[i];
    }
}
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
