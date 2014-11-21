//
//  uploadViewController.h
//  Mayo-ipad
//
//  Created by Sachin Dheeraj on 11/13/14.
//  Copyright (c) 2014 rishabh srivastava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <MessageUI/MessageUI.h>
#import "KeychainItemWrapper.h"

NSMutableDictionary *userMap;
KeychainItemWrapper *keychainItem;

@interface uploadViewController : UIViewController <MFMailComposeViewControllerDelegate> {
    
    __weak IBOutlet UIButton *back;
    
    __weak IBOutlet UIButton *uploadPicture;
    
    __weak IBOutlet UIButton *email;
    
    __weak IBOutlet UIActivityIndicatorView *activityView;
    __weak IBOutlet UILabel *activityLabel;
    
    __weak IBOutlet UIButton *continueNext;
}


@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) UIImage *landingImage;

- (IBAction)email:(id)sender;

- (IBAction)upload:(id)sender;



@end
