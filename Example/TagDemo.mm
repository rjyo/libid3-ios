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
    
    NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [[docPaths objectAtIndex:0] stringByAppendingPathComponent:@"amazing-grace-10s.mp3"];

    [[NSFileManager defaultManager] copyItemAtPath:path toPath:docPath error:nil];
    
    // Read title tag
    ID3_Tag tag;
    tag.Link([path UTF8String]);
    
    ID3_Frame *titleFrame = tag.Find(ID3FID_TITLE);
    unicode_t const *value = titleFrame->GetField(ID3FN_TEXT)->GetRawUnicodeText();
    NSString *title = [NSString stringWithCString:(char const *) value encoding:NSUnicodeStringEncoding];
    NSLog(@"The title before is %@", title);


    // Write title tag
    tag.Link([docPath UTF8String]);
    tag.Strip(ID3TT_ALL);
    tag.Clear();
    
    ID3_Frame frame;
    frame.SetID(ID3FID_TITLE);
    frame.GetField(ID3FN_TEXTENC)->Set(ID3TE_UNICODE);
    NSString *newTitle = @"賛美歌「アメイジング グレイス」 - Amazing Grace";
    frame.GetField(ID3FN_TEXT)->Set((unicode_t *) [newTitle cStringUsingEncoding:NSUTF16StringEncoding]);

    tag.AddFrame(frame);

    tag.SetPadding(false);
    tag.SetUnsync(false);
    tag.Update(ID3TT_ID3V2);

    NSLog(@"The title after is %@", newTitle);
}

@end
