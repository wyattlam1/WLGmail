//
//  WLGmail.m
//  WLGmail
//
//  Created by Wyatt Lam on 9/6/14.
//  Copyright (c) 2014 WyattLam. All rights reserved.
//

#import "WLGmailService.h"
#import "WLGmailMessage.h"
#import "GTMOAuth2Authentication.h"
#import "GTMOAuth2ViewControllerTouch.h"
#import "GTLGmail.h"

@interface WLGmailService()
@property (nonatomic, readonly) GTLServiceGmail *service;
@end

@implementation WLGmailService

static NSString *const CLIENT_ID = @"186276393028-h84qv12meolpht4sa003csrlt74sldhj.apps.googleusercontent.com";
static NSString *const CLIENT_SECRET = @"KqRG4g83Xtq_-twoLoBFz171";
static NSString *const kKeychainItemName = @"zaizaiwyatt";

- (instancetype)init
{
    self = [super init];
    if (self) {
        GTMOAuth2Authentication *auth = [GTMOAuth2ViewControllerTouch authForGoogleFromKeychainForName:kKeychainItemName clientID:CLIENT_ID clientSecret:CLIENT_SECRET];
        _service = [GTLServiceGmail new];
        _service.authorizer = auth;
    }
    return self;
}

- (void)sendEmail:(WLGmailMessage *)message completionBlock:(void (^)(NSError *))completionBlock
{
    GTLGmailMessage *gtlGmailMessage = [[GTLGmailMessage alloc] init];
    gtlGmailMessage.raw = message.rawString;
    
    // upload parameter
    //    GTLUploadParameters *upParam = [GTLUploadParameters uploadParametersWithData:GTLDecodeWebSafeBase64(messageRawStr) MIMEType:@"message/rfc822"];
    
    // query
    GTLQueryGmail *query = [GTLQueryGmail queryForUsersMessagesSendWithUploadParameters:nil];
    query.message = gtlGmailMessage;
    [_service executeQuery:query completionHandler:^(GTLServiceTicket *ticket, id object, NSError *error) {
        if (error) {
            NSLog(@"ERROR: %@", error);
        } else {
            NSLog(@"SENT EMAIL");
        }
        completionBlock(error);
    }];
    
}

@end
