//
//  VisionAnalyzeViewController.m
//  VisionDemo
//
//  Created by _祀梦 on 2019/6/5.
//  Copyright © 2019 涂强尧. All rights reserved.
//

#import "VisionAnalyzeViewController.h"
#import "Vision/Vision.h"

@interface VisionAnalyzeViewController ()

@end

@implementation VisionAnalyzeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _imageView.frame = CGRectMake((self.view.bounds.size.width - 200)/2, 200, 200, 200);
    CIImage *faceCIImage = [[CIImage alloc] initWithImage:_imageView.image];
    VNImageRequestHandler *vnRequestHeader = [[VNImageRequestHandler alloc] initWithCGImage:faceCIImage options:@{}];
    [self.view addSubview:_imageView];
}

@end
