//
//  person.h
//  Realm
//
//  Created by 王开 on 2018/6/28.
//Copyright © 2018年 com.wk. All rights reserved.
//

#import <Realm/Realm.h>
#import "dog.h"
@interface person : RLMObject
@property int num;
@property NSString *name;
//@property dog *pet;
@property RLMArray<dog *><dog>* pets;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<person *><person>
RLM_ARRAY_TYPE(person)
