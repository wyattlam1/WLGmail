//
//  WLGmailAddress.h
//  WLGmail
//
//  Created by Wyatt Lam on 9/7/14.
//  Copyright (c) 2014 WyattLam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLGmailAddress : NSObject
@property (nonatomic, copy, readonly) NSString *emailAddress;
@property (nonatomic, copy, readonly) NSString *name;

- (instancetype)initWithEmailAddress:(NSString *)address name:(NSString *)name;
- (NSString *)rawString;
@end
