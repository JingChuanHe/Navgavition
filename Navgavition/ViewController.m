//
//  ViewController.m
//  Navgavition
//
//  Created by 荆传贺 on 16/10/26.
//  Copyright © 2016年 荆传贺. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "JHNav.h"
#import <AVFoundation/AVFoundation.h>
#import "JHMusic.h"
#import "modle.h"

#define ScrW [UIScreen mainScreen].bounds.size.width
#define ScrH [UIScreen mainScreen].bounds.size.height


@interface ViewController ()

/**   yinqin  */
@property (nonatomic, strong) AVAudioPlayer  *player;
/** time  */
@property (nonatomic, copy) UILabel  *currentTime;

@property (strong, nonatomic)  UISlider *progressSlider;

/* 定时器 */
@property (nonatomic, strong) NSTimer *progressTimer;

/** modle  */
@property (nonatomic, retain) modle  *modle;

/**   button */
@property (nonatomic, strong) UIButton *button;



@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.navigationItem.title = @"jinghe";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self creatUI];
    NSDictionary *dic = [NSDictionary dictionaryWithObject:[NSMutableArray arrayWithCapacity:0] forKey:@"modleArray"];
    
    self.modle = [[modle alloc] initWithDic:dic];
    [self testdic];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

//    [self changeArray];
    
    [self fi_le];
    
    
}
- (void)fi_le{

    
    
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory
                                                       , NSUserDomainMask
                                                       , YES);
    NSLog(@"Get document path: %@",[paths objectAtIndex:0]);
    
    NSString *fileName=[[paths objectAtIndex:0] stringByAppendingPathComponent:@"myFile.plist"];

    
    NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:fileName,@"IP",nil]; //写入数据
    
    if ([dic writeToFile:fileName atomically:YES]) {
        NSLog(@">>write ok.");
    }
    
    NSDictionary* dic2 = [NSDictionary dictionaryWithContentsOfFile:fileName];// 读取数据
    NSLog(@"dic is:%@",dic2);

}

- (void)changeArray{

    NSString *str = @"0009990";
    [[_modle mutableSetValueForKeyPath:@"modleArray"] addObject:str];
    
}

- (void)testdic{

    [_modle addObserver:self forKeyPath:@"modleArray" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    
//    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    [dic setValue:@"11" forKey:@"jingf"];
//    [dic setValue:@"22" forKey:@"ss"];
//    
//    NSMutableArray *array = [NSMutableArray arrayWithObject:dic];
//    
//    
//    
//
//    NSLog(@"dic:%@---array:%@",dic,array);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{

    NSLog(@"Observe _modle:%@",_modle);
    

}
- (void) creatUI{
    
    
    CGFloat buttonX = ScrW * 0.5;
    CGFloat buttonY = ScrH * 0.5;    
    CGRect buttonFrame = CGRectMake(buttonX  - 125, buttonY, 250, 50);
    UIButton *button = [[UIButton alloc] initWithFrame:buttonFrame];
    button.backgroundColor = [UIColor brownColor];
    [button setTitle:@"English" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(goNestVc) forControlEvents:UIControlEventTouchUpInside];
    self.button = button;
    [self.view addSubview:button];
    
    CGRect playButtonFrame = CGRectMake(20, 80, 50, 20);
    UIButton *playButton = [[UIButton alloc] initWithFrame:playButtonFrame];
    [playButton setTitle:@"播放" forState:UIControlStateNormal];
    playButton.backgroundColor = [UIColor brownColor];
    [playButton addTarget:self action:@selector(playAudio) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playButton];
    
    CGRect pauseButtonFrame = CGRectMake(20, 110, 50, 20);
    UIButton *pauseButton = [[UIButton alloc] initWithFrame:pauseButtonFrame];
    [pauseButton setTitle:@"暂停" forState:UIControlStateNormal];
    pauseButton.backgroundColor = [UIColor brownColor];
    [pauseButton addTarget:self action:@selector(pauseAudio) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pauseButton];

    CGRect stopButtonFrame = CGRectMake(20, 140, 50, 20);
    UIButton *stopButton = [[UIButton alloc] initWithFrame:stopButtonFrame];
    [stopButton setTitle:@"停止" forState:UIControlStateNormal];
    stopButton.backgroundColor = [UIColor brownColor];
    [stopButton addTarget:self action:@selector(stopAudio) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopButton];
    
    CGRect currentTimeFrame = CGRectMake(150, 80, 50, 20);
    _currentTime = [[UILabel alloc] initWithFrame:currentTimeFrame];
    _currentTime.backgroundColor = [UIColor grayColor];
    [_currentTime setTextColor:[UIColor greenColor]];
    _currentTime.text = @"00:00";
    [self.view addSubview:_currentTime];
    
    CGRect nextButtonFrame = CGRectMake(20, 170, 50, 20);
    UIButton *nextButton = [[UIButton alloc] initWithFrame:nextButtonFrame];
    [nextButton setTitle:@"下首" forState:UIControlStateNormal];
    nextButton.backgroundColor = [UIColor brownColor];
    [nextButton addTarget:self action:@selector(nextButtonAudio) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextButton];

    
    
}

- (void)goNestVc{

    SecondViewController *svc = [[SecondViewController alloc] init];
    
    svc.secondBlock = ^(){
        
        NSLog(@"First->Second");
        
        [self.button setTitle:@"23" forState:UIControlStateNormal];
        
        
    };
    
    [self.navigationController pushViewController:svc animated:YES];
    
}

- (void)nextButtonAudio{

    [JHMusic playMusicWithMusicName:@"2015.6.1.mp3"];

}

- (void)pauseAudio{

    [JHMusic pauseMusicWithMusicName:@"BBC.mp3"];
}
- (void)playAudio{
    

    
    [JHMusic playMusicWithMusicName:@"BBC.mp3"];
    
//    self.currentTime.text = [NSString stringWithFormat:@"%.2zd",self.player.currentTime];
    
}

- (void)stopAudio{

    [JHMusic stopMusicWithMusicName:@"BBC.mp3"];
}

- (void)addProgressTimer
{
//    self.progressTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateProgressInfo) userInfo:nil repeats:YES];
//    [[NSRunLoop mainRunLoop] addTimer:self.progressTimer forMode:NSRunLoopCommonModes];
}

- (void)updateProgressInfo
{
    // 1.更新时间
//    self.currentTime.text = [self timeString];
    
    // 2.设置进度条的value
//    self.progressSlider.value = CMTimeGetSeconds(self.player.currentTime) / CMTimeGetSeconds(self.player.currentItem.duration);
}
//- (NSString *)timeString
//{
//    NSTimeInterval duration = CMTimeGetSeconds(self.player.currentItem.duration);
//    NSTimeInterval currentTime = CMTimeGetSeconds(self.player.currentTime);
//    
//    return [self stringWithCurrentTime:currentTime duration:duration];
//}
- (AVAudioPlayer *)player{
    
    if (_player == nil) {
        
        
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"BBC.mp3" withExtension:nil];
        
        NSError *error = nil;
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        
        [self.player prepareToPlay];
        
    }
    
    return _player;
}

- (void)dealloc{
    
    if (_modle != nil) {
        [_modle removeObserver:self forKeyPath:@"modleArray"];
    }
    
}
@end









