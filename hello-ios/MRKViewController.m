//
//  MRKViewController.m
//  hello-ios
//
//  Created by Mark Norgren on 1/11/14.
//  Copyright (c) 2014 Mark Norgren. All rights reserved.
//

#import "MRKViewController.h"

@interface MRKViewController ()
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UILabel *leftOperand;
@property (weak, nonatomic) IBOutlet UILabel *rightOperand;
@property (weak, nonatomic) IBOutlet UILabel *operator;
@property (strong, nonatomic) IBOutlet UIView *theView;

@end

@implementation MRKViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [self setNewCard];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)showAnswerPressed:(id)sender {
    NSLog(@"Show Answer Pressed");
    int answer = [self.leftOperand.text intValue] + [self.rightOperand.text intValue];
    
    self.answerLabel.text = [NSString stringWithFormat:@"%d", answer];
    
}
- (IBAction)nextCardPressed:(id)sender {
    
    //clear the answerLabel
    self.answerLabel.text = @"";
    //choose new random left and right numbers
    [self setNewCard];
}

-(void)setNewCard{
    //set numers
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
