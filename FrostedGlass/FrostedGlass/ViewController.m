//
//  ViewController.m
//  FrostedGlass
//
//  Created by Liuwx on 2017/2/19.
//  Copyright © 2017年 Liuwx. All rights reserved.
//

#import "ViewController.h"

#import "ZoomImageView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView * imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"张圆圆_02.jpg"]];
    ZoomImageView *imageVIew1 = [[ZoomImageView alloc] init];
    
    imageVIew1.image = [UIImage imageNamed:@"张圆圆_02.jpg"];
    imageview.frame = CGRectMake(0, 0, self.view.frame.size.width, 300);
    imageview.userInteractionEnabled = YES;
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    
    if (imageVIew1.image.size.height / imageVIew1.image.size.width > imageview.frame.size.height / imageview.frame.size.width) {
        
        CGFloat width = imageVIew1.image.size.width * imageview.frame.size.height / imageVIew1.image.size.height;
        imageVIew1.frame = CGRectMake((imageview.frame.size.width - width) / 2, 0,width, imageview.frame.size.height);
        
    }else {
        
        CGFloat height = imageVIew1.image.size.height * imageview.frame.size.width / imageVIew1.image.size.width;
        imageVIew1.frame = CGRectMake(0, (imageview.frame.size.height - height) / 2, imageview.frame.size.width, height);
        
    }
    [self.view addSubview:imageview];
    [self.view addSubview:imageVIew1];
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    
    effectview.frame = imageview.frame;
    
    [imageview addSubview:effectview];
    
    
    
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
