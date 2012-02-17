//
//  LogWatcher.h
//  dpump
//
//  Created by Motiejus on 17/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LogWatcher : NSObject
{
    UITextView *textView;
}
-(void)backgroundThread:(UITextView*)whatever;

@property (nonatomic, retain) UITextView *textView;

@end
