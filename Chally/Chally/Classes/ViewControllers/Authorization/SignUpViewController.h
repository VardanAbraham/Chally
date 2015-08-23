//
//  SignUpViewController.h
//  Chally
//
//  Created by Vardan Abrahamyan on 2/1/15.
//
//

@interface SignUpViewController : BaseViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *navigationLeftButton;
@property (weak, nonatomic) IBOutlet UIButton *navigationBarRightButton;

- (IBAction)popCurrentViewController:(id)sender;
- (IBAction)sendUserInfo:(UIButton*)sender;
@end
