//
//  BaseViewController.m
//  Chally
//
//  Created by Vardan Abrahamyan on 2/1/15.
//
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tabBarController.navigationItem setLeftBarButtonItem:nil];
    [self.tabBarController setTitle:@"Chally"];
    [self setNavigationBarLeftButton];
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)setNavigationBarLeftButton
{
    UIView *leftView = [[UIView alloc]  initWithFrame:CGRectMake(0, 0, 71, 33)];
    [leftView setBackgroundColor:[UIColor clearColor]];
    UIButton *leftNavigationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftNavigationButton setFrame:CGRectMake(0, 0, 81, 33)];
    [leftNavigationButton addTarget:self action:@selector(popCurrentViewController:) forControlEvents:UIControlEventTouchUpInside];
    [leftNavigationButton setImage:[UIImage imageNamed:@"backImage.png"] forState:UIControlStateNormal];
    [leftNavigationButton setImageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 5)];
    [leftNavigationButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [leftView addSubview:leftNavigationButton];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftView];
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
}

- (void)popCurrentViewController:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}



@end
