//
//  GameViewController.m
//  netewaikenai
//
//  Created by kixixixixi on 2014/05/24.
//  Copyright (c) 2014年 kixixixixi. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //背景色を指定
    
    self.view.backgroundColor = [UIColor colorWithRed:0.2 green:1.0 blue:0.2 alpha:1.0];
    
    //ひよこを１０匹表示
    // →viewWillAppear
    
    //数えるボタンを作る
    // - スタートボタンと同じに。
    
    for (int i = 0; i < 2; i++) {
        UIImageView *toolBtn = [[UIImageView alloc]init];
        toolBtn.backgroundColor = [UIColor colorWithRed:1.0 green:0.5 blue:0 alpha:1.0];
        toolBtn.frame = CGRectMake(100 + i*80, self.view.frame.size.height -100, 60, 60);
        toolBtn.layer.cornerRadius = 10;
        toolBtn.clipsToBounds = YES;
        toolBtn.tag = 101 +i;
        toolBtn.userInteractionEnabled = YES;
        [toolBtn addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)]];
        [self.view addSubview:toolBtn];
        
        UILabel *btnLabel = [[UILabel alloc]init];
        btnLabel.backgroundColor = [UIColor clearColor];
        btnLabel.textColor = [UIColor whiteColor];
        btnLabel.font = [UIFont boldSystemFontOfSize:50];
        btnLabel.frame = CGRectMake(0, 0, 60, 60);
        btnLabel.textAlignment = NSTextAlignmentCenter;
        switch (i) {
            case 0:
                btnLabel.text = @"↑";
                break;
            case 1:
                btnLabel.text = @"↓";
                break;
                
        }
        [toolBtn addSubview:btnLabel];
        
        CALayer *border = [CALayer layer];
        border.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4].CGColor;
        border.frame = CGRectMake(0, 56, 60, 4);
        [toolBtn.layer addSublayer:border];
    }
    
    
    
    //labelの表示
    // userの数えた数を表示
    
    countLabel = [[UILabel alloc]init];
    countLabel.text = @"０匹";
    countLabel.frame = CGRectMake(0, 20, 320, 40);
    countLabel.font = [UIFont boldSystemFontOfSize:20];
    countLabel.textColor = [UIColor grayColor];
    countLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:countLabel];
    
    userCount = 0;
    
    
    // --- ここかく ---
    // viewDidLoadです
    // timer Label
    // UILabel *timerLabel;を.hで定義してください！
    timerCount = 5;//制限時間の設定。５秒　いつもどおりのやつなので好きな書き方でおっけーです。
    
    timerLabel = [[UILabel alloc]init];
    timerLabel.text = [NSString stringWithFormat:@"あと%d秒", timerCount];
    timerLabel.frame = CGRectMake(0, 60, 320, 30);
    timerLabel.font = [UIFont boldSystemFontOfSize:16];
    timerLabel.textColor = [UIColor whiteColor];
    timerLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:timerLabel];
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    //表示される直前
    hiyokoArray = [[NSMutableArray alloc]init];//配列の生成！ここ大事
    
    //ひよこの数をランダムに
    hiyokoAmount = arc4random() % 10 + 5;
    
    for (int i = 0; i < hiyokoAmount; i++ ) {
        UIImageView *hiyoko = [[UIImageView alloc]init];
        hiyoko.image = [UIImage imageNamed:@"hiyo.png"];
        //位置の指定
        int rnd = (arc4random() % 8) * 40;
        hiyoko.frame = CGRectMake(320, 20 + rnd, 60, 60);
        [self.view addSubview:hiyoko];
        [hiyokoArray addObject:hiyoko];
    }
}

