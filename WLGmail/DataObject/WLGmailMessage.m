//
//  WLGmailMessage.m
//  WLGmail
//
//  Created by Wyatt Lam on 9/7/14.
//  Copyright (c) 2014 WyattLam. All rights reserved.
//

#import "WLGmailMessage.h"
#import "WLGmailAddress.h"
#import "GTLBase64.h"

@implementation WLGmailMessage

- (instancetype)initWithFromAddress:(WLGmailAddress *)fromAddress to:(WLGmailAddress *)toAddress
{
    return [[WLGmailMessage alloc] initWithSubject:nil body:nil from:fromAddress to:toAddress];
}

- (instancetype)initWithSubject:(NSString *)subject body:(NSString *)body from:(WLGmailAddress *)fromAddress to:(WLGmailAddress *)toAddress
{
    return [[WLGmailMessage alloc] initWithSubject:subject body:body from:fromAddress to:toAddress cc:nil bcc:nil];
}

- (instancetype)initWithSubject:(NSString *)subject body:(NSString *)body from:(WLGmailAddress *)fromAddress to:(WLGmailAddress *)toAddress cc:(WLGmailAddress *)ccAddress bcc:(WLGmailAddress *)bccAddress
{
    self = [super init];
    if (self) {
        _subject = subject;
        _body = body;
        _fromAddress = fromAddress;
        _toAddress = toAddress;
        _ccAddress = ccAddress;
        _bccAddress = bccAddress;
    }
    return self;
}

- (NSString *)rawString
{
    NSMutableString *message = [NSMutableString new];
    [message appendFormat:@"From: %@\n", [_fromAddress rawString]];
    [message appendFormat:@"To: %@\n", [_toAddress rawString]];
    [message appendFormat:@"Subject: %@\n", _subject];
    [message appendFormat:@"Date: %@\n", [self _formattedDate]];
#warning input real ID
    [message appendString:@"Message-ID: <tmpID>\n"];
    [message appendString:@"\n"];
    [message appendString:_body];
    return GTLEncodeWebSafeBase64([message dataUsingEncoding:NSUTF8StringEncoding]);
}

#pragma mark - Private

- (NSString *)_formattedDate
{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"EEE, dd MMM yyyy HH:mm:ss Z"; //RFC2822-Format
    return [dateFormatter stringFromDate:[NSDate date]];
}


@end
