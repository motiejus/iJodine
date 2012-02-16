//
//  Settings.m
//  dpump
//
//  Created by Motiejus on 16/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Settings.h"

#include <pwd.h>


@implementation Settings
@synthesize nameserv_addr, topdomain, username, password, max_downstream_frag_size;
@synthesize autodetect_frag_size, raw_mode, lazymode, selecttimeout, hostname_maxlen;


@end