- (void)tapAction:(UITapGestureRecognizer*)gesture
{
//    if (gesture.view.tag == 101) {
//        userCount++;
//        countLabel.text = [NSString stringWithFormat:@"%d匹", userCount];
//        return;
//    }
//    if (gesture.view.tag == 102) {
//        userCount = userCount > 0 ? userCount - 1 : 0;
//        countLabel.text = [NSString stringWithFormat:@"%d匹", userCount];
//        return;
//    }
    
    if (gesture.view.tag == 101 || gesture.view.tag == 102) {
        
        userCount = gesture.view.tag == 101 ? userCount + 1 :( userCount > 0 ? userCount - 1 : 0);
        countLabel.text = [NSString stringWithFormat:@"%d匹", userCount];
        return;
    }else if(gesture.view.tag == 100){
        
        [self dismissViewControllerAnimated:NO completion:nil];
        //　戻るボタンを押されたとき画面を戻ります
    }
    
    
}
- (void)viewDidAppear:(BOOL)animated
{
    //表示される直後
//    UIImageView *hiyoko = hiyokoArray[0];
//    hiyoko.backgroundColor = [UIColor blackColor];

    //アニメーション
    
    //for文でひよこを１匹つづとりだして
    //それぞれにアニメーションを指定する
//#import <UIKit/UIKit.h>
//    
//    @interface GameViewController : UIViewController
//    
//    {
//        NSMutableArray *hiyokoArray;
//    }
//    
//    @end
    
    for (int i = 0; i < hiyokoArray.count; i++) {
        
        UIImageView *hiyoko = hiyokoArray[i];
        CGFloat delayRnd = (arc4random() % 5) /20.0;
        CGFloat durationRnd = (arc4random() % 5) /20.0 + 1.0;
        
        //ここでそれぞれのひよこにアニメを追加
        [UIImageView
         animateWithDuration: durationRnd//アニメーション時間
         delay: delayRnd//開始の遅延時間
         options:0 //アニメーションオプション
         animations:^{
             //アニメーション後のViewの挙動
             hiyoko.frame = CGRectMake(-120, hiyoko.frame.origin.y, 60, 60);
         }
         completion:nil //終了時のプロセス
         ];
    }
    
    
    //タイマーつくるよー
    // :Timerは画面表示後に開始したいので viewDidAppearで規定
    // NSTimer = 数秒後に処理を行うことを規定するメゾット
    // 1. １秒ごとに呼び出して残り時間を減らす
    // 2. 残り時間が0になったらゲームを終了して結果を表示します
    
    //1. タイマーを作成
    timerCount = 5; //5秒が制限時間
    NSTimer *gameTimer = [NSTimer
                          scheduledTimerWithTimeInterval:1.0 //何秒ごとに処理がはしるか
                          target:self //メゾットの位置
                          selector:@selector(gameTimerAction:) //呼び出すメゾット
                          userInfo:nil //メゾットに渡す引数
                          repeats:YES //リピートの可否
                          ];
    [gameTimer fire]; // タイマーを開始
}

- (void)gameTimerAction:(NSTimer*)timer
{
    //1秒ごとに走らせたい処理を書きます。
    // int timerCount をグローバルで定義して、動かす！
    if (timerCount > 0) {
        timerCount--;
        timerLabel.text = [NSString stringWithFormat:@"あと%d秒", timerCount];
    }else{
        [timer invalidate]; //タイマーを殺します
        //結果表示の処理をはしらせたい！
        
        //結果画面表示します
        //邪道ですが、時間がないのでUILabelを全画面で表示
        
        UILabel *resultLabel = [[UILabel alloc]init];
        resultLabel.textAlignment = NSTextAlignmentCenter;
        resultLabel.backgroundColor = [UIColor whiteColor];
        //背景色を設定することで違う画面っぽくします
        resultLabel.text = userCount == hiyokoAmount ? @"正解" : @"不正解";
        resultLabel.textColor = [UIColor redColor];
        resultLabel.font = [UIFont boldSystemFontOfSize:30];
        resultLabel.frame = self.view.frame; //画面全体
        resultLabel.alpha = 0; //透明度（0~1）　1が不透明 0が透明
        [self.view addSubview:resultLabel];
        
        
        //戻るボタン
        UIImageView *backBtn = [[UIImageView alloc]init];
        backBtn.backgroundColor = [UIColor colorWithRed:1.0 green:0.66 blue:0.33 alpha:1.0];
        backBtn.frame = CGRectMake(60, self.view.frame.size.height -100, 200, 60);
        [self.view addSubview:backBtn];
        backBtn.clipsToBounds = YES;
        backBtn.layer.cornerRadius = 10;
        UILabel *btnLabel = [[UILabel alloc]init];
        btnLabel.text = @"もどる";
        btnLabel.font = [UIFont systemFontOfSize:20];
        btnLabel.frame = CGRectMake(0, 0, 200, 60);
        btnLabel.textColor = [UIColor whiteColor];
        btnLabel.textAlignment = NSTextAlignmentCenter;
        [backBtn addSubview:btnLabel];
        CALayer *border = [[CALayer alloc]init];
        border.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4].CGColor;
        border.frame = CGRectMake(0, 56, 200, 4);
        [backBtn.layer addSublayer:border];
        backBtn.userInteractionEnabled = YES;
        backBtn.tag = 100;
        UITapGestureRecognizer *backBtnGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [backBtn addGestureRecognizer:backBtnGesture];
        
        [UIImageView animateWithDuration:0.5 delay:0 options:0 animations:^{
            resultLabel.alpha = 1;
        }completion:nil];
        
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
