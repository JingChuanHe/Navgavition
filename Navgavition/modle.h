//
//  modle.h
//  Navgavition
//
//  Created by 荆传贺 on 16/10/30.
//  Copyright © 2016年 荆传贺. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface modle : NSObject
/** shuzu  */
@property (nonatomic, copy) NSArray  *name;

/** kebina  */
@property (nonatomic, copy) NSMutableArray  *modleArray;

- (id)initWithDic:(NSDictionary *)dic;
@end
