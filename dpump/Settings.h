//
//  Settings.h
//  dpump
//
//  Created by Motiejus on 16/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Settings : NSObject
{
    NSString *nameserv_addr;
	NSString *topdomain;
	NSString *username;
	NSString *password; // length 33!
	NSNumber *max_downstream_frag_size;
	NSNumber *autodetect_frag_size;
	NSNumber *raw_mode;
	NSNumber *lazymode;
	NSNumber *selecttimeout;
	NSNumber *hostname_maxlen;
}
@property (nonatomic, retain) NSString *nameserv_addr;
@property (nonatomic, retain) NSString *topdomain;
@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *password; // length 33!
@property (nonatomic, retain) NSNumber *max_downstream_frag_size;
@property (nonatomic, retain) NSNumber *autodetect_frag_size;
@property (nonatomic, retain) NSNumber *raw_mode;
@property (nonatomic, retain) NSNumber *lazymode;
@property (nonatomic, retain) NSNumber *selecttimeout;
@property (nonatomic, retain) NSNumber *hostname_maxlen;



@end
