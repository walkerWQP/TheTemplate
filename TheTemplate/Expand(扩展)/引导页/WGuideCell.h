//
//  WGuideCell.h
//  TheTemplate
//
//  Created by yunjobs on 2018/6/26.
//  Copyright © 2018年 walker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WGuideCell : UICollectionViewCell

@property (nonatomic, strong) UIImage *image;

- (void)setIndexPath:(NSIndexPath *)indexPath count:(NSInteger)count pressStartBtn:(void(^)(void))block;

@property (nonatomic, strong) void(^pressStartBtn)(void);

@end
