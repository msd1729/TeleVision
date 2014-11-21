//
//  ViewController2.m
//  Mayo-ipad
//
//  Created by Rishabh Srivastava on 08/10/14.
//  Copyright (c) 2014 rishabh srivastava. All rights reserved.
//

#import "ViewController2.h"
#import "CustomPhotoAlbum.h"


@interface ViewController2 ()

@end

@implementation ViewController2
@synthesize viewOverview, viewReport, upLoad, library;
UIImage *imageView, *imageVIew2;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.library = [[ALAssetsLibrary alloc] init];
    // Do any additional setup after loading the view.
    
    
}

- (void)viewDidUnload
{
    self.library = nil;
    [super viewDidUnload];
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


- (IBAction)segment:(UISegmentedControl *)sender {
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.viewOverview.hidden = NO;
            self.viewReport.hidden = YES;
            self.upLoad.hidden = YES;
            break;
            
        case 1:
            self.viewOverview.hidden = YES;
            self.viewReport.hidden = NO;
            self.upLoad.hidden = YES;
            break;
            
        case 2:
            self.viewOverview.hidden = YES;
            self.viewReport.hidden = YES;
            self.upLoad.hidden = NO;
            break;
            
        default:
            break;
    }
    
    
}

- (IBAction)uploadImage:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc ] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
}

- (IBAction)takePhoto:(id)sender {
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePickerController.editing = YES;
    imagePickerController.delegate = (id)self;
    
    [self presentModalViewController:imagePickerController animated:YES];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissModalViewControllerAnimated:NO];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    [self.library saveImage:image toAlbum:@"Mayo folder" withCompletionBlock:^(NSError *error) {
        if (error!=nil) {
            NSLog(@"Big error: %@", [error description]);
        }
    }];
    
    imageView = image;
    imageVIew2 = image;
    [picker dismissModalViewControllerAnimated:NO];
}

@end
