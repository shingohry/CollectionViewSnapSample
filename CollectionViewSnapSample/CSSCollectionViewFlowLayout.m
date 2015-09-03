//
//  CSSCollectionViewFlowLayout.m
//  CollectionViewSnapSample
//
//  Created by 平屋真吾 on 2015/09/02.
//  Copyright (c) 2015年 平屋真吾. All rights reserved.
//

#import "CSSCollectionViewFlowLayout.h"

static CGFloat const kMinimumInteritemSpacing = 20.0f;
static CGFloat const kItemLength = 240.0f;
static CGFloat const kFlickVelocityThreshold = 0.2;

@implementation CSSCollectionViewFlowLayout

#pragma mark - Life Cycle

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self prepare];
}

#pragma mark - UICollectionViewLayout

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset
                                 withScrollingVelocity:(CGPoint)velocity
{
    CGFloat currentPage = self.collectionView.contentOffset.x / self.pageWidth;
    
    if (fabs(velocity.x) > kFlickVelocityThreshold) {
        CGFloat nextPage = (velocity.x > 0.0) ? ceil(currentPage) : floor(currentPage);
        return CGPointMake((nextPage * self.pageWidth), proposedContentOffset.y);
    } else {
        return CGPointMake((round(currentPage) * self.pageWidth), proposedContentOffset.y);
    }
}

#pragma mark - Private

- (CGFloat)pageWidth
{
    return self.itemSize.width + self.minimumLineSpacing;
}

- (void)prepare
{
    self.itemSize = CGSizeMake(kItemLength, kItemLength);
    self.minimumLineSpacing = kMinimumInteritemSpacing;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    CGFloat horizontalInset = ([UIScreen mainScreen].bounds.size.width - kItemLength) / 2;
    CGFloat verticalInset = ([UIScreen mainScreen].bounds.size.height - kItemLength) / 2;
    
    self.sectionInset = UIEdgeInsetsMake(verticalInset,
                                         horizontalInset,
                                         verticalInset,
                                         horizontalInset);
}

@end

