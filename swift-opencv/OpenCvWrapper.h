//
//  OpenCvWrapper.h
//  swift-opencv
//
//  Created by Paulius Serafinavicius on 2016-05-06.
//  Copyright © 2016 Paulius Serafinavicius. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class CvVideoCamera;

@protocol OpenCvWrapperDelegate <NSObject>

- (void)cameraImageRetrieved:(UIImage*)image;

@end

@interface OpenCvWrapper : NSObject

- (void)openWithCameraView:(UIView*)view;
- (void)setInterfaceOrientation:(UIInterfaceOrientation)orientation;

@property (nonatomic, weak) id <OpenCvWrapperDelegate> delegate;
@property (nonatomic, strong) CvVideoCamera* videoCamera;

@end
