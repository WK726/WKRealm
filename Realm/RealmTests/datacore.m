//
//  datacore.m
//  RealmTests
//
//  Created by 王开 on 2018/6/30.
//  Copyright © 2018年 com.wk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "data.h"
#import "dog.h"
@interface datacore : XCTestCase

@end

@implementation datacore
- (void)testExample {
    [self setDeafultRelmForUser:@"王开"];
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    data *da = [data new];
    da.a = 10;
    [realm transactionWithBlock:^{
        [realm addObject:da];
    }];
    
    [self setDeafultRelmForUser:@"里斯"];
    RLMRealm *realm1 = [RLMRealm defaultRealm];
    
    data *da1 = [data new];
    da1.a = 10;
    [realm1 transactionWithBlock:^{
        [realm1 addObject:da1];
    }];
}
- (void)setDeafultRelmForUser:(NSString *)username
{
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    //是用默认目录,但是使用用户名来替换默认的文件名
    config.fileURL = [[[config.fileURL URLByDeletingLastPathComponent]  URLByAppendingPathComponent:username] URLByAppendingPathExtension:@"realm"];
    //配置到默认的 realm数据库中
    [RLMRealmConfiguration setDefaultConfiguration:config];
    
}

- (void)testReadOnly{
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    //制度模式打开
    config.readOnly = YES;
    //通过配置打开数据库
    RLMRealm *realm = [RLMRealm realmWithConfiguration:config error:nil];
}

- (void)testDelete{
    [self setDeafultRelmForUser:@"zhangsan"];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    NSArray<NSURL *>*realmFileURLS = @[config.fileURL,
                                       [config.fileURL URLByAppendingPathExtension:@"lock"],
                                       [config.fileURL URLByAppendingPathExtension:@"log_a"],
                                       [config.fileURL URLByAppendingPathExtension:@"log_b"],
                                       [config.fileURL URLByAppendingPathExtension:@"note"]
                                       ];
    for (NSURL *url in realmFileURLS) {
        NSError *error = nil;
        [manager removeItemAtURL:url error:&error];
    }
}
@end
