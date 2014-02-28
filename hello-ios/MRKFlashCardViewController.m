//
//  MRKFlashCardViewController.m
//  hello-ios
//
//  Created by Mark Norgren on 2/26/14.
//  Copyright (c) 2014 Mark Norgren. All rights reserved.
//

#import "MRKFlashCardViewController.h"

@interface MRKFlashCardViewController ()

@property (strong, nonatomic) NSNumber *operand_one;
@property (strong, nonatomic) NSNumber *operand_two;
@property (strong, nonatomic) NSString *operator;
@property (strong, nonatomic) NSNumber *result;
@property (weak, nonatomic) IBOutlet UILabel *operandOneLabel;

@property (weak, nonatomic) IBOutlet UILabel *operatorLabel;
@property (weak, nonatomic) IBOutlet UILabel *operandTwoLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@end

@implementation MRKFlashCardViewController

-(id)init {
    self = [super init];
    NSLog(@"init");
    return self;
}

-(instancetype) initWithIndex:(NSUInteger)index {
    self = [super init];
    if (self) {
        self.operand_one = @5;
        self.operand_two = @10;
        self.operator = @"+";
        int result_int = [self.operand_one integerValue] + [self.operand_two integerValue];
        self.result = @(result_int);
        self.pageIndex = index;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.operand_one = @5;
        self.operand_two = @10;
        self.operator = @"+";
        int result_int = [self.operand_one integerValue] + [self.operand_two integerValue];
        self.result = @(result_int);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.operandOneLabel.text = [NSString stringWithFormat:@"%d", [self.operand_one integerValue]];
    self.operandTwoLabel.text = [NSString stringWithFormat:@"%d", [self.operand_two integerValue]];
    self.operatorLabel.text = self.operator;
    
    self.answerLabel.text = [NSString stringWithFormat:@"%d", [self.result integerValue]];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
