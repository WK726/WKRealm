//
//  Migration.h
//  Realm
//
//  Created by 王开 on 2018/6/30.
//Copyright © 2018年 com.wk. All rights reserved.
//

#import <Realm/Realm.h>

@interface Migration : RLMObject
//@property NSString *name;
@property NSInteger age;
//@property NSString *preName;
//@property NSString *lastName;
@property NSString *fullName2;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<Migration *><Migration>
RLM_ARRAY_TYPE(Migration)
