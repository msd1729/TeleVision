//
//  uploadViewController.m
//  Mayo-ipad
//
//  Created by Sachin Dheeraj on 11/13/14.
//  Copyright (c) 2014 rishabh srivastava. All rights reserved.
//

#import "uploadViewController.h"
#import "XMLRPCRequest.h"
#import "XMLRPCConnection.h"


#import "ViewController.h"

@interface uploadViewController ()

@end

@implementation uploadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"mayobg.png"]]];

    self.image.image = self.landingImage;
    // Do any additional setup after loading the view.
    
    CALayer *btnLayer = [back layer];
    [btnLayer setMasksToBounds:YES];
    [btnLayer setCornerRadius:10.0f];
    
    CALayer *btnLayer1 = [uploadPicture layer];
    [btnLayer1 setMasksToBounds:YES];
    [btnLayer1 setCornerRadius:10.0f];
    
    CALayer *btnLayer2 = [email layer];
    [btnLayer2 setMasksToBounds:YES];
    [btnLayer2 setCornerRadius:10.0f];
    
    CALayer *btnLayer3 = [continueNext layer];
    [btnLayer3 setMasksToBounds:YES];
    [btnLayer3 setCornerRadius:10.0f];
    
    
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)upload:(id)sender {
    
    if(self.landingImage != nil)
    {
        
        [self->activityView startAnimating];
        activityLabel.text = @"Uploading...";
        [self performSelector:@selector(Afterloading) withObject:nil afterDelay:4.0f];
    
        NSMutableDictionary *inputMap = [[NSMutableDictionary alloc] init];
    
        NSData *dataBits = UIImageJPEGRepresentation(self.landingImage, 1);
    
        [inputMap setObject:@"test.JPG" forKey:@"name"];
        [inputMap setObject:@"image/jpeg" forKey:@"type"];
        [inputMap setObject:dataBits forKey:@"bits"];
    
        NSArray *args = [[NSArray alloc]initWithObjects:xmlrpcBlogIDName,@"sachin",@"sundevil",inputMap,nil];
        NSString *server = xmlrpcServerURL;         // the server URL
        NSString *method = xmlrpcUploadMethodName;                        // the method
        XMLRPCRequest *request = [[XMLRPCRequest alloc] initWithHost:[NSURL URLWithString:server]];
        [request setMethod:method withObjects:args];
        id response = [self executeXMLRPCRequest:request];
    
        //Nagesh Start - Will be used when integrating it with VPN
    
        [userMap setObject:@"Sunil" forKey:@"firstName"];
        [userMap setObject:@"Rao" forKey:@"lastname"];
        [userMap setObject:@"16173198" forKey:@"personId"];
        [userMap setObject:@"M137121" forKey:@"lanId"];
        [userMap setObject:@"20ejm5umdo5h3jsfbprmof9drf" forKey:@"securityToken"];
    
        // Temporary stuff - delete after uncommenting the above
        [keychainItem setObject:userMap[@"personId"] forKey:(__bridge id)kSecValueData];
        [keychainItem setObject:userMap[@"securityToken"] forKey:(__bridge id)kSecAttrAccount];
    
        //We can retrieve token and person id from key chain as follows:
        NSString *token = [keychainItem objectForKey:(__bridge id)kSecAttrAccount];
        NSString *perId = [keychainItem objectForKey:(__bridge id)kSecValueData];
    
        //Nagesh End - Will be used when integrating it with VPN
    
    }
    else
    {
        
        [[[UIAlertView alloc] initWithTitle:@"Sorry"
                                    message:@"Please select an image to upload, click 'Cancel Upload' and try again!"
                                   delegate: nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil
          ] show];
    }

    
    
}

-(void)Afterloading{
    activityView.hidden = YES;
    activityLabel.text = @"Image was successfully uploaded!";

}

- (id)executeXMLRPCRequest:(XMLRPCRequest *)req {
    XMLRPCResponse *userInfoResponse = [XMLRPCConnection sendSynchronousXMLRPCRequest:req];
    return userInfoResponse;
}


- (IBAction)email:(id)sender {
    
    MFMailComposeViewController *emailit = [[MFMailComposeViewController alloc] init];
    [emailit setMailComposeDelegate:self];
    NSString *addrss = @"abc@abc.com" ;
    NSArray *addrssArray = [[NSArray alloc] initWithObjects:addrss, nil];
    NSData *imageData = UIImageJPEGRepresentation(self.landingImage, 1);
    NSString *fileName = @"Mayo TeleVision retina picture";
    fileName = [fileName stringByAppendingPathExtension:@"jpeg"];
    [emailit addAttachmentData:imageData mimeType:@"image/jpeg" fileName:fileName];
    [emailit setMessageBody:@"" isHTML:NO];
    [emailit setToRecipients:addrssArray];
    [emailit setSubject:@"Mayo TeleVision Retina picture"];
    [emailit setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:emailit animated:YES completion:nil];
    
}

-(void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
