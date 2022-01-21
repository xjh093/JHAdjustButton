//
//  JHAdjustButton.h
//  JHAdjustButton
//
//  Created by HaoCold on 2022/1/20.
//  v1.0.0

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, JHAdjustButtonPosition) {
    JHAdjustButtonPosition_ImageLeftTitleRight,
    JHAdjustButtonPosition_ImageRightTitleLeft,
    JHAdjustButtonPosition_ImageTopTitleBottom,
    JHAdjustButtonPosition_ImageBottomTitleTop
};

@interface JHAdjustButton : UIButton

///
@property (nonatomic,  assign) JHAdjustButtonPosition  position;

/// Default is UIEdgeInsetsZero.
@property (nonatomic,  assign) UIEdgeInsets  padding;

/// Default is 0. The space between `Image` and `Title`.
@property (nonatomic,  assign) CGFloat  betweenSpace;

///
@property (nonatomic,  assign) CGSize  imageSize;

@end

NS_ASSUME_NONNULL_END
