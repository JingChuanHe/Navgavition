//
//  SecondViewController.h
//  Navgavition
//
//  Created by 荆传贺 on 16/10/26.
//  Copyright © 2016年 荆传贺. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^SecondController)();

@interface SecondViewController : UIViewController

/** block  */
@property (nonatomic, copy) SecondController  secondBlock;

@end
