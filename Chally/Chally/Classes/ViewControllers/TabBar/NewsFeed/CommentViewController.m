//
//  CommentViewController.m
//  Chally
//
//  Created by Vardan Abrahamyan on 4/5/15.
//
//

#import "CommentViewController.h"
#import "CommentCell.h"
#import "CustomTextField.h"
#import "UIButton+AFNetworking.h"
#import "UIScrollView+SVInfiniteScrolling.h"

CGFloat _keyboardHeight = 224.0f;

@interface CommentViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
{
    NSMutableArray *comments;
    UIRefreshControl *refreshControl;
    BOOL keyboardClosed;
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *inputView;
@property (nonatomic, strong) CustomTextField *commentsField;
@property (nonatomic, strong) NSLayoutConstraint *inputViewBottomConstraints;
@property (nonatomic, strong) NSLayoutConstraint *tableHeightConstraint;
@property (nonatomic, strong) UIButton *sendCommentButton;
@end

@implementation CommentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    comments = [NSMutableArray array];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.inputView];
    [self.inputView addSubview:self.commentsField];
    [self.inputView addSubview:self.sendCommentButton];
    
    [self setConstraints];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    //    [self getComments];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameWillChange:)
                                                 name:UIKeyboardWillChangeFrameNotification object:nil];
    
    [self addRefreshControl];
    
    __strong typeof(self) weakSelf = self;
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        [weakSelf.tableView.infiniteScrollingView stopAnimating];
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationItem setTitle:@"Comment"];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
    
    [super viewWillDisappear:animated];
}

- (void)setConstraints
{
    [self.tableView autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.tableView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.tableView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    self.tableHeightConstraint = [self.tableView autoSetDimension:ALDimensionHeight toSize:self.view.frame.size.height - 50];
    
    [self.inputView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.inputView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.inputView autoSetDimension:ALDimensionHeight toSize:50.0];
    [self.inputView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.tableView];
    
    UIImageView *lineImageView = [UIImageView newAutoLayoutView];
    [self.inputView addSubview:lineImageView];
    [lineImageView autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [lineImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [lineImageView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [lineImageView autoSetDimension:ALDimensionHeight toSize:1.0];
    [lineImageView setImage:[UIImage imageNamed:@"line.png"]];
    
    [self.commentsField autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.commentsField autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:1.0];
    [self.commentsField autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [self.commentsField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:50];
    
    [self.sendCommentButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:15.0];
    [self.sendCommentButton autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.sendCommentButton autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [self.sendCommentButton autoSetDimension:ALDimensionWidth toSize:20.0];
}

#pragma mark - Custom methods


- (void)addRefreshControl
{
    refreshControl = [UIRefreshControl newAutoLayoutView];
    refreshControl.backgroundColor = [UIColor whiteColor];
    [refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
}

- (void)refresh
{
    [self.tableView setShowsInfiniteScrolling:YES];
    [refreshControl endRefreshing];
}

#pragma mark - API

- (void)getComments
{
    [[APIHelper sharedAPIHelper] getCommentsWithParams:@{@"here" : @"info"} constructingBodyWithBlock:^(NSDictionary *data, NSError *error) {
        if (data && !error) {
            for (NSDictionary *comment in [data valueForKey:@"comments"]) {
                [comments addObject:comment];
            }
            [self.tableView reloadData];
        }
    }];
}

#pragma mark - Button Actions

- (void)sendComment:(UIButton *)sender
{
    if ([Utils isValidTextField:self.commentsField]) {
        keyboardClosed = YES;
        [self.commentsField resignFirstResponder];
    }
    [self.commentsField setText:@""];
}

#pragma mark - Textfield delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    keyboardClosed = YES;
    [self.commentsField resignFirstResponder];
    
    return YES;
}
#pragma mark - TableView DataSource's

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"commentCell";
    
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[CommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.commentTextLabel.text = indexPath.row%2 == 0 ? @"bcsjcb hdsb hj bh bfdhjc bjdscbhj bhbsf bivb ibv bbdhbf hjbd fhjvb hj hdjh bdfjhb hjdfbv hdhjf b jjdfv jhdf hjd kj k k fhj v dljv bdjhfv dnfv j yuyycfgcfcfcjcfcjfcjfcjfgcjfgcjfgcjfgcjfgcjfgcfj" : @"cdscgvch";
    [cell.userImageButton setImageForState:UIControlStateNormal withURL:[NSURL URLWithString:@"http://i.ytimg.com/vi/7UOSFN1OOF0/maxresdefault.jpg"]];
    [cell.dateLabel setText:@"Just now"];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

#pragma mark - Keyboard notifications

-(void)keyboardFrameWillChange:(NSNotification *)notification
{
    if (keyboardClosed) {
        self.tableHeightConstraint.constant = self.view.frame.size.height - 50;
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        keyboardClosed = NO;
    } else {
        CGRect keyboardFrame = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
        self.tableHeightConstraint.constant = self.view.frame.size.height - keyboardFrame.size.height- 50;
        [self.navigationController setNavigationBarHidden:keyboardFrame.size.height > _keyboardHeight animated:YES];
    }
    
    [self.tableView setNeedsUpdateConstraints];
    [self.inputView setNeedsUpdateConstraints];
    [UIView animateWithDuration:0.25f animations:^{
        [self.tableView layoutIfNeeded];
        [self.inputView layoutIfNeeded];
    }];
}


#pragma mark - Initalization

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.translatesAutoresizingMaskIntoConstraints = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        _tableView.multipleTouchEnabled = NO;
        _tableView.allowsMultipleSelection = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView setBackgroundColor:[UIColor whiteColor]];
        _tableView.estimatedRowHeight = PD_CELL_HEIGHT;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        [_tableView registerClass:[CommentCell class] forCellReuseIdentifier:@"commentCell"];
    }
    return _tableView;
}

- (UIView *)inputView
{
    if (!_inputView) {
        _inputView = [UIView newAutoLayoutView];
        [_inputView setBackgroundColor:[UIColor whiteColor]];
    }
    return _inputView;
}

- (CustomTextField *)commentsField
{
    if (!_commentsField) {
        _commentsField = [CustomTextField newAutoLayoutView];
        [_commentsField setDelegate:self];
        [_commentsField setTextColor:[UIColor darkGrayColor]];
        [_commentsField setPlaceholder:@"Say Something Nice!"];
        [_commentsField setFont:[UIFont systemFontOfSize:13.0]];
    }
    return _commentsField;
}

- (UIButton *)sendCommentButton
{
    if (!_sendCommentButton) {
        _sendCommentButton = [UIButton newAutoLayoutView];
        [_sendCommentButton setImage:[UIImage imageNamed:@"createChally.png"] forState:UIControlStateNormal];
        [_sendCommentButton setImageEdgeInsets:UIEdgeInsetsMake(15.0, 0, 15.0, 0)];
        [_sendCommentButton addTarget:self action:@selector(sendComment:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendCommentButton;
}
@end
