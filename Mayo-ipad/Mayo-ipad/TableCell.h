//
//  ViewController2.h
//  Mayo-ipad
//
//  Created by Nagesh Kumar Uba on 08/10/14.
//  Copyright (c) 2014 Nagesh Kumar Uba. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <AssetsLibrary/AssetsLibrary.h>
#import "ViewController.h"


@interface TableCell : UITableViewCell {
}
@property (strong, nonatomic) IBOutlet UILabel *TitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *DescriptionLabel;
@property (strong, nonatomic) IBOutlet UIImageView *ThumbImage;
@end