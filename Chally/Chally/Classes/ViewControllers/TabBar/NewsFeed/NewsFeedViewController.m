//
//  NewsFeedViewController.m
//  Chally
//
//  Created by Vardan Abrahamyan on 3/1/15.
//
//

#import "NewsFeedViewController.h"
#import "CommentViewController.h"
#import "UserProfileViewController.h"
#import "FeedCell.h"
#import "RateViewController.h"
#import "RespondViewController.h"
#import "ShareViewController.h"
#import "UIScrollView+SVInfiniteScrolling.h"
#include <math.h>

@interface NewsFeedViewController () <UITableViewDataSource, UITableViewDelegate>
{
    UIRefreshControl *refreshControl;
    RateViewController *rateVC;
}
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation NewsFeedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self setConstraints];
    [self addRefreshControl];
    
    __strong typeof(self) weakSelf = self;
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        [weakSelf.tableView.infiniteScrollingView stopAnimating];
    }];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tabBarController setTitle:@"Chally"];
}

- (void)setConstraints
{
    [self.tableView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [self.tableView autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.tableView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.tableView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
}

#pragma mark - Custom methods

- (void)addRefreshControl
{
    refreshControl = [UIRefreshControl newAutoLayoutView];
    refreshControl.backgroundColor = [UIColor whiteColor];
    refreshControl.tintColor = GRAY_17;
    [refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
}

- (void)refresh
{
    [self.tableView setShowsInfiniteScrolling:YES];
    [refreshControl endRefreshing];
}

#pragma mark - Actions

- (void)showRateView:(UIButton*)button
{
    rateVC= [[RateViewController alloc] initWithFrame:self.view.frame];
    [rateVC.rateSlider addTarget:self action:@selector(sliderValueChnaged:) forControlEvents:UIControlEventValueChanged];
    rateVC.providesPresentationContextTransitionStyle = true;
    rateVC.definesPresentationContext = true;
    rateVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self.tabBarController.navigationController presentViewController:rateVC animated:NO completion:nil];
}

- (void)showRespondView:(UIButton*)button
{
    RespondViewController *responseVC = [[RespondViewController alloc] initWithFrame:self.view.frame];
    responseVC.providesPresentationContextTransitionStyle = true;
    responseVC.definesPresentationContext = true;
    responseVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;

    [self.tabBarController.navigationController presentViewController:responseVC animated:NO completion:nil];
}

- (void)showShareView:(UIButton *)button
{
    ShareViewController *shareVC = [[ShareViewController alloc] initWithFrame:self.view.frame];
    shareVC.providesPresentationContextTransitionStyle = true;
    shareVC.definesPresentationContext = true;
    shareVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self.tabBarController.navigationController presentViewController:shareVC animated:NO completion:nil];
}

- (void)rateChallange:(UIButton*)button
{

}


- (void)openCommentsView:(UIButton *)button
{
    CommentViewController *commentsVC = [CommentViewController new];
    [self.tabBarController.navigationController pushViewController:commentsVC animated:YES];
}

- (void)openUserProfile:(UIButton *)button
{
    UserProfileViewController *userProfileVC = [UserProfileViewController new];
    [userProfileVC.imageView setImage:button.imageView.image];
    [self.tabBarController.navigationController pushViewController:userProfileVC animated:YES];
}

- (void)sliderValueChnaged:(UISlider *)slider
{
    int imageNumber = ceil(slider.value/2) == 0 ? 1 : ceil(slider.value/2);
    
    UIImage * toImage =  [UIImage imageNamed:[NSString stringWithFormat:@"Emoticon%i.png",imageNumber]];
    [UIView transitionWithView:rateVC.smileImageView
                      duration:0.20f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        rateVC.smileImageView.image = toImage;
                    } completion:nil];

    [rateVC.rateLabel setText:[NSString stringWithFormat:@"%.01f", ceil(slider.value)]];
}

#pragma mark - TableView DataSource's

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"feedCell";

    FeedCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[FeedCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    [cell.challangeDescriptionLabel setText:@"Lorem ispum dolor sit amet, #constectur adipsicing elit, sed do, eiusmid tempor incidudnt ut labor et dolore magna aliqua ut enim ad"];
    [cell.locationButton setTitle:@"Yerevan, Armenia" forState:UIControlStateNormal];
    [cell.challangeImageView setImageWithURL:[NSURL URLWithString:@"http://i.ytimg.com/vi/7UOSFN1OOF0/maxresdefault.jpg"]];
    [cell.avatarButton setImageForState:UIControlStateNormal withURL:[NSURL URLWithString:@"https://pbs.twimg.com/profile_images/1817180934/new_Profile_pic_400x400.jpg"]];
    [cell.avatarButton addTarget:self action:@selector(openUserProfile:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.raitingButton addTarget:self action:@selector(showRateView:) forControlEvents:UIControlEventTouchUpInside];
    [cell.raitingButton setTag:indexPath.row];
    
    [cell.respondButton addTarget:self action:@selector(showRespondView:) forControlEvents:UIControlEventTouchUpInside];
    [cell.respondButton setTag:indexPath.row];
    
    [cell.responsesButton addTarget:self action:@selector(showShareView:) forControlEvents:UIControlEventTouchUpInside];
    [cell.responsesButton setTag:indexPath.row];
    
    [cell.commentsButton addTarget:self action:@selector(openCommentsView:) forControlEvents:UIControlEventTouchUpInside];
    [cell.commentsButton setTag:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NF_CELL_HEIGHT;
}

#pragma mark - Initalization

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [UITableView newAutoLayoutView];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        _tableView.multipleTouchEnabled = NO;
        _tableView.allowsMultipleSelection = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView setBackgroundColor:[UIColor lightGrayColor]];
        [_tableView registerClass:[FeedCell class] forCellReuseIdentifier:@"feedCell"];
    }
    return _tableView;
}


@end
