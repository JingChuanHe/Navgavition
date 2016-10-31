//
//  SecondViewController.m
//  Navgavition
//
//  Created by 荆传贺 on 16/10/26.
//  Copyright © 2016年 荆传贺. All rights reserved.
//

#import "SecondViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Second Vc";
  
    self.view.backgroundColor = [UIColor blueColor];
    
    if (_secondBlock) {
        _secondBlock();
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"second view controller");
    
    
    
    

}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{

    NSLog(@"New array");

}

@end





