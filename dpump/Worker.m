//
//  Worker.m
//  dpump
//
//  Class which encapsulates the main worker background application
//
//  Created by Motiejus on 17/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Worker.h"

@implementation Worker

@synthesize settings;

-(id) initWithSettings:(Settings*)s {
    self = [super init];
    settings = s;
    return self;
}

-(void)backgroundThread:(NSData*)whatever {
    NSLog(@"Settings title: %@", settings.title);
    /*
    sleep(3);
    for (int i = 0; i <= 10; i++) {
        fprintf(stderr, "Tick %d\n", i);
        sleep(2);
    }
     */
    
}
@end
