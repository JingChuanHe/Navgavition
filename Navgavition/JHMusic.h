//
//  JHMusic.h
//  Navgavition
//
//  Created by 荆传贺 on 16/10/26.
//  Copyright © 2016年 荆传贺. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface JHMusic : NSObject

+ (void)playMusicWithMusicName:(NSString *)musicName;
+ (void)pauseMusicWithMusicName:(NSString *)musicName;
+ (void)stopMusicWithMusicName:(NSString *)musicName;

+ (void)nextMusicWithMusicName:(NSString *)musicName;
@end
