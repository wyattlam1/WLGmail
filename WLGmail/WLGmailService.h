//
//  WLGmail.h
//  WLGmail
//
//  Created by Wyatt Lam on 9/6/14.
//  Copyright (c) 2014 WyattLam. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WLGmailMessage;

@interface WLGmailService : NSObject

- (void)sendEmail:(WLGmailMessage *)message completionBlock:(void (^)(NSError *))completionBlock;

@end
