#import "CCSprite-CALayerAdditions.h"
#import "CGPointExtension.h"

@implementation CCSprite (CALayerAdditions)

+ (CCSprite *)spriteFromLayer:(CALayer *)aLayer 
                          key:(NSString *)aKey {

    // TODO the 3.75 kills me
    // See http://stackoverflow.com/questions/10443763/how-many-points-pixels-are-added-to-a-calayer-given-a-shadowradius
    // Also see Apple's response here: https://devforums.apple.com/message/657925
    
    CGSize baseSize = aLayer.bounds.size;
    baseSize.width  += (aLayer.shadowRadius + aLayer.shadowOffset.width)  * 3.75;
    baseSize.height += (aLayer.shadowRadius + aLayer.shadowOffset.height) * 3.75;
    
    CALayer *parentLayer = [CALayer layer];
    parentLayer.frame = CGRectMake(0, 0, baseSize.width, baseSize.height);
    parentLayer.backgroundColor = [UIColor clearColor].CGColor;
    aLayer.position = ccp(baseSize.width/2, baseSize.height/2);
    [parentLayer addSublayer:aLayer];
    
    UIGraphicsBeginImageContext(parentLayer.bounds.size);
    [parentLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return [CCSprite spriteWithCGImage:image.CGImage key:aKey];
}

@end
