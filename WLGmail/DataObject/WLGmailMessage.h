//
//  WLGmailMessage.h
//  WLGmail
//
//  Created by Wyatt Lam on 9/7/14.
//  Copyright (c) 2014 WyattLam. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WLGmailAddress;

@interface WLGmailMessage : NSObject

// data fields
@property (nonatomic, copy, readonly) NSString *subject;
@property (nonatomic, copy, readonly) NSString *body;
@property (nonatomic, readonly) WLGmailAddress *fromAddress;
@property (nonatomic, readonly) WLGmailAddress *toAddress;
@property (nonatomic, readonly) WLGmailAddress *ccAddress;
@property (nonatomic, readonly) WLGmailAddress *bccAddress;

// raw formats
@property (nonatomic, copy, readonly) NSString *rawString;

- (instancetype)initWithFromAddress:(WLGmailAddress *)fromAddress to:(WLGmailAddress *)toAddress;

- (instancetype)initWithSubject:(NSString *)subject body:(NSString *)body from:(WLGmailAddress *)fromAddress to:(WLGmailAddress *)toAddress;

- (instancetype)initWithSubject:(NSString *)subject body:(NSString *)body from:(WLGmailAddress *)fromAddress to:(WLGmailAddress *)toAddress cc:(WLGmailAddress *)ccAddress bcc:(WLGmailAddress *)bccAddress;

@end
