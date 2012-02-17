//
//  AppDelegate.h
//  dpump
//
//  Created by Motiejus on 16/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StartPg.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    StartPg *startPage;
}

@property (nonatomic, retain) StartPg *startPage;
@property (strong, nonatomic) UIWindow *window;
@end
