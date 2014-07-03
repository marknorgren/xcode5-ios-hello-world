//
//  MRKFlashCardViewController.m
//  hello-ios
//
//  Created by Mark Norgren on 2/26/14.
//  Copyright (c) 2014 Mark Norgren. All rights reserved.
//

#import "MRKFlashCardViewController.h"
#import <QuartzCore/QuartzCore.h>
#include <stdlib.h>

@interface MRKFlashCardViewController ()

@property (strong, nonatomic) NSNumber *operand_one;
@property (strong, nonatomic) NSNumber *operand_two;
@property (strong, nonatomic) NSString *operator;
@property (strong, nonatomic) NSNumber *result;
@property (weak, nonatomic) IBOutlet UILabel *operandOneLabel;

@property (weak, nonatomic) IBOutlet UILabel *operatorLabel;
@property (weak, nonatomic) IBOutlet UILabel *operandTwoLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UIView *answerOutlineView;
@property (weak, nonatomic) IBOutlet UIView *answerRoundRectView;

@end

@implementation MRKFlashCardViewController


// init called when created from Storyboard
-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // round corners
    self.answerRoundRectView.layer.cornerRadius = 10.0;
    self.answerRoundRectView.layer.masksToBounds = YES;
    
    int r_one = arc4random() % 100;
    int r_two = arc4random() % 100;
    self.operand_one = [NSNumber numberWithInt:r_one];
    self.operand_two = [NSNumber numberWithInt:r_two];
    self.operator = @"+";
    int result_int = [self.operand_one integerValue] + [self.operand_two integerValue];
    self.result = @(result_int);
    
    // random backgroun color
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    self.view.backgroundColor = color;
    
    self.answerLabel.hidden = YES;
    self.operandOneLabel.text = [self.operand_one stringValue];
    self.operandTwoLabel.text = [self.operand_two stringValue];
    self.operatorLabel.text = self.operator;
    
    self.answerLabel.text = [NSString stringWithFormat:@"%d", [self.result integerValue]];
    
    
    UITapGestureRecognizer *showAnswerGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                                  action:@selector(showAnswer:)];
    showAnswerGestureRecognizer.numberOfTapsRequired = 2;
    self.answerLabel.userInteractionEnabled = YES;
    [self.answerOutlineView addGestureRecognizer:showAnswerGestureRecognizer];
    // Do any additional setup after loading the view.
}

-(void)showAnswer:(UILabel*)theLabel {
    self.answerLabel.hidden = NO;
    [self.answerLabel setNeedsDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
