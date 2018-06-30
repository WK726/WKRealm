//
//  relation.m
//  RealmTests
//
//  Created by 王开 on 2018/6/28.
//  Copyright © 2018年 com.wk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Realm/Realm.h>
#import "person.h"
#import "dog.h"
@interface relation : XCTestCase

@end

@implementation relation


- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    person *p = [[person alloc] init];
    p.num = 1;
    p.name = @"sz";
    dog *pet = [dog new];
    pet.num = 1;
    pet.name = @"清风";
    
    dog *pet1 = [dog new];
    pet1.num = 2;
    pet1.name = @"清";
    
    dog *pet2 = [dog new];
    pet2.num = 3;
    pet2.name = @"风";
    [p.pets addObject:pet];
    [p.pets addObject:pet1];
    [p.pets addObject:pet2];

    RLMRealm *relm = [RLMRealm defaultRealm];
    [relm transactionWithBlock:^{
        [relm addObject:p];
    }];
    
    person *res = [person allObjects].firstObject;
    NSLog(@"%@",res.pets.firstObject.master);
}

@end
