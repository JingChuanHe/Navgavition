//
//  JHMusic.m
//  Navgavition
//
//  Created by 荆传贺 on 16/10/26.
//  Copyright © 2016年 荆传贺. All rights reserved.
//

#import "JHMusic.h"
@interface JHMusic()



@end


@implementation JHMusic

static NSMutableDictionary *_player;

+ (void)initialize
{
    _player = [NSMutableDictionary dictionary];
}

+(void)playMusicWithMusicName:(NSString *)musicName{
    
//    assert(musicName);

    AVAudioPlayer *player = nil;
    
    player = _player[musicName];
    
    
    
    if (player == nil) {
        
        
        NSURL *url = [[NSBundle mainBundle] URLForResource:musicName withExtension:nil];
        
        NSError *error = nil;
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        
        [player prepareToPlay];
        
        [_player setObject:player forKey:musicName];
        
    }

    [player play];
    

}

+ (void)pauseMusicWithMusicName:(NSString *)musicName{

    AVAudioPlayer *player = _player[musicName];
    if (player) {
        
        [player pause];
        
    }
    


}

+ (void)stopMusicWithMusicName:(NSString *)musicName{
    AVAudioPlayer *player = _player[musicName];
    if (player) {
        
        [player stop];
        [_player removeObjectForKey:musicName];
        player = nil;
        
    }

}
+ (void)nextMusicWithMusicName:(NSString *)musicName{

    

}


@end











