//
//  LogWatcher.m
//  dpump
//
//  Created by Motiejus on 17/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LogWatcher.h"

@implementation LogWatcher

@synthesize textView;

-(void)backgroundThread:(UITextView*)tv {    
    textView = tv;
    
    int fd[2];
    // data written to fd[1] appears on fd[0]
    pipe(fd);
    //dup2(fd[1], 2); // stderr to our internal pipe
    
    char buf[4096];
    int len;
    while((len = read(fd[0], buf, 4095)) >= 0) {
        buf[len] = '\0';
        NSString *str = [[NSString alloc] initWithUTF8String:buf];

        [self performSelectorOnMainThread:@selector(addSomeText:)
                               withObject:str
                            waitUntilDone:YES];
    }
    NSLog(@"Stopping LogWatcher");
}

-(void)addSomeText:(NSString *)text {
    textView.text = [NSString stringWithFormat:@"%@ %@", textView.text, text];
}

@end
