//
//  selectedtexttoqrcode.h
//  selectedtexttoqrcode
//
//  Created by oz on 7/14/22.
//

#import <Foundation/Foundation.h>
#import "selectedtexttoqrcodeProtocol.h"

// This object implements the protocol which we have defined. It provides the actual behavior for the service. It is 'exported' by the service to make it available to the process hosting the service over an NSXPCConnection.
@interface selectedtexttoqrcode : NSObject <selectedtexttoqrcodeProtocol>
@end
