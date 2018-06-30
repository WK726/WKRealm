//
//  cat.h
//  Realm
//
//  Created by 王开 on 2018/6/29.
//Copyright © 2018年 com.wk. All rights reserved.
//

#import <Realm/Realm.h>

@interface cat : RLMObject
@property int a;
@property int b;
@property NSString *c;
@property NSTimeInterval time; //12121212

//类似swift中的计算属性(格式化后的时间，弱业务逻辑)
@property NSString *timeFormat;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<cat *><cat>
RLM_ARRAY_TYPE(cat)
