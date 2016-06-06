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
				   
                   [NSArray arrayWithObjects:@"Question text label 1",
                    [NSArray arrayWithObjects:@"Answer1", @"Answer2", @"Answer3",nil], nil],
                   [NSArray arrayWithObjects:@"Question text label 2", [NSArray arrayWithObjects:@"Answer1", @"Answer2", @"Answer3",nil], nil],
                   [NSArray arrayWithObjects:@"Question text label 3", [NSArray arrayWithObjects:@"Answer1", @"Answer2", @"Answer3",nil], nil],
                   [NSArray arrayWithObjects:@"Question 4", [NSArray arrayWithObjects:@"Answer1", @"Answer2", @"Answer3",nil], nil],
                   [NSArray arrayWithObjects:@"Question text label 5", [NSArray arrayWithObjects:@"Answer1", @"Answer2", @"Answer3",nil], nil],
                   [NSArray arrayWithObjects:@"Question text label 6", [NSArray arrayWithObjects:@"Answer1", @"Answer2", @"Answer3",nil], nil],

                   nil];
    
    [self updateViewBackground];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    
    self.navigationController.navigationBar.translucent = NO;
    [self setCheckboxes];
	
	for (UIView * view in self.roundedCorners) {
		view.layer.cornerRadius = 15;
	}
	
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
	/*
    for (UIButton *checkbox in self.checkboxButtons) {
        BOOL isCurrentCheckboxSelected = (checkbox.tag==selectedCheckboxTag);
        [checkbox setSelected: isCurrentCheckboxSelected];
    }*/
	[self updateCheckBoxesWithSelectedTagNumber:selectedCheckboxTag];
}

- (void) updateCheckBoxesWithSelectedTagNumber: (NSInteger) selectedTagNumber {
	// every checkbox has its unique tag set by the developer
	// the range is 1..n
	// 0 means no checkbox selected
	for (UIButton *checkbox in self.checkboxButtons) {
		BOOL isCurrentCheckboxSelected = (checkbox.tag==selectedTagNumber);
		[checkbox setSelected: isCurrentCheckboxSelected];
	}
}

- (void) indicateRightAnswerWithTagNumber: (NSInteger) rightTagNumber andWrongTagNumber: (NSInteger) wrongTagNumber{
	// every label has its unique tag set by the developer
	// the range is 1..n
	// 0 means no label should be indicated
	for (UILabel *label in self.answerLabels) {
		if (label.tag == rightTagNumber) {
			label.textColor = [UIColor greenColor];
		} else if (label.tag == wrongTagNumber) {
			label.textColor = [UIColor redColor];
		} else {
			label.textColor = [UIColor blackColor];
		}
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
#warning Update this method to return the right value
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
			
			[UIView animateWithDuration:0.5 animations:^{
				self.questionBlockView.alpha = 0.5;
			} completion:^(BOOL finished) {
				
				selectedCheckboxTag = 0;
				[self indicateRightAnswerWithTagNumber:0 andWrongTagNumber:0];
				[self updateCheckBoxesWithSelectedTagNumber:selectedCheckboxTag];
				self.questionBlockView.alpha = 1;
			}];
        }
		
    } else {
		// the answers are in range 0..n-1
		// but the tags are in 1..n
		NSInteger rightAnswer = [self getRightAnswerForTheQuestion:lastTestQuestion] + 1;
		
		[self indicateRightAnswerWithTagNumber:rightAnswer andWrongTagNumber:(rightAnswer == selectedCheckboxTag)?0:selectedCheckboxTag];
#warning Add point to the testResult in NSUserDefaults
		
    }
     answerAccepted = !answerAccepted;
}



@end
