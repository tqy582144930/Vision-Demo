//
//  ViewController.m
//  VisionDemo
//
//  Created by _祀梦 on 2019/6/4.
//  Copyright © 2019 涂强尧. All rights reserved.
//

#import "ViewController.h"
#import "VisionAnalyzeViewController.h"

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) UIImagePickerController *picker;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _visonView = [[VisionView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_visonView];
    [_visonView.takePicturesButton addTarget:self action:@selector(clickTakePictureButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.picker.delegate = self;
    self.picker.allowsEditing = YES;
}

//懒加载
- (UIImagePickerController *)picker
{
    if (!_picker) {
        _picker = [[UIImagePickerController alloc] init];
    }
    return _picker;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    //获取图片
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    VisionAnalyzeViewController *viewController = [[VisionAnalyzeViewController alloc] init];
    viewController.imageView = [[UIImageView alloc] initWithImage:image];
    [picker presentViewController:viewController animated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    //    返回
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)clickTakePictureButton:(UIButton *)button {
    BOOL isPicker = NO;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        isPicker = true;
    }
    
    if (isPicker) {
        [self presentViewController:self.picker animated:YES completion:nil];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"错误" message:@"相机不可用" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}
@end
