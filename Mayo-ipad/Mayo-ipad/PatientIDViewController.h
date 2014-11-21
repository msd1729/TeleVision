//
//  PatientIDViewController.h
//  Mayo-ipad
//
//  Created by Rishabh Srivastava on 14/11/14.
//  Copyright (c) 2014 rishabh srivastava. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientIDViewController : UIViewController{
    
    IBOutlet UILabel *userlabel;
    IBOutlet UILabel *idlabel;
    __weak IBOutlet UIButton *nextToLanding;
}

@property (weak, nonatomic) IBOutlet UITextField *patientId;

- (IBAction)nextToLanding:(id)sender;

@property (nonatomic, strong) NSArray *Banner;
@property (nonatomic, strong) NSArray *Title;
@property (nonatomic, strong) NSArray *Description;
- (IBAction)LogoutButton:(id)sender;
- (IBAction)backgroundTap:(id)sender;

@end
