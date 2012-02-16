//
//  AppDelegate.h
//  dpump
//
//  Created by Motiejus on 16/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StartPage.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    StartPage *startPage;
}

@property (nonatomic, retain) StartPage *startPage;
@property (strong, nonatomic) UIWindow *window;
@end
