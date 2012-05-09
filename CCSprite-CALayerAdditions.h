#import <QuartzCore/QuartzCore.h>
#import "CCSprite.h"

@interface CCSprite (CALayerAdditions)

/**
 
 Creates a Cocos2D-iPhone sprite using the contents of a Core Animation Layer (CALayer).
 
 See CCSprite's spriteWithCGImage for documentation for the 'key' parameter.
 
*/

+ (CCSprite *)spriteFromLayer:(CALayer *)layer
                          key:(NSString *)key;

@end
