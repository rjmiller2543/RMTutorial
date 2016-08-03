//
//  RMTutorial.m
//  Pods
//
//  Created by Robert Miller on 7/25/16.
//
//

#import "RMTutorial.h"
#import <DXPopoverKnockdownFork/DXPopover.h>

@interface RMTutorial ()

@property(nonatomic,retain) NSArray <RMTutorialSequence*> *tutorialSequence;

@property(nonatomic,retain) RMTutorialSequence *currentStep;

@property(nonatomic,retain) DXPopover *currentPopover;

@property(nonatomic,retain) UIView *inView;

@property(nonatomic) NSInteger index;

@property(nonatomic) BOOL isShowing;

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
        _buttonColor = [UIColor darkGrayColor];
        
        _continuousTutorial = YES;
        _isShowing = NO;
    }
    
    return self;
    
}

-(UIView*)popoverView {
    
    CGSize expectedLabelSize;
    if (_currentStep.attributed) {
        
        [_currentStep.tutAttText addAttribute:NSFontAttributeName value:_textFont range:NSMakeRange(0, [_currentStep.tutAttText length])];
        
        CGRect frame = [_currentStep.tutAttText boundingRectWithSize:MAX_SIZE options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSLineBreakByWordWrapping context:nil];
        expectedLabelSize = frame.size;
    }
    else {
        expectedLabelSize = [_currentStep.tutText sizeWithFont:_textFont constrainedToSize:MAX_SIZE lineBreakMode:NSLineBreakByWordWrapping];
    }
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, expectedLabelSize.width + 8, expectedLabelSize.height + 8)];
    view.backgroundColor = _backgroundColor;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(4, 4, expectedLabelSize.width, expectedLabelSize.height)];
    
    if (_currentStep.attributed) {
        label.attributedText = _currentStep.tutAttText;
    }
    else
        label.text = _currentStep.tutText;
    
    label.font = _textFont;
    label.textColor = _textColor;
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.textAlignment = NSTextAlignmentCenter;
    
    [view addSubview:label];
    
    return view;
    
}

-(void)dismissTut {
    [_currentPopover dismiss];
}

-(void)setupPopover {
    
    DXPopover *popover = [DXPopover popover];
    
    if (_currentStep.direction == RMTPopoverDirectionNone) {
        popover.backgroundColor = [UIColor clearColor];
        _currentStep.direction = RMTPopoverDirectionUp;
    }
    else {
        popover.backgroundColor = _backgroundColor;
        popover.animationBounce = YES;
    }
    
    popover.useDoneButton = YES;
    
    [popover showAtPoint:_currentStep.popPoint popoverPostion:_currentStep.direction withContentView:[self popoverView] inView:_inView];
    
    _currentPopover = popover;
    _isShowing = YES;
    
    popover.didDismissHandler = ^{
        _isShowing = NO;
        if (_continuousTutorial) {
            [self stepSequence];
        }
    };
    
}

-(void)startTutorialInView:(UIView *)view {
    
    _inView = view;
    _index = 0;
    
    if (_tutorialSequence == nil) {
        return;
    }
    _currentStep = [_tutorialSequence objectAtIndex:_index];
    
    [self setupPopover];
    
}

-(void)stepSequence {
    
    _index++;
    if (_index >= _tutorialSequence.count) {
        return;
    }
    _currentStep = [_tutorialSequence objectAtIndex:_index];
    
    [self setupPopover];
    
}

-(void)stepTutorial {
    if (!self.isShowing) {
        [self stepSequence];
    }
}

-(void)showStep:(NSInteger)step {
    
    if (!self.isShowing) {
        _index = step-1;
        [self stepSequence];
    }
}

-(BOOL)isShowing {
    return _isShowing;
}

@end
