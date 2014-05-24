//
//  GameViewController.h
//  netewaikenai
//
//  Created by kixixixixi on 2014/05/24.
//  Copyright (c) 2014年 kixixixixi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController

{
    NSMutableArray *hiyokoArray;
    
    int userCount;
    
    int hiyokoAmount;
    
    UILabel *countLabel;
    
    int timerCount;
    
    UILabel *timerLabel;
}

@end
