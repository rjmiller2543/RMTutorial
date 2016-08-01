//
//  RMTutorial.h
//  Pods
//
//  Created by Robert Miller on 7/25/16.
//
//

#import <Foundation/Foundation.h>
#import "RMTutorialSequence.h"

@interface RMTutorial : NSObject

@property(nonatomic,retain) UIColor *backgroundColor;
@property(nonatomic,retain) UIColor *textColor;
@property(nonatomic,retain) UIFont *textFont;
@property(nonatomic,retain) UIColor *buttonColor;

@property(nonatomic) BOOL continuousTutorial;

-(instancetype)initWithArray:(NSArray<RMTutorialSequence*>*)sequence;
-(void)startTutorialInView:(UIView *)view;
-(void)stepTutorial;
-(void)showStep:(NSInteger)step;
-(BOOL)isShowing;

@end
