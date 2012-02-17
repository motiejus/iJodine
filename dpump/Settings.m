//
//  Settings.m
//  dpump
//
//  Created by Motiejus on 16/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Settings.h"

@implementation Settings

@synthesize title;

@synthesize nameserv_addr, topdomain, username, password, max_downstream_frag_size;
@synthesize autodetect_frag_size, raw_mode, lazymode, selecttimeout, hostname_maxlen;

-(id) init {
    self = [super init];
    
    nameserv_addr = NULL;
	topdomain = NULL;
	username = NULL;
    password = [[NSString alloc] initWithString:@"\0"];
    
	autodetect_frag_size = [[NSNumber alloc] initWithInt:1];
	max_downstream_frag_size = [[NSNumber alloc] initWithInt:3072];
	raw_mode = [[NSNumber alloc] initWithInt:1];
	lazymode = [[NSNumber alloc] initWithInt:1];
	selecttimeout = [[NSNumber alloc] initWithInt:4];
	hostname_maxlen = [[NSNumber alloc] initWithInt:0xFF];

    return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:nameserv_addr forKey:@"nameserv_addr"];
    [encoder encodeObject:topdomain forKey:@"topdomain"];
    [encoder encodeObject:username forKey:@"username"];
    [encoder encodeObject:password forKey:@"password"];
    [encoder encodeObject:max_downstream_frag_size forKey:@"max_downstream_frag_size"];
    [encoder encodeObject:autodetect_frag_size forKey:@"autodetect_frag_size"];
    [encoder encodeObject:raw_mode forKey:@"raw_mode"];
    [encoder encodeObject:lazymode forKey:@"lazymode"];
    [encoder encodeObject:selecttimeout forKey:@"selecttimeout"];
    [encoder encodeObject:hostname_maxlen forKey:@"hostname_maxlen"];
}

-(id)initWithCoder:(NSCoder *)decoder {
    if ((self=[Settings init])) {
        nameserv_addr = [decoder decodeObjectForKey:@"nameserv_addr"];
        topdomain = [decoder decodeObjectForKey:@"topdomain"];
        username = [decoder decodeObjectForKey:@"username"];
        password = [decoder decodeObjectForKey:@"password"];
        max_downstream_frag_size = [decoder decodeObjectForKey:@"max_downstream_frag_size"];
        autodetect_frag_size = [decoder decodeObjectForKey:@"autodetect_frag_size"];
        raw_mode = [decoder decodeObjectForKey:@"raw_mode"];
        lazymode = [decoder decodeObjectForKey:@"lazymode"];
        selecttimeout = [decoder decodeObjectForKey:@"selecttimeout"];
        hostname_maxlen = [decoder decodeObjectForKey:@"hostname_maxlen"];
        }
    return self;
    }

@end
