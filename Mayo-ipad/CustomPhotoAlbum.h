//
//  ViewController.h
//  Mayo-ipad
//
//  Created by Rishabh Srivastava on 09/10/14.
//  Copyright (c) 2014 rishabh srivastava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>

typedef void(^SaveImageCompletion)(NSError* error);

@interface ALAssetsLibrary(CustomPhotoAlbum)

-(void)saveImage:(UIImage*)image toAlbum:(NSString*)albumName withCompletionBlock:(SaveImageCompletion)completionBlock;
-(void)addAssetURL:(NSURL*)assetURL toAlbum:(NSString*)albumName withCompletionBlock:(SaveImageCompletion)completionBlock;

@end