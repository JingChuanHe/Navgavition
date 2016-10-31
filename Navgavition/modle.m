
//
//  modle.m
//  Navgavition
//
//  Created by 荆传贺 on 16/10/30.
//  Copyright © 2016年 荆传贺. All rights reserved.
//

#import "modle.h"

@implementation modle

- (id)initWithDic:(NSDictionary *)dic{

    self = [super init];
    if (self == nil) {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

    NSLog(@"undefine key --%@",key);
}

@end
