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
    [self performSelectorOnMainThread:@selector(addSomeText:)
                           withObject:@"Labas"
                        waitUntilDone:YES];
}

-(void)addSomeText:(NSString *)text {
    NSLog(@"Received: %@", text);
}


@end
