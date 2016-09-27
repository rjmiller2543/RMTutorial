//
//  RMTutorial.h
//  Pods
//
//  Created by Robert Miller on 7/25/16.
//
//

#import <Foundation/Foundation.h>
#import "RMTutorialSequence.h"

typedef void(^ButtonCallback)(BOOL done);
typedef void(^CompletionCallback)(BOOL done);

@interface RMTutorial : NSObject

@property(nonatomic,retain) UIColor *backgroundColor;
@property(nonatomic,retain) UIColor *textColor;
@property(nonatomic,retain) UIFont *textFont;
@property(nonatomic,retain) UIColor *buttonColor;

@property(nonatomic) BOOL continuousTutorial;

//Only affects Tutorial Sequence with a Direction other than None - Default is YES
@property(nonatomic) BOOL animated;
//Only affects Tutorial Sequence with a Direction other than None - Default is NO
@property(nonatomic) BOOL hasButton;
//Default is @"Got it"
@property(nonatomic,retain) NSString *buttonText;

//Default is nil
@property(nonatomic) ButtonCallback buttonCallback;

//Default is nil
@property(nonatomic) CompletionCallback completionCallback;

-(instancetype)initWithArray:(NSArray<RMTutorialSequence*>*)sequence;
-(void)startTutorialInView:(UIView *)view;
-(void)stepTutorial;
-(void)showStep:(NSInteger)step;
-(BOOL)isShowing;

@end
