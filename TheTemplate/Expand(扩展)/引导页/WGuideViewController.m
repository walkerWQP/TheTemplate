//
//  WGuideViewController.m
//  TheTemplate
//
//  Created by yunjobs on 2018/6/26.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "WGuideViewController.h"
#import "WGuideCell.h"
#import "WGuideManage.h"


#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height



@interface WGuideViewController ()

@property (nonatomic, strong) NSMutableArray *images;
@property (nonatomic, assign) CGFloat        preOffsetX;//上一次x的值

@end

@implementation WGuideViewController

static NSString * const reuseIdentifier = @"Cell";

- (NSMutableArray *)images {
    if (_images == nil) {
        _images = [NSMutableArray array];
    }
    return _images;
}

- (instancetype)init {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.itemSize = CGSizeMake(ScreenW , ScreenH);
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    return [[WGuideViewController alloc] initWithCollectionViewLayout:flowLayout];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpCollectionView];
    [self setUpData];
    
}

- (void)setUpData
{
    [self.images addObject:@"loading1"];
    [self.images addObject:@"loading2"];
    [self.images addObject:@"loading3"];
}
- (void)setUpCollectionView
{
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerClass:[WGuideCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WGuideCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.image = [UIImage imageNamed:self.images[indexPath.row]];
    cell.backgroundColor = [UIColor redColor];
    
    // 给最后一个cell添加按钮
    [cell setIndexPath:indexPath count:self.images.count pressStartBtn:^{
        //判断有没有登录  如果登录过就进入主框架界面
        // 否则就进入登录页
        //        [UIView animateWithDuration:.3 animations:^{
        //            self.view.transform = CGAffineTransformScale(self.view.transform, 1.2, 1.2);
        //            self.view.alpha = 0;
        //        } completion:^(BOOL finished) {
        [UIApplication sharedApplication].keyWindow.rootViewController = [WGuideManage chooseRootController];
        //        }];
    }];
    
    return cell;
}

@end
