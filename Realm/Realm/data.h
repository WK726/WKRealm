//
//  data.h
//  Realm
//
//  Created by 王开 on 2018/6/30.
//Copyright © 2018年 com.wk. All rights reserved.
//

#import <Realm/Realm.h>

@interface data : RLMObject
@property int a;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<data *><data>
RLM_ARRAY_TYPE(data)
