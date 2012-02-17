//
//  Worker.h
//  dpump
//
//  Created by Motiejus on 17/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Settings.h"

@interface Worker : NSObject
{
    Settings *s;
}
-(void)backgroundThread:(NSData*)whatever;
-(id) initWithSettings:(Settings*)settings;

@property (nonatomic, retain) Settings *s;

@end