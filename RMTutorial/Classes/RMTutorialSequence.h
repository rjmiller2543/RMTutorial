//
//  RMTutorialSequence.h
//  Pods
//
//  Created by Robert Miller on 7/25/16.
//
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    RMTPopoverDirectionNone,
    RMTPopoverDirectionUp,
    RMTPopoverDirectionDown,
} RMTPopoverDirection;

@interface RMTutorialSequence : NSObject

@property(nonatomic,retain) NSString *tutText;
@property(nonatomic,retain) NSMutableAttributedString *tutAttText;
@property(nonatomic) CGPoint popPoint;
@property(nonatomic) RMTPopoverDirection direction;
@property(nonatomic) BOOL attributed;

-(instancetype)initWithPoint:(CGPoint)point andText:(NSString *)text andDirection:(RMTPopoverDirection)direction;
-(instancetype)initWithPoint:(CGPoint)point andAttributedText:(NSAttributedString *)text andDirection:(RMTPopoverDirection)direction;

@end
