//
//  TestPageViewController.m
//  SwissPlanner
//
//  Created by Anastasiya Yarovenko on 02.06.16.
//  Copyright © 2016 Elena Baoychuk. All rights reserved.
//

#import "TestPageViewController.h"
#import "TestsPageContentViewController.h"

#import "PlatformTypeChecker.h"

typedef enum {
    questionItem,
    answersArrayItem
} pageContentItems;

@implementation TestPageViewController {
    NSArray *pageContent;
    NSInteger lastTestQuestion;
    NSInteger testResult;
    NSUserDefaults *defaults;
    
    NSInteger nextFlag;
    
    NSInteger selectedCheckboxTag;
    BOOL answerAccepted;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    pageContent = [NSArray arrayWithObjects:
				   
                   [NSArray arrayWithObjects:@"Question 1",
                    [NSArray arrayWithObjects:@"Answer1", @"Answer2", @"Answer3",nil], nil],
                   [NSArray arrayWithObjects:@"Question 2", [NSArray arrayWithObjects:@"Answer1", @"Answer2", @"Answer3",nil], nil],
                   [NSArray arrayWithObjects:@"Question 3", [NSArray arrayWithObjects:@"Answer1", @"Answer2", @"Answer3",nil], nil],
                   [NSArray arrayWithObjects:@"Question 4", [NSArray arrayWithObjects:@"Answer1", @"Answer2", @"Answer3",nil], nil],
                   [NSArray arrayWithObjects:@"Question 5", [NSArray arrayWithObjects:@"Answer1", @"Answer2", @"Answer3",nil], nil],
                   [NSArray arrayWithObjects:@"Question 6", [NSArray arrayWithObjects:@"Answer1", @"Answer2", @"Answer3",nil], nil],

                   nil];
    
    [self updateViewBackground];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    
    self.navigationController.navigationBar.translucent = NO;
    [self setCheckboxes];
    
    defaults = [NSUserDefaults standardUserDefaults];
}

- (void) setCheckboxes {
    for (UIButton *checkbox in self.checkboxButtons) {
        // setting the checkbox
        [checkbox setBackgroundImage:[UIImage imageNamed:@"notselectedcheckbox.png"]
                             forState:UIControlStateNormal];
        [checkbox setBackgroundImage:[UIImage imageNamed:@"selectedcheckbox.png"]
                             forState:UIControlStateSelected];
        [checkbox setBackgroundImage:[UIImage imageNamed:@"selectedcheckbox.png"]
                             forState:UIControlStateHighlighted];
        checkbox.adjustsImageWhenHighlighted=YES;
    }
}

- (IBAction)checkboxButtonClicked:(id)sender {
    UIButton *currentlySelectedCheckbox = (UIButton *)sender;
    NSInteger currentlySelectedCheckboxTag = currentlySelectedCheckbox.tag;
    selectedCheckboxTag = currentlySelectedCheckboxTag;
    for (UIButton *checkbox in self.checkboxButtons) {
        BOOL isCurrentCheckboxSelected = (checkbox.tag==selectedCheckboxTag);
        [checkbox setSelected: isCurrentCheckboxSelected];
    }
}


- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    lastTestQuestion = [[defaults objectForKey:@"lastTestQuestion"] integerValue];
    
    [self jumpToTheLastVisitedSlide];
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
   
    [defaults setObject:[NSNumber numberWithInteger:lastTestQuestion] forKey:@"lastTestQuestion"];
}

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers {
    lastTestQuestion = [(TestsPageContentViewController *)[pendingViewControllers objectAtIndex:0] pageIndex];
}

- (void) jumpToTheLastVisitedSlide {
    [self jumpToQuestion:lastTestQuestion];
    
}

- (void) jumpToQuestion: (NSInteger) questionNumber {
    
    self.questionNumberIndicatorLabel.text = [NSString stringWithFormat:@"Question %d of %d", (lastTestQuestion + 1), [pageContent count]];
    
    //setting the layout
    self.questionTextLabel.text = [[pageContent objectAtIndex:questionNumber] objectAtIndex:questionItem];
    self.question1Label.text = [[[pageContent objectAtIndex:questionNumber] objectAtIndex:answersArrayItem] objectAtIndex:0];
     self.question2Label.text = [[[pageContent objectAtIndex:questionNumber] objectAtIndex:answersArrayItem] objectAtIndex:1];
     self.question3Label.text = [[[pageContent objectAtIndex:questionNumber] objectAtIndex:answersArrayItem] objectAtIndex:2];
}

- (void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    // before rotation
    
    [coordinator animateAlongsideTransition:^(id  _Nonnull context) {
        // during rotation
        [self updateViewBackground];
    } completion:^(id  _Nonnull context) {
        
        // after rotation
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((TestsPageContentViewController*) viewController).pageIndex;
     self.questionNumberIndicatorLabel.text = [NSString stringWithFormat:@"Question %d of %d", (index + 1), [pageContent count]];
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    
    NSUInteger index = ((TestsPageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    self.questionNumberIndicatorLabel.text = [NSString stringWithFormat:@"%d/%d", (index + 1), [pageContent count]];
    
    index++;
    
    if (index == [pageContent count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (TestsPageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    
    if (index >= [pageContent count]) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    TestsPageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TestsPageContentViewController"];
    
    pageContentViewController.testCheckerDelegate = self;
    pageContentViewController.question = [[pageContent objectAtIndex:index] objectAtIndex:0];
    pageContentViewController.answers = [[pageContent objectAtIndex:index] objectAtIndex:1];
    
    pageContentViewController.pageIndex = index;
    //lastTestQuestion = index;
    
    return pageContentViewController;
}



- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    //return [pageContent count];
    return 0;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return lastTestQuestion;
}


- (void) updateViewBackground {
    NSString *platform = [PlatformTypeChecker platformType];
    if ([platform isEqualToString:@"iPhone 6"]||[platform isEqualToString:@"iPhone 6S"]/*||[platform isEqualToString:@"Simulator"]*/) {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background(gifts)_iphone6"]];
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar_iphone6"] forBarMetrics:UIBarMetricsDefault];
    } else {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background(gifts)"]];
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar"] forBarMetrics:UIBarMetricsDefault];
    }
}

#pragma mark - Test checker delegate methods

- (NSInteger) getRightAnswerForTheQuestion:(NSInteger)questionNumber {
    return 0;
}


- (IBAction)activeButtonClicked:(id)sender {
   
    [self.activeButton setBackgroundImage:[UIImage imageNamed:(!answerAccepted?@"next_question":@"accept_answer")] forState:UIControlStateNormal];
   
    if (answerAccepted) {
        if ([pageContent count]==(lastTestQuestion+1)) {
            lastTestQuestion = 0;
            [self.navigationController popViewControllerAnimated:YES];
        } else {
            lastTestQuestion ++;
            [self jumpToQuestion:lastTestQuestion];
        }
    } else {
        
        
        selectedCheckboxTag = 0;
    }
     answerAccepted = !answerAccepted;
}
@end
