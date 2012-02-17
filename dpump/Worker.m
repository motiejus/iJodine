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
#include "common.h"
#include "client.h"
#include "tun.h"

@implementation Worker

@synthesize s;

static void usage() {
    fprintf(stderr, "Quitting in 5 secs\n");
    exit(EXIT_FAILURE);
}

-(id) initWithSettings:(Settings*)settings {
    self = [super init];
    s = settings;
    return self;
}

-(void)backgroundThread:(NSData*)whatever {
    NSLog(@"Settings title: %@", s.title);
    
    int tun_fd;
	int dns_fd;
    
    int max_downstream_frag_size = [s.max_downstream_frag_size intValue];
    const char *nameserv_addr = [s.nameserv_addr UTF8String];
    const char *topdomain_c = [s.topdomain UTF8String];
    int selecttimeout = [s.selecttimeout intValue];
    int lazymode = [s.lazymode intValue];
    int hostname_maxlen = [s.hostname_maxlen intValue];
    const char *password = [s.password UTF8String];
    int raw_mode = [s.raw_mode intValue];
    int autodetect_frag_size = [s.autodetect_frag_size intValue];
    
    char *device = NULL;
    int retval = 0;
    
    if (max_downstream_frag_size < 1 || max_downstream_frag_size > 0xffff) {
		warnx("Use a max frag size between 1 and 65535 bytes.\n");
        usage();
    }

	if (nameserv_addr) {
		client_set_nameserver(nameserv_addr, DNS_PORT);
	} else {
		warnx("No nameserver found - not connected to any network?\n");
        usage();
	}	

        
    char *topdomain = strdup(topdomain_c);
	if (strlen(topdomain) <= 128) {
		if(check_topdomain(topdomain)) {
			warnx("Topdomain contains invalid characters.\n");
			usage();
			/* NOTREACHED */
		}
	} else {
		warnx("Use a topdomain max 128 chars long.\n");
		usage();
		/* NOTREACHED */
	}
    free(topdomain);
    
	client_set_selecttimeout(selecttimeout);
	client_set_lazymode(lazymode);
	client_set_topdomain(topdomain);
	client_set_hostname_maxlen(hostname_maxlen);

    // The part where password length is checked and password possibly read
    client_set_password(password);
    
	if ((tun_fd = open_tun(device)) == -1) {
		goto cleanup1;
	}
	if ((dns_fd = open_dns(0, INADDR_ANY)) == -1) {
		goto cleanup2;
	}
    
    // TODO: install signal handlers
    
    fprintf(stderr, "Sending DNS queries for %s to %s\n",
            topdomain, nameserv_addr);
    
	if (client_handshake(dns_fd, raw_mode, autodetect_frag_size, max_downstream_frag_size)) {
		retval = 1;
		goto cleanup2;
	}
    
	if (client_get_conn() == CONN_RAW_UDP) {
		fprintf(stderr, "Sending raw traffic directly to %s\n", client_get_raw_addr());
	}

	fprintf(stderr, "Connection setup complete, transmitting data.\n");

    client_tunnel(tun_fd, dns_fd);

    fprintf(stderr, "Reached end of function control");

cleanup2:
	close_dns(dns_fd);
	close_tun(tun_fd);
cleanup1:
    
    usage();
    return;
}
@end
