//
//  JHAdjustButton.m
//  JHAdjustButton
//
//  Created by HaoCold on 2022/1/20.
//

#import "JHAdjustButton.h"

@implementation JHAdjustButton

#pragma mark - override

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self layoutImageAndTitle];
}

#pragma mark - private

- (void)layoutImageAndTitle
{
    // Horizontal
    if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentLeft) {
        [self HorizontalAllLeft];
    }else if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentCenter) {
        [self HorizontalAllCenter];
    }else if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentRight) {
        [self HorizontalAllRight];
    }
    
    // Vertical
    if (self.contentVerticalAlignment == UIControlContentVerticalAlignmentTop) {
        [self VerticalAllTop];
    }else if (self.contentVerticalAlignment == UIControlContentVerticalAlignmentCenter) {
        [self VerticalAllCenter];
    }else if (self.contentVerticalAlignment == UIControlContentVerticalAlignmentBottom) {
        [self VerticalAllBottom];
    }
}

#pragma mark --- Horizontal

- (void)HorizontalAllLeft
{
    CGRect imageFrame = self.imageView.frame;
    CGRect titleFrame = self.titleLabel.frame;
    
    if (!CGSizeEqualToSize(_imageSize, CGSizeZero)) {
        imageFrame.size = _imageSize;
    }
    
    // image Left, title Right
    if (_position == JHAdjustButtonPosition_ImageLeftTitleRight) {
        imageFrame.origin.x = _padding.left;
        titleFrame.origin.x = CGRectGetMaxX(imageFrame) + _betweenSpace;
    }
    
    // image Right, title Left
    else if (_position == JHAdjustButtonPosition_ImageRightTitleLeft) {
        titleFrame.origin.x = _padding.left;
        imageFrame.origin.x = CGRectGetMaxX(titleFrame) + _betweenSpace;
    }
    
    // image Top, title Bottom
    else if (_position == JHAdjustButtonPosition_ImageTopTitleBottom) {
        imageFrame.origin.x = _padding.left;
        titleFrame.origin.x = _padding.left;
    }
    
    // image Bottom, title Top
    else if (_position == JHAdjustButtonPosition_ImageBottomTitleTop) {
        imageFrame.origin.x = _padding.left;
        titleFrame.origin.x = _padding.left;
    }
    
    self.imageView.frame = imageFrame;
    self.titleLabel.frame = titleFrame;
}

- (void)HorizontalAllCenter
{
    CGFloat half = _betweenSpace * 0.5;
    CGFloat mid = CGRectGetMidX(self.bounds);
    CGRect imageFrame = self.imageView.frame;
    CGRect titleFrame = self.titleLabel.frame;
    
    if (!CGSizeEqualToSize(_imageSize, CGSizeZero)) {
        imageFrame.size = _imageSize;
    }
    
    // image Left, title Right
    if (_position == JHAdjustButtonPosition_ImageLeftTitleRight) {
        CGFloat x = (CGRectGetWidth(titleFrame) + CGRectGetWidth(imageFrame)) * 0.5;
        imageFrame.origin.x = mid - half - x;
        titleFrame.origin.x = CGRectGetMaxX(imageFrame) + _betweenSpace;
    }
    
    // image Right, title Left
    else if (_position == JHAdjustButtonPosition_ImageRightTitleLeft) {
        CGFloat x = (CGRectGetWidth(titleFrame) + CGRectGetWidth(imageFrame)) * 0.5;
        titleFrame.origin.x = mid - half - x;
        imageFrame.origin.x = CGRectGetMaxX(titleFrame) + _betweenSpace;
    }
    // image Top, title Bottom
    else if (_position == JHAdjustButtonPosition_ImageTopTitleBottom) {
        imageFrame.origin.x = mid - CGRectGetWidth(imageFrame) * 0.5;
        titleFrame.origin.x = mid - CGRectGetWidth(titleFrame) * 0.5;
    }
    
    // image Bottom, title Top
    else if (_position == JHAdjustButtonPosition_ImageBottomTitleTop) {
        imageFrame.origin.x = mid - CGRectGetWidth(imageFrame) * 0.5;
        titleFrame.origin.x = mid - CGRectGetWidth(titleFrame) * 0.5;
    }
    
    self.imageView.frame = imageFrame;
    self.titleLabel.frame = titleFrame;
}

