//
//  WKStu.h
//  Realm
//
//  Created by 王开 on 2018/6/26.
//Copyright © 2018年 com.wk. All rights reserved.
//

#import <Realm/Realm.h>
#import <UIKit/UIKit.h>
#import "xxx.h"
@interface WKStu : RLMObject

@property int num;
@property NSString *name;
@property (readonly) UIImage *image;
@property NSData *imageData;
//RLMArray里面存储的属性，必须继承字RLMObject类型的属性
@property RLMArray <xxx*><xxx>*arrays;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<WKStu *><WKStu>
RLM_ARRAY_TYPE(WKStu)
