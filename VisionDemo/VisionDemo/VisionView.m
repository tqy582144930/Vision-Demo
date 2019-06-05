//
//  VisionView.m
//  VisionDemo
//
//  Created by _祀梦 on 2019/6/5.
//  Copyright © 2019 涂强尧. All rights reserved.
//

#import "VisionView.h"

@implementation VisionView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _takePicturesButton = [[UIButton alloc] initWithFrame:CGRectMake((self.bounds.size.width - 200)/2, 200, 200, 200)];
        _takePicturesButton.backgroundColor = [UIColor blackColor];
        [self addSubview:_takePicturesButton];
    }
    return self;
}

@end
