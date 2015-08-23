//
//  NearByViewController.m
//  Chally
//
//  Created by Vardan Abrahamyan on 3/1/15.
//
//

#import "NearByViewController.h"

@interface NearByViewController ()

@end

@implementation NearByViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tabBarController setTitle:@"Near By"];
}

@end
