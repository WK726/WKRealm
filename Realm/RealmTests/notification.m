//
//  notification.m
//  RealmTests
//
//  Created by 王开 on 2018/6/30.
//  Copyright © 2018年 com.wk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "noticeModel.h"
@interface notification : XCTestCase
@property (nonatomic, strong) RLMNotificationToken *token;
@property (nonatomic, strong) RLMNotificationToken *token2;
@end

@implementation notification

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
//    self.continueAfterFailure = NO;
//
//    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
//    [[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.

    RLMRealm *realm = [RLMRealm defaultRealm];
    self.token = [realm addNotificationBlock:^(RLMNotification  _Nonnull notification, RLMRealm * _Nonnull realm) {
        NSLog(@"监听到修改通知");
    }];
    
//    RLMResults *result = [noticeModel allObjects];
//    self.token2 = [result addNotificationBlock:^(RLMResults * _Nullable results, RLMCollectionChange * _Nullable change, NSError * _Nullable error) {
//        NSLog(@"%@--%@--%@",results,change,error);
//    }];
}

- (void)tearDown {
    [self.token2 invalidate];
}

- (void)testExample {
    noticeModel *noticeM = [[noticeModel alloc] initWithValue:@[@2]];
    RLMRealm *relm = [RLMRealm defaultRealm];
    [relm transactionWithBlock:^{
        [relm addObject:noticeM];
    }];
    
    [relm transactionWithBlock:^{
        [relm addObject:noticeM];
    }];
    
    [relm transactionWithBlock:^{
        [relm deleteObject:noticeM];
    }];
    
}

@end
