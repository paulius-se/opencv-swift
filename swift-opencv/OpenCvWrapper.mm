//
//  OpenCvWrapper.m
//  swift-opencv
//
//  Created by Paulius Serafinavicius on 2016-05-06.
//  Copyright © 2016 Paulius Serafinavicius. All rights reserved.
//

#import <opencv2/opencv.hpp>
#import <opencv2/videoio/cap_ios.h>

#import "UIImage+OpenCV.h"
#import "UIImage+Rotate.h"

#import "OpenCvWrapper.h"


using namespace cv;
using namespace std;

@interface OpenCvWrapper() <CvVideoCameraDelegate>

@end

@implementation OpenCvWrapper

- (void)openWithCameraView:(UIView*)view {
    self.videoCamera = [[CvVideoCamera alloc] initWithParentView:view];
    self.videoCamera.defaultAVCaptureDevicePosition = AVCaptureDevicePositionFront;
    self.videoCamera.defaultAVCaptureSessionPreset = AVCaptureSessionPreset352x288;
    self.videoCamera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortrait;
    self.videoCamera.defaultFPS = 30;
    self.videoCamera.grayscaleMode = NO;
    self.videoCamera.delegate = self;
    self.videoCamera.useAVCaptureVideoPreviewLayer = NO;
    self.videoCamera.rotateVideo = YES;
    [self.videoCamera start];
}

- (void)processImage:(cv::Mat &)image {
    UIImage *uiImage = [UIImage imageWithCVMat:image];
    [self.delegate cameraImageRetrieved:uiImage];
}

- (void)setInterfaceOrientation:(UIInterfaceOrientation)orientation {
    AVCaptureConnection *conn = [[self.videoCamera.captureSession.outputs objectAtIndex:0] connectionWithMediaType:AVMediaTypeVideo];
    if ([conn isVideoOrientationSupported]) {
        if (orientation == UIInterfaceOrientationLandscapeLeft)
            conn.videoOrientation = AVCaptureVideoOrientationLandscapeLeft;
        else if (orientation == UIInterfaceOrientationLandscapeRight)
            conn.videoOrientation = AVCaptureVideoOrientationLandscapeRight;
        else if (orientation == UIInterfaceOrientationPortraitUpsideDown)
            conn.videoOrientation = AVCaptureVideoOrientationPortraitUpsideDown;
        else
            conn.videoOrientation = AVCaptureVideoOrientationPortrait;
    }
}

@end
