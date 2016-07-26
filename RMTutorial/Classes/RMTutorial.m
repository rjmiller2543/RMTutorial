//
//  RMTutorial.m
//  Pods
//
//  Created by Robert Miller on 7/25/16.
//
//

#import "RMTutorial.h"
#import <DXPopover/DXPopover.h>

@interface RMTutorial ()

@property(nonatomic,retain) NSArray <RMTutorialSequence*> *tutorialSequence;

@property(nonatomic,retain) RMTutorialSequence *currentStep;

@property(nonatomic,retain) UIView *inView;

@property(nonatomic) NSInteger index;

@end

#define MAX_SIZE    CGSizeMake(2*[UIScreen mainScreen].bounds.size.width/3, 2*[UIScreen mainScreen].bounds.size.height/3)

@implementation RMTutorial

-(instancetype)initWithArray:(NSArray<RMTutorialSequence *> *)sequence {
    
    self = [super init];
    if (self) {
        _tutorialSequence = sequence;
        _backgroundColor = [UIColor lightGrayColor];
        _textColor = [UIColor whiteColor];
        _textFont = [UIFont systemFontOfSize:14.0f];
        
        _continuousTutorial = YES;
    }
    
    return self;
    
}

-(UIView*)popoverView {
    
    CGSize expectedLabelSize = [_currentStep.tutText sizeWithFont:[UIFont systemFontOfSize:14.0f] constrainedToSize:MAX_SIZE lineBreakMode:NSLineBreakByWordWrapping];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, expectedLabelSize.width + 8, expectedLabelSize.height + 8)];
    view.backgroundColor = _backgroundColor;
    
    UILabel *label = [[UILabel alloc] initWithFrame:view.frame];
    
    label.text = _currentStep.tutText;
    label.font = _textFont;
    label.textColor = _textColor;
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.textAlignment = NSTextAlignmentCenter;
    
    [view addSubview:label];
    
    return view;
    
}

-(void)startTutorialInView:(UIView *)view {
    
    _inView = view;
    _index = 0;
    
    if (_tutorialSequence == nil) {
        return;
    }
    _currentStep = [_tutorialSequence objectAtIndex:_index];
    
    DXPopover *popover = [DXPopover popover];
    
    if (_currentStep.direction == RMTPopoverDirectionNone) {
        popover.backgroundColor = [UIColor clearColor];
        _currentStep.direction = RMTPopoverDirectionUp;
    }
    else
        popover.backgroundColor = _backgroundColor;
    
    [popover showAtPoint:_currentStep.popPoint popoverPostion:_currentStep.direction withContentView:[self popoverView] inView:_inView];
    
    popover.didDismissHandler = ^{
        if (_continuousTutorial) {
            [self stepSequence];
        }
    };
    
}

-(void)stepSequence {
    
    _index++;
    if (_index >= _tutorialSequence.count) {
        return;
    }
    _currentStep = [_tutorialSequence objectAtIndex:_index];
    
    DXPopover *popover = [DXPopover popover];
    
    if (_currentStep.direction == RMTPopoverDirectionNone) {
        popover.backgroundColor = [UIColor clearColor];
        _currentStep.direction = RMTPopoverDirectionUp;
    }
    else
        popover.backgroundColor = _backgroundColor;
    
    [popover showAtPoint:_currentStep.popPoint popoverPostion:_currentStep.direction withContentView:[self popoverView] inView:_inView];
    popover.didDismissHandler = ^{
        if (_continuousTutorial) {
            [self stepSequence];
        }
    };
    
}

-(void)stepTutorial {
    [self stepSequence];
}

-(void)showStep:(NSInteger)step {
    _index = step--;
    [self stepSequence];
}

@end
