//
//  xxx.h
//  Realm
//
//  Created by 王开 on 2018/6/28.
//Copyright © 2018年 com.wk. All rights reserved.
//

#import <Realm/Realm.h>

@interface xxx : RLMObject
@property NSString *xxx;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<xxx *><xxx>
RLM_ARRAY_TYPE(xxx)
