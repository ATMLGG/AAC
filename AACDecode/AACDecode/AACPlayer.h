//
//  AACPlayer.h
//  AACDecode
//
//  Created by yyj on 2017/6/12.
//  Copyright © 2017年 yyj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface AACPlayer : NSObject

- (void)play;

- (double)getCurrentTime;

@end
