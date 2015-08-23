//
//  RateView.h
//  Chally
//
//  Created by Vardan Abrahamyan on 3/22/15.
//
//

@class CustomSlider;

@interface RateViewController : UIViewController

@property (nonatomic, strong) UILabel *rateLabel;
@property (nonatomic, strong) UILabel *globalRateLabel;
@property (nonatomic, strong) UILabel *rateCategoryLabel;
@property (nonatomic, strong) UIImageView *smileImageView;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIButton *doneButton;
@property (nonatomic, strong) UISlider *rateSlider;

- (id)initWithFrame:(CGRect)frame;

@end
