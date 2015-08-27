//
//  CounditionViewController.m
//  Chally
//
//  Created by Vardan Abrahamyan on 5/17/15.
//
//

#import "CounditionViewController.h"

@interface CounditionViewController ()

@property (nonatomic, strong) UITextView *textView;

@end

@implementation CounditionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addUIElements];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:self.isPageTypePrivice ? @"privicy" : @"terms" ofType:@"txt"];
    
    NSString *text = [NSString stringWithContentsOfFile:path
                                                  encoding:NSASCIIStringEncoding
                                                     error:NULL];
    [self.textView setText:text];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationItem.title = self.isPageTypePrivice ? @"Privicy Policy" : @"Terms and Conditions";
}

#pragma mark - Custom methods

- (void)addUIElements
{
    [self.view addSubview:self.textView];
    
    [self setConstraints];
}

- (void)setConstraints
{
    [self.textView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)];
}

#pragma mark - Button Actions

- (void)popCurrentViewController:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Custom methods

#pragma mark - Initalization

- (UITextView *)textView
{
    if (!_textView) {
        _textView = [UITextView newAutoLayoutView];
        [_textView setEditable:NO];
        [_textView setTextColor:GRAY];
        [_textView setFont:SITEXTFONT];
        [_textView setTextAlignment:NSTextAlignmentCenter];
        [_textView setSelectable:NO];
    }
    return  _textView;
}


@end