- (void)HorizontalAllRight
{
    CGFloat w = CGRectGetWidth(self.bounds);
    CGRect imageFrame = self.imageView.frame;
    CGRect titleFrame = self.titleLabel.frame;
    
    if (!CGSizeEqualToSize(_imageSize, CGSizeZero)) {
        imageFrame.size = _imageSize;
    }
    
    // image Left, title Right
    if (_position == JHAdjustButtonPosition_ImageLeftTitleRight) {
        titleFrame.origin.x = w - CGRectGetWidth(titleFrame) - _padding.right;
        imageFrame.origin.x = CGRectGetMinX(titleFrame) - CGRectGetWidth(imageFrame) - _betweenSpace;
    }
    
    // image Right, title Left
    else if (_position == JHAdjustButtonPosition_ImageRightTitleLeft) {
        imageFrame.origin.x = w - CGRectGetWidth(imageFrame) - _padding.right;
        titleFrame.origin.x = CGRectGetMinX(imageFrame) - CGRectGetWidth(titleFrame) - _betweenSpace;
    }
    
    // image Top, title Bottom
    else if (_position == JHAdjustButtonPosition_ImageTopTitleBottom) {
        imageFrame.origin.x = w - CGRectGetWidth(imageFrame) - _padding.right;
        titleFrame.origin.x = w - CGRectGetWidth(titleFrame) - _padding.right;
    }
    
    // image Bottom, title Top
    else if (_position == JHAdjustButtonPosition_ImageBottomTitleTop) {
        imageFrame.origin.x = w - CGRectGetWidth(imageFrame) - _padding.right;
        titleFrame.origin.x = w - CGRectGetWidth(titleFrame) - _padding.right;
    }
    
    self.imageView.frame = imageFrame;
    self.titleLabel.frame = titleFrame;
}


#pragma mark --- Vertical

- (void)VerticalAllTop
{
    CGRect imageFrame = self.imageView.frame;
    CGRect titleFrame = self.titleLabel.frame;
    
    // image Left, title Right
    if (_position == JHAdjustButtonPosition_ImageLeftTitleRight) {
        imageFrame.origin.y = _padding.top;
        titleFrame.origin.y = _padding.top;
    }
    
    // image Right, title Left
    else if (_position == JHAdjustButtonPosition_ImageRightTitleLeft) {
        imageFrame.origin.y = _padding.top;
        titleFrame.origin.y = _padding.top;
    }
    
    // image Top, title Bottom
    else if (_position == JHAdjustButtonPosition_ImageTopTitleBottom) {
        imageFrame.origin.y = _padding.top;
        titleFrame.origin.y = CGRectGetMaxY(imageFrame) + _betweenSpace;
    }
    
    // image Bottom, title Top
    else if (_position == JHAdjustButtonPosition_ImageBottomTitleTop) {
        titleFrame.origin.y = _padding.top;
        imageFrame.origin.y = CGRectGetMaxY(titleFrame) + _betweenSpace;
    }
    
    self.imageView.frame = imageFrame;
    self.titleLabel.frame = titleFrame;
}

