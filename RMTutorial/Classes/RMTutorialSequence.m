//
//  RMTutorialSequence.m
//  Pods
//
//  Created by Robert Miller on 7/25/16.
//
//

#import "RMTutorialSequence.h"

@interface RMTutorialSequence ()


@end

@implementation RMTutorialSequence

-(instancetype)initWithPoint:(CGPoint)point andText:(NSString *)text andDirection:(RMTPopoverDirection)direction {
    
    self = [super init];
    if (self) {
        _tutText = text;
        _popPoint = point;
        _direction = direction;
        
        _attributed = false;
    }
    
    return self;
    
}

-(instancetype)initWithPoint:(CGPoint)point andAttributedText:(NSAttributedString *)text andDirection:(RMTPopoverDirection)direction {
    
    self = [super init];
    if (self) {
        _tutAttText = text;
        _popPoint = point;
        _direction = direction;
        
        _attributed = true;
    }
    
    return self;
    
}

@end
