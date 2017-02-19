//
//  ZoomImageView.m
//  FrostedGlass
//
//  Created by Liuwx on 2017/2/19.
//  Copyright © 2017年 Liuwx. All rights reserved.
//

#import "ZoomImageView.h"

@implementation ZoomImageView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self _inteTap];
    }
    return self;
}

- (void)_inteTap {
    self.userInteractionEnabled = YES;
    // 添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBig)];
    [self addGestureRecognizer:tap];
    
    
}

- (void) tapBig {
    [self creatSubView];
    [UIView animateWithDuration:.3 animations:^{
        if (self.image.size.height / self.image.size.width > self.sccrollView.frame.size.height / self.sccrollView.frame.size.width) {
            
            CGFloat width = self.image.size.width * self.sccrollView.frame.size.height / self.image.size.height;
            _imageVIew.frame = CGRectMake((self.sccrollView.frame.size.width - width) / 2, 0,width, self.sccrollView.frame.size.height);
            
        }else {
            
            CGFloat height = self.image.size.height * self.sccrollView.frame.size.width / self.image.size.width;
            _imageVIew.frame = CGRectMake(0, (self.sccrollView.frame.size.height - height) / 2, self.sccrollView.frame.size.width, height);
            
        }
        _sccrollView.backgroundColor = [UIColor blackColor];
        self.hidden = YES;
    }];
    
    
}

- (void)creatSubView {
    _sccrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _sccrollView.showsVerticalScrollIndicator = NO;
    _sccrollView.showsHorizontalScrollIndicator = NO;
    [self.window addSubview:_sccrollView];
    _imageVIew = [[UIImageView alloc] init];
    _imageVIew.image = self.image;
    
    _imageVIew.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(smallTap)];
    [_imageVIew addGestureRecognizer:tap];
    [_sccrollView addSubview:_imageVIew];
    
    
}
- (void) smallTap {
    [UIView animateWithDuration:0.5 animations:^{
        _imageVIew.frame = self.frame;
    } completion:^(BOOL finished) {
        self.hidden = NO;
        [_sccrollView removeFromSuperview];
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
