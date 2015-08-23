//
//  ChallangeSocilTypeViewController.h
//  Chally
//
//  Created by Vardan Abrahamyan on 7/13/15.
//
//

@protocol ChallangeSocialTypeDelegate <NSObject>

- (void)clickButtonAtTag:(NSInteger)tag;

@end

@interface ChallangeSocilTypeViewController : UIViewController

@property (nonatomic, strong) UIButton *firstButton;
@property (nonatomic, strong) UIButton *secondButton;
@property (nonatomic) id <ChallangeSocialTypeDelegate> delegate;

- (id)initWithFrame:(CGRect)frame;

@end
