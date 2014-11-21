//
//  ViewController2.m
//  Mayo-ipad
//
//  Created by Nagesh Kumar Uba on 08/10/14.
//  Copyright (c) 2014 Nagesh Kumar Uba. All rights reserved.
//

#import "LandingViewController.h"
#import "TableCell.h"
#import "uploadViewController.h"

@interface LandingViewController()

@end

@implementation LandingViewController{

UIImage *mainImage;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"mayobg.png"]]];
    
    CALayer *btnLayer = [libraryaccess layer];
    [btnLayer setMasksToBounds:YES];
    [btnLayer setCornerRadius:10.0f];
    
    CALayer *btnLayer1 = [nexttoupload layer];
    [btnLayer1 setMasksToBounds:YES];
    [btnLayer1 setCornerRadius:15.0f];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (IBAction)backgroundTap:(id)sender {
    [self.view endEditing:YES];
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)LogoutButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"upload_segue"]) {
        uploadViewController *destViewController = segue.destinationViewController;
        destViewController.landingImage = mainImage;
    }
}


- (IBAction)libraryaccess:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.modalPresentationStyle = UIModalPresentationFormSheet;
    picker.delegate = self;
    picker.allowsEditing = YES;
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
    
    mainImage = image;
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

-(void) imagePickerControllerDidCsncel: (UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end