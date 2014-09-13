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
#import "GTLGmail.h"

@interface WLGmailService()
@property (nonatomic, readonly) GTLServiceGmail *service;
@end

@implementation WLGmailService

- (instancetype)initWithEmailAddress:(NSString *)emailAddress authorizer:(GTMOAuth2Authentication *)auth
{
    self = [super init];
    if (self) {
        _service = [GTLServiceGmail new];
        _service.authorizer = auth;
    }
    return self;
}

#pragma mark - Public Methods

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
