//
//  WLGmailAddress.m
//  WLGmail
//
//  Created by Wyatt Lam on 9/7/14.
//  Copyright (c) 2014 WyattLam. All rights reserved.
//

#import "WLGmailAddress.h"

@implementation WLGmailAddress

- (instancetype)initWithEmailAddress:(NSString *)address name:(NSString *)name
{
    self = [super init];
    if (self) {
        _emailAddress = address;
        _name = name;
    }
    return self;
}

- (NSString *)rawString
{
    return [NSString stringWithFormat:@"%@ <%@>", _name, _emailAddress];
}

@end
