//
//  RMTViewController.m
//  RMTutorial
//
//  Created by rjmiller2543 on 07/25/2016.
//  Copyright (c) 2016 rjmiller2543. All rights reserved.
//

#import "RMTViewController.h"
#import <RMTutorial/RMTutorial.h>

@interface RMTViewController ()

@property(nonatomic,retain) RMTutorial *tut;

@end

@implementation RMTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated {
    
    RMTutorialSequence *startSeq = [[RMTutorialSequence alloc] initWithPoint:self.view.center andText:@"Let's get started.." andDirection:RMTPopoverDirectionNone];
    RMTutorialSequence *firstSeq = [[RMTutorialSequence alloc] initWithPoint:_first.frame.origin andText:@"This is the First Button" andDirection:RMTPopoverDirectionDown];
    RMTutorialSequence *secondSeq = [[RMTutorialSequence alloc] initWithPoint:_second.frame.origin andText:@"This is the First Button" andDirection:RMTPopoverDirectionUp];
    RMTutorialSequence *thirdSeq = [[RMTutorialSequence alloc] initWithPoint:CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height) andText:@"Third Step" andDirection:RMTPopoverDirectionUp];
    
    NSTextAttachment *textImage = [[NSTextAttachment alloc] init];
    textImage.image = [UIImage imageNamed:@"palette"];
    
    NSAttributedString *attString = [NSAttributedString attributedStringWithAttachment:textImage];
    
    NSMutableAttributedString *theString = [[NSMutableAttributedString alloc] initWithString:@"Here is an attributed string to use with an inline image i"];
    
    [theString replaceCharactersInRange:NSMakeRange(57, 1) withAttributedString:attString];
    
    RMTutorialSequence *fourthSeq = [[RMTutorialSequence alloc] initWithPoint:CGPointMake(self.view.frame.size.width / 2, 2 *self.view.frame.size.height / 3) andAttributedText:theString andDirection:RMTPopoverDirectionNone];
    
    RMTutorialSequence *finalSeq = [[RMTutorialSequence alloc] initWithPoint:CGPointMake(self.view.frame.size.width / 2, 2 *self.view.frame.size.height / 3) andText:@"This is a very long string just to see what exactly happens, if it stretches across the whole damn screen, or does something somewhat intelligently..  Crossing Fingers..  And now i want to make it even longer, i'm hoping that it doesn't just run off of the screen at some point in time because it seems to want to anchor to a particular point and not move beyond that..  And apparently I still need it to be just a bit longer still.. Wow.. Crazy how much text I can actually put in here to get it to stretch.." andDirection:RMTPopoverDirectionNone];
    
    _tut = [[RMTutorial alloc] initWithArray:@[startSeq,firstSeq, secondSeq, thirdSeq, fourthSeq, finalSeq]];
    //_tut.continuousTutorial = NO;
    [_tut startTutorialInView:self.view];
    
}

-(void)nextStep:(id)sender {
    
    [_tut stepTutorial];
    
}

@end
