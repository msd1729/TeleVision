//
//  ViewController2.h
//  Mayo-ipad
//
//  Created by Rishabh Srivastava on 08/10/14.
//  Copyright (c) 2014 rishabh srivastava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>


@interface ViewController2 : UIViewController <UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentController;
- (IBAction)segment:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *viewOverview;
@property (weak, nonatomic) IBOutlet UIView *viewReport;
@property (weak, nonatomic) IBOutlet UIView *upLoad;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)takePhoto:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
- (IBAction)uploadImage:(id)sender;
@property (strong, atomic) ALAssetsLibrary* library;






@end
