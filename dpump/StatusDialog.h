//
//  StatusDialog.h
//  dpump
//
//  Created by Motiejus on 17/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LogWatcher.h"

@interface StatusDialog : UIViewController<NSPortDelegate>
{
    UITextView *textView;
    LogWatcher *logWatcher;
}

@property (nonatomic, retain) LogWatcher *logWatcher;
@property (nonatomic, retain) IBOutlet UITextView *textView;

@end
