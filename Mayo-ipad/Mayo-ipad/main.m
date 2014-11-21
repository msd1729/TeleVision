//
//  main.m
//  Mayo-ipad
//
//  Created by Rishabh Srivastava on 08/10/14.
//  Copyright (c) 2014 rishabh srivastava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "KeychainItemWrapper.h"

extern NSMutableDictionary *userMap;
extern KeychainItemWrapper *keychainItem;

int main(int argc, char * argv[]) {
    @autoreleasepool {
        //userMap = [[NSMutableDictionary alloc] init];
        keychainItem = [[KeychainItemWrapper alloc]initWithIdentifier:@"TeleVisionAppLogin" accessGroup:nil];
        [keychainItem setObject:(__bridge id)kSecAttrAccessibleWhenUnlocked forKey:(__bridge id)kSecAttrAccessible];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
