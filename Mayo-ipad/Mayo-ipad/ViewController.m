//
//  ViewController.m
//  Mayo-ipad
//
//  Created by Rishabh Srivastava on 08/10/14.
//  Copyright (c) 2014 rishabh srivastava. All rights reserved.
//

#import "ViewController.h"

#import "XMLRPCRequest.h"
#import "XMLRPCConnection.h"
#import "KeychainItemWrapper.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor clearColor]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}


- (IBAction)login:(id)sender {
    
    
    
    NSDictionary *retLogin = [self loginToServerWithUser:self.userName.text passwd:self.passWord.text];
    NSLog((retLogin != nil) ? @"True" : @"False");
   
    
    if(retLogin != nil) {
        
        
        [self performSegueWithIdentifier:@"login_success" sender:self];
    }
    
    else{
        
        
        
        [[[UIAlertView alloc] initWithTitle:@"Sorry"
                                    message:@"Username password cannot be authenticated, TRY AGAIN!"
                                   delegate: nil
                          cancelButtonTitle:@"Cancel"
                          otherButtonTitles:nil
          ] show];
        //[self performSegueWithIdentifier:@"login_failed" sender:self];
    }
    

}



- (void) alertStatus:(NSString *)msg :(NSString *)title :(int) tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    alertView.tag = tag;
    [alertView show];
    
}

- (IBAction)backgroundTap:(id)sender {
    [self.view endEditing:YES];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
    
}

- (NSDictionary *)loginToServerWithUser:(NSString *)user
                                 passwd:(NSString *)password{
    //NSString *encPassWd = [self sha1:password];
    
    NSArray *args = [[NSArray alloc]initWithObjects:@"test",user,password,nil];
    NSString *server = xmlrpcServerURL;         // the server
    NSString *method = xmlrpcLoginMethodName;                        // the method
    XMLRPCRequest *request = [[XMLRPCRequest alloc] initWithHost:[NSURL URLWithString:server]];
    [request setMethod:method withObjects:args];
    id response = [self executeXMLRPCRequest:request];
    
    
    if( [response isKindOfClass:[NSError class]] ) {
        return nil;
    }
    else {
        return response;          // the response key
    }
}

- (NSDictionary *)uploadImageToServerWithUser:(NSString *)user
                                       passwd:(NSString *)password{
    NSMutableDictionary *inputMap = [[NSMutableDictionary alloc] init];
    
    UIImage *uploadImage = [UIImage imageNamed:@"IMG_4756.JPG"];
    NSData *dataBits = UIImageJPEGRepresentation(uploadImage, 1);
    
    
    [inputMap setObject:@"photo.JPG" forKey:@"name"];
    [inputMap setObject:@"image/jpeg" forKey:@"type"];
    [inputMap setObject:dataBits forKey:@"bits"];
    
    
    NSArray *args = [[NSArray alloc]initWithObjects:xmlrpcBlogIDName,user,password,inputMap,nil];
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
    
    if( [response isKindOfClass:[NSError class]] ) {
        return nil;
    }
    else {
        return response;          // the response key
    }
}


- (id)executeXMLRPCRequest:(XMLRPCRequest *)req {
    XMLRPCResponse *userInfoResponse = [XMLRPCConnection sendSynchronousXMLRPCRequest:req];
    return userInfoResponse;
}





@end
