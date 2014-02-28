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

@property (strong, nonatomic) UIPageViewController *pageViewController;

@end

@implementation MRKViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [self setNewCard];
	
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    
    
    
    MRKFlashCardViewController *startingViewController = [[MRKFlashCardViewController alloc] initWithIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    

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

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((MRKFlashCardViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [[MRKFlashCardViewController alloc] initWithIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((MRKFlashCardViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
//    if (index == [self.pageTitles count]) {
//        index = 0;
//        return [self viewControllerAtIndex:index];
//    }
    return [[MRKFlashCardViewController alloc] initWithIndex:index];
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
