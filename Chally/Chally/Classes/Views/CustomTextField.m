//
//  CustomTextField.m
//  Chally
//
//  Created by Vardan Abrahamyan on 6/14/15.
//
//

#import "CustomTextField.h"

@implementation CustomTextField

// placeholder position
- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , 10 , 10 );
}

// text position
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , 10 , 10 );
}

@end
