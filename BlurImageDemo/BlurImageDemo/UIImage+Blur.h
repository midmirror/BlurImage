@import UIKit;

@interface UIImage (Blur)

- (void)blurImageWithColor:(UIColor *)tintColor
              colorOpacity:(CGFloat)colorOpacity
     saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                blurRadius:(CGFloat)blurRadius
                completion:(void(^)(UIImage *blurImage))completion;

- (UIImage *)blurImageWithRadius:(CGFloat)blurRadius
                       tintColor:(UIColor *)tintColor
           saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                       maskImage:(UIImage *)maskImage;

@end
