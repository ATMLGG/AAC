//
//  ViewController.m
//  AACDecode
//
//  Created by yyj on 2017/6/9.
//  Copyright © 2017年 yyj. All rights reserved.
//

#import "ViewController.h"
#import "AACPlayer.h"

@interface ViewController ()

@property (nonatomic , strong) UILabel  *mLabel;
@property (nonatomic , strong) UILabel *mCurrentTimeLabel;
@property (nonatomic , strong) UIButton *mDecodeButton;
@property (nonatomic , strong) CADisplayLink *mDispalyLink;

@end

@implementation ViewController
{
    AACPlayer *player;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 200, 100)];
    self.mLabel.textColor = [UIColor redColor];
    [self.view addSubview:self.mLabel];
    self.mLabel.text = @"测试ACC播放";
    
    self.mCurrentTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 200, 100)];
    self.mCurrentTimeLabel.textColor = [UIColor redColor];
    self.mCurrentTimeLabel.text = @"时间";
    [self.view addSubview:self.mCurrentTimeLabel];
    
    self.mDecodeButton = [[UIButton alloc] initWithFrame:CGRectMake(150, 20, 100, 100)];
    [self.mDecodeButton setTitle:@"play" forState:UIControlStateNormal];
    [self.mDecodeButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:self.mDecodeButton];
    [self.mDecodeButton addTarget:self action:@selector(onDecodeStart) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.mDispalyLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateFrame)];
    self.mDispalyLink.frameInterval = 5; // 默认是30FPS的帧率录制
    [self.mDispalyLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [self.mDispalyLink setPaused:YES];
    
}

- (void)onDecodeStart {
    self.mDecodeButton.hidden = YES;
    [self.mDispalyLink setPaused:NO];
    player = [[AACPlayer alloc] init];
    [player play];
    
}

- (void)updateFrame {
    if (player) {
        self.mCurrentTimeLabel.text = [NSString stringWithFormat:@"当前时间:%.1fs", [player getCurrentTime]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
