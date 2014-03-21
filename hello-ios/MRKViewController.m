//
//  MRKViewController.m
//  hello-ios
//
//  Created by Mark Norgren on 1/11/14.
//  Copyright (c) 2014 Mark Norgren. All rights reserved.
//

#import "MRKViewController.h"
#import "MRKFlashCardViewController.h"

@interface MRKViewController ()
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UILabel *leftOperand;
@property (weak, nonatomic) IBOutlet UILabel *rightOperand;
@property (weak, nonatomic) IBOutlet UILabel *operator;
@property (strong, nonatomic) IBOutlet UIView *theView;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (weak, nonatomic) IBOutlet UIView *vcContainer;
@property (strong, nonatomic) UIPageViewController *pageViewController;

@end

@implementation MRKViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [self setNewCard];
	
    // Create page view controller
    self.pageViewController.dataSource = self;
    
    MRKFlashCardViewController *startingVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FlashCardViewController"];
    NSArray *viewControllers = @[startingVC];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
//    self.vcContainer = self.pageViewController.view;

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

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(UIViewController *)viewController
{
//    NSUInteger index = ((MRKFlashCardViewController*) viewController).pageIndex;
//    
//    if ((index == 0) || (index == NSNotFound)) {
//        return nil;
//    }
//    
//    index--;
//    MRKFlashCardViewController *startingVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FlashCardViewController"];

    return nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
       viewControllerAfterViewController:(UIViewController *)viewController
{
//    NSUInteger index = ((MRKFlashCardViewController*) viewController).pageIndex;
//    
//    if (index == NSNotFound) {
//        return nil;
//    }
//
//    index++;
//    if (index == [self.pageTitles count]) {
//        index = 0;
//        return [self viewControllerAtIndex:index];
//    }
    MRKFlashCardViewController *startingVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FlashCardViewController"];

    return startingVC;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"embedContainer"]) {
        self.pageViewController = segue.destinationViewController;
    }
}

//- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
//{
//    return [self.pageTitles count];
//}
//
//- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
//{
//    return 0;
//}

@end