- (void)VerticalAllCenter
{
    CGFloat half = _betweenSpace * 0.5;
    CGFloat mid = CGRectGetMidY(self.bounds);
    CGRect imageFrame = self.imageView.frame;
    CGRect titleFrame = self.titleLabel.frame;
    
    // image Left, title Right
    if (_position == JHAdjustButtonPosition_ImageLeftTitleRight) {
        imageFrame.origin.y = mid - CGRectGetHeight(imageFrame) * 0.5;
    }
    
    // image Right, title Left
    else if (_position == JHAdjustButtonPosition_ImageRightTitleLeft) {
        imageFrame.origin.y = mid - CGRectGetHeight(imageFrame) * 0.5;
    }
    
    // image Top, title Bottom
    else if (_position == JHAdjustButtonPosition_ImageTopTitleBottom) {
        CGFloat mid = CGRectGetMidY(self.bounds);
        CGFloat y = (CGRectGetHeight(imageFrame) + CGRectGetHeight(titleFrame)) * 0.5;
        imageFrame.origin.y = mid - half - y;
        titleFrame.origin.y = CGRectGetMaxY(imageFrame) + _betweenSpace;
    }
    
    // image Bottom, title Top
    else if (_position == JHAdjustButtonPosition_ImageBottomTitleTop) {
        CGFloat mid = CGRectGetMidY(self.bounds);
        CGFloat y = (CGRectGetHeight(imageFrame) + CGRectGetHeight(titleFrame)) * 0.5;
        titleFrame.origin.y = mid - half - y;
        imageFrame.origin.y = CGRectGetMaxY(titleFrame) + _betweenSpace;
    }
    
    self.imageView.frame = imageFrame;
    self.titleLabel.frame = titleFrame;
}

- (void)VerticalAllBottom
{
    CGFloat h = CGRectGetHeight(self.bounds);
    CGRect imageFrame = self.imageView.frame;
    CGRect titleFrame = self.titleLabel.frame;
    
    // image Left, title Right
    if (_position == JHAdjustButtonPosition_ImageLeftTitleRight) {
        imageFrame.origin.y = h - CGRectGetHeight(imageFrame) - _padding.bottom;
        titleFrame.origin.y = h - CGRectGetHeight(titleFrame) - _padding.bottom;
    }
    
    // image Right, title Left
    else if (_position == JHAdjustButtonPosition_ImageRightTitleLeft) {
        imageFrame.origin.y = h - CGRectGetHeight(imageFrame) - _padding.bottom;
        titleFrame.origin.y = h - CGRectGetHeight(titleFrame) - _padding.bottom;
    }
    
    // image Top, title Bottom
    else if (_position == JHAdjustButtonPosition_ImageTopTitleBottom) {
        titleFrame.origin.y = h - CGRectGetHeight(titleFrame) - _padding.bottom;
        imageFrame.origin.y = CGRectGetMinY(titleFrame) - CGRectGetHeight(imageFrame) - _betweenSpace;
    }
    
    // image Bottom, title Top
    else if (_position == JHAdjustButtonPosition_ImageBottomTitleTop) {
        imageFrame.origin.y = h - CGRectGetHeight(imageFrame) - _padding.bottom;
        titleFrame.origin.y = CGRectGetMinY(imageFrame) - CGRectGetHeight(titleFrame) - _betweenSpace;
    }
    
    self.imageView.frame = imageFrame;
    self.titleLabel.frame = titleFrame;
}

#pragma mark - setter

- (void)setPosition:(JHAdjustButtonPosition)position
{
    if (_position != position) {
        _position = position;
        [self setNeedsLayout];
    }
}

- (void)setPadding:(UIEdgeInsets)padding
{
    if (!UIEdgeInsetsEqualToEdgeInsets(_padding, padding)) {
        _padding = padding;
        [self setNeedsLayout];
    }
}

- (void)setBetweenSpace:(CGFloat)betweenSpace
{
    if (_betweenSpace != betweenSpace) {
        _betweenSpace = betweenSpace;
        [self setNeedsLayout];
    }
}

- (void)setImageSize:(CGSize)imageSize
{
    if (!CGSizeEqualToSize(_imageSize, imageSize)) {
        _imageSize = imageSize;
        [self setNeedsLayout];
    }
}

- (void)setContentHorizontalAlignment:(UIControlContentHorizontalAlignment)contentHorizontalAlignment
{
    if (self.contentHorizontalAlignment != contentHorizontalAlignment) {
        [super setContentHorizontalAlignment:contentHorizontalAlignment];
        [self setNeedsLayout];
    }
}

- (void)setContentVerticalAlignment:(UIControlContentVerticalAlignment)contentVerticalAlignment
{
    if (self.contentVerticalAlignment != contentVerticalAlignment) {
        [super setContentVerticalAlignment:contentVerticalAlignment];
        [self setNeedsLayout];
    }
}

@end
