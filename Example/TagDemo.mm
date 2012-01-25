//
//  TagDemo.m
//  libid3
//
//  Created by 徐 楽楽 on 12/01/25.
//  Copyright (c) 2012年 ラクラクテクノロジーズ. All rights reserved.
//

#import "TagDemo.h"
#import <id3/tag.h>

@implementation TagDemo

- (void)demo {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"amazing-grace-10s" ofType:@"mp3"];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"amazing-grace-10s.mp3"];

    [[NSFileManager defaultManager] copyItemAtPath:path toPath:docPath error:nil];
    
    ID3_Tag tag;
    tag.Link([docPath UTF8String]);
    tag.Strip(ID3TT_ALL);
    tag.Clear();
    
    ID3_Frame frame;
    frame.SetID(ID3FID_TITLE);
    frame.GetField(ID3FN_TEXTENC)->Set(ID3TE_UNICODE);
    frame.GetField(ID3FN_TEXT)->Set((unicode_t *) [@"賛美歌「アメイジング グレイス」 - Amazing Grace" cStringUsingEncoding:NSUTF16StringEncoding]);

    tag.AddFrame(frame);

    tag.SetPadding(false);
    tag.SetUnsync(false);
    tag.Update(ID3TT_ID3V2);
}

@end
