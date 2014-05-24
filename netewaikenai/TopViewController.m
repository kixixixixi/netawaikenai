//
//  TopViewController.m
//  netewaikenai
//
//  Created by kixixixixi on 2014/05/24.
//  Copyright (c) 2014年 kixixixixi. All rights reserved.
//

#import "TopViewController.h"
#import "GameViewController.h"

@interface TopViewController ()

@end

@implementation TopViewController

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
    
    //背景
    self.view.backgroundColor = [UIColor colorWithRed:0.2 green:1.0 blue:0.2 alpha:1.0];
    
    //ロゴ画像
    // UIImageView = 画像を表示するビュー
    
    UIImageView *logo = [[UIImageView alloc]init];
    
    //画像の指定
    logo.image = [UIImage imageNamed:@"hiyo.png"];
    
    //場所の指定
    logo.frame = CGRectMake(60, 60, 200, 200);
    
    //画面に追加
    [self.view addSubview:logo];
    
    //タイトル
    UILabel *titleLabel = [[UILabel alloc]init];
    //文字の指定
    titleLabel.text = @"ひよこゲーム";
    //font の指定
    titleLabel.font = [UIFont systemFontOfSize:30];
    //場所の指定
    titleLabel.frame = CGRectMake(0, 10, 320, 60);
    //文字色の指定
    titleLabel.textColor = [UIColor whiteColor];
    //もじそろえの指定
    titleLabel.textAlignment = NSTextAlignmentCenter;
    //追加
    [self.view addSubview:titleLabel];
    
    //スタートボタン
    
    UIImageView *startBtn = [[UIImageView alloc]init];
    startBtn.backgroundColor = [UIColor colorWithRed:1.0 green:0.66 blue:0.33 alpha:1.0];
    startBtn.frame = CGRectMake(60, 320, 200, 60);
    [self.view addSubview:startBtn];
    
    //ボタンっぽくするために
    
    //角丸に
    startBtn.clipsToBounds = YES;
    startBtn.layer.cornerRadius = 10;
    
    //文字を入れる
    // UILabelをつくってそれを追加します
    UILabel *btnLabel = [[UILabel alloc]init];
    //文字の指定
    btnLabel.text = @"はじめる";
    //font の指定
    btnLabel.font = [UIFont systemFontOfSize:20];
    //btnLabel.font = [UIFont fontWithName:@"country" size:20];
    //場所の指定
    btnLabel.frame = CGRectMake(0, 0, 200, 60);
    //文字色の指定
    btnLabel.textColor = [UIColor whiteColor];
    //もじそろえの指定
    btnLabel.textAlignment = NSTextAlignmentCenter;
    //追加
    [startBtn addSubview:btnLabel];
    
    
    //影をいれる
    //暗いビューをつくって下の方に貼付ける
    CALayer *border = [[CALayer alloc]init];
    border.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4].CGColor;
    border.frame = CGRectMake(0, 56, 200, 4);
    [startBtn.layer addSublayer:border];
    
    //押したときに処理する
    //おせるようにする
    startBtn.userInteractionEnabled = YES;
    
    //なにが押されたのか判別する識別子をつける
    startBtn.tag = 100;
    
    //押したときの処理メゾットを指定する
    UITapGestureRecognizer *startBtnGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [startBtn addGestureRecognizer:startBtnGesture];
    
    //処理
    //----ここまでviewDidLoad:----
}

//---ここは自分で定義したデリゲート（メゾット）
- (void)tapAction:(UIGestureRecognizer*)gesture
{
    //ここでやらなきゃならんこと
    // 1.なにをおしたか判別 => tagを使う
    // gesuture.view = 押されたビュー
    if (gesture.view.tag == 100) {
        // 2.おされたときの処理
        //ここにかく！
        //画面の生成
        GameViewController *gameViewCtr = [[GameViewController alloc]init];
        //画面遷移します
        [self presentViewController:gameViewCtr animated:NO completion:nil];
    }
    
    
    return;
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
