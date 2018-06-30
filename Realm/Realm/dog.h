//
//  dog.h
//  Realm
//
//  Created by 王开 on 2018/6/28.
//Copyright © 2018年 com.wk. All rights reserved.
//

#import <Realm/Realm.h>
@interface dog : RLMObject
@property int num;
@property NSString *name;
@property (readonly) RLMLinkingObjects *master;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<dog *><dog>
RLM_ARRAY_TYPE(dog)
