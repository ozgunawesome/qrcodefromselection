//
//  selectedtexttoqrcode.m
//  selectedtexttoqrcode
//
//  Created by oz on 7/14/22.
//

#import "selectedtexttoqrcode.h"

@implementation selectedtexttoqrcode

// This implements the example protocol. Replace the body of this class with the implementation of this service's protocol.
- (void)upperCaseString:(NSString *)aString withReply:(void (^)(NSString *))reply {
    NSString *response = [aString uppercaseString];
    reply(response);
}

@end
