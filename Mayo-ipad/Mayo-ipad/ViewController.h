//
//  ViewController.h
//  Mayo-ipad
//
//  Created by Rishabh Srivastava on 08/10/14.
//  Copyright (c) 2014 rishabh srivastava. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "appConstants.h"
#import "KeychainItemWrapper.h"

NSMutableDictionary *userMap;
KeychainItemWrapper *keychainItem;

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
- (IBAction)login:(id)sender;
- (IBAction)backgroundTap:(id)sender;

@end

