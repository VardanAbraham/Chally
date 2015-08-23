//
//  Settings.h
//  FrontPageIt
//
//  Created by Andranik Asilbekyan on 5/26/15.
//  Copyright (c) 2015 VTGSoftware LLC. All rights reserved.
//

#ifndef FrontPageIt_Settings_h
#define FrontPageIt_Settings_h


#define kNotImplementedAlert() [[[UIAlertView alloc] initWithTitle:@"FrontPage" message:@"Not implemented" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show]
#define NULL_TO_NIL(obj)        ({ __typeof__ (obj) __obj = (obj); __obj == [NSNull null] ? nil : obj; })

//Constants
#define IPHONE_5_4_SCALE        568  / 736
#define IPHONE_6_SCALE          667  / 736
#define IPAD_SCALE              1024 / 736
#define FEED_LIMIT              @"10"
#define COMMENTS_LIMIT          @"10"
#define FEED_OFFSET             10

//Device and System Version
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_4 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 480.0f)
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define IS_IPHONE_6 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0)
#define IS_IPHONE_6_PLUS (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0)
#define IS_IOS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)


//Colors
#define GRAY_17                 [UIColor colorWithRed:44.f/255.f green:44.f/255.f blue:44.f/255.f alpha:1.f]
#define BLUE                    [UIColor colorWithRed:51.f/255.f green:122.f/255.f blue:183.f/255.f alpha:1.f]
#define LIGHT_BLUE              [UIColor colorWithRed:38/255.f   green:150/255.f   blue:191/255.f alpha:1.f]
#define LIGHT_GRAY              [UIColor colorWithRed:220/255.f  green:220/255.f   blue:220/255.f alpha:1.f]
#define GRAY                    [UIColor colorWithRed:200/255.f  green:200/255.f   blue:200/255.f alpha:1.f]
#define DARK_GRAY               [UIColor colorWithRed:90/255.f  green:90/255.f   blue:90/255.f alpha:1.f]
#define GRAY_POST_CORNER        [UIColor colorWithRed:208/255.f  green:208/255.f   blue:208/255.f alpha:1.f]
#define TEXTFIELD_TINT_COLOR    [UIColor colorWithRed:42.0/255.0f green:110.0/255.0f blue:235.0/255.0f alpha:1.0]
#define LIGHTBLUE               [UIColor colorWithRed:0.0/255.0f green:182.0/255.0f blue:203.0/255.0f alpha:1.0f]

#define TOP_BARS_HEIGHT         64
#define OPENSANS_LIGHT           [UIFont fontWithName:@"OpenSans" size:FONTSIZE]
#define OPENSANS_REGULIAR        [UIFont fontWithName:@"OpenSans-Semibold" size:BUTTONFONTSIZE]
#define OPENSANS_SEMIBOLD        [UIFont fontWithName:@"OpenSans-Semibold" size:FONTSIZE]

//Authorisation constraints

//Register constants
#define ROFFSET                 IS_IPAD ? 10    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 10   : IS_IPHONE_6 ? 10 * IPHONE_6_SCALE : 10  * IPHONE_5_4_SCALE

//Sign In constants

#define SICONTAINERHEIGHT        IS_IPAD ? 250   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 250   : IS_IPHONE_6 ? 250 * IPHONE_6_SCALE : 202  * IPHONE_5_4_SCALE
#define SIOFFSET                 IS_IPAD ? 15    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 15   : IS_IPHONE_6 ? 15 * IPHONE_6_SCALE : 15  * IPHONE_5_4_SCALE
#define SIFIELD_HEIGHT           50.0
#define SIFONTSIZE               IS_IPAD ? 17    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 17    : IS_IPHONE_6 ? 17  * IPHONE_6_SCALE : 17   * IPHONE_5_4_SCALE
#define SITEXTFONT              [UIFont fontWithName:@"OpenSans" size:SIFONTSIZE]
#define SIINSET                 IS_IPAD ? 120   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 120   : IS_IPHONE_6 ? 75 * IPHONE_6_SCALE : 75  * IPHONE_5_4_SCALE

//Constants For All Pages
#define BTN_BIG_WIDTH           IS_IPAD ? 202   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 202   : IS_IPHONE_6 ? 202 * IPHONE_6_SCALE : 202  * IPHONE_5_4_SCALE
#define BTN_BIG_HEIGHT          IS_IPAD ? 41    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 41    : IS_IPHONE_6 ? 41  * IPHONE_6_SCALE : 41   * IPHONE_5_4_SCALE
#define BTN_SMALL_WIDTH         IS_IPAD ? 150   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 150   : IS_IPHONE_6 ? 150 * IPHONE_6_SCALE : 150  * IPHONE_5_4_SCALE
#define BTN_SMALL_HEIGHT        IS_IPAD ? 38    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 38    : IS_IPHONE_6 ? 38  * IPHONE_6_SCALE : 38   * IPHONE_5_4_SCALE
#define TITLE_FONTSIZE          IS_IPAD ? 24    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 24    : IS_IPHONE_6 ? 24  * IPHONE_6_SCALE : 24   * IPHONE_5_4_SCALE
#define TITLE_FONT              [UIFont boldSystemFontOfSize:TITLE_FONTSIZE]
#define FONTSIZE                IS_IPAD ? 16    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 16    : IS_IPHONE_6 ? 16  * IPHONE_6_SCALE : 16   * IPHONE_5_4_SCALE
#define NAVIGATIONFONTSIZE      IS_IPAD ? 20    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 20    : IS_IPHONE_6 ? 20  * IPHONE_6_SCALE : 20   * IPHONE_5_4_SCALE
#define BUTTONFONTSIZE          IS_IPAD ? 22    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 22    : IS_IPHONE_6 ? 22  * IPHONE_6_SCALE : 22   * IPHONE_5_4_SCALE

#define DESC_FONT               [UIFont systemFontOfSize:DESC_FONTSIZE]
 

//Constants For Welcom Page

#define LOGO_WIDTH              IS_IPAD ? 267.2   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 267.2   : IS_IPHONE_6 ? 267.2 * IPHONE_6_SCALE : 267.2  * IPHONE_5_4_SCALE
#define LOGO_HEIGHT             IS_IPAD ? 70.4    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 70.4    : IS_IPHONE_6 ? 70.4  * IPHONE_6_SCALE : 70.4   * IPHONE_5_4_SCALE
#define WELCOME_INSET           IS_IPAD ? 100   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 100   : IS_IPHONE_6 ? 100 * IPHONE_6_SCALE : 100  * IPHONE_5_4_SCALE
#define WELCOME_BTN_WIDTH       IS_IPAD ? 258   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 258   : IS_IPHONE_6 ? 258 * IPHONE_6_SCALE : 258  * IPHONE_5_4_SCALE
#define WELCOME_BTN_HEIGHT      IS_IPAD ? 60    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 60    : IS_IPHONE_6 ? 60  * IPHONE_6_SCALE : 60   * IPHONE_5_4_SCALE
#define WEL_INSET               IS_IPAD ? 30    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 30    : IS_IPHONE_6 ? 30  * IPHONE_6_SCALE : 30   * IPHONE_5_4_SCALE

#define W_LOGO_WIDTH            IS_IPAD ? 177   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 177   : IS_IPHONE_6 ? 177 * IPHONE_6_SCALE : 177  * IPHONE_5_4_SCALE
#define W_LOGO_HEIGHT           IS_IPAD ? 50    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 50    : IS_IPHONE_6 ? 50  * IPHONE_6_SCALE : 50   * IPHONE_5_4_SCALE
#define W_BTN_WIDTH             IS_IPAD ? 270   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 270   : IS_IPHONE_6 ? 270 * IPHONE_6_SCALE : 270  * IPHONE_5_4_SCALE
#define W_BTN_HEIGHT            IS_IPAD ? 47    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 47    : IS_IPHONE_6 ? 47  * IPHONE_6_SCALE : 47   * IPHONE_5_4_SCALE
#define BTN_WIDTH               IS_IPHONE_4 ? (W_BTN_WIDTH)*0.8  : W_BTN_WIDTH
#define BTN_HEIGHT              IS_IPHONE_4 ? (W_BTN_HEIGHT)*0.8 : W_BTN_HEIGHT
#define W_INSET                 IS_IPAD ? 80    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 80    : IS_IPHONE_6 ? 80  * IPHONE_6_SCALE : 80   * IPHONE_5_4_SCALE
#define W_OFFSET                IS_IPAD ? 55    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 55    : IS_IPHONE_6 ? 55  * IPHONE_6_SCALE : 55   * IPHONE_5_4_SCALE
#define W_RESET_WIDTH           IS_IPAD ? 55    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 55    : IS_IPHONE_6 ? 55  * IPHONE_6_SCALE : 55   * IPHONE_5_4_SCALE
#define W_RESET_HEIGHT          IS_IPAD ? 18    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 18    : IS_IPHONE_6 ? 18  * IPHONE_6_SCALE : 18   * IPHONE_5_4_SCALE
#define W_TITLE_FONTSIZE        IS_IPAD ? 20    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 20    : IS_IPHONE_6 ? 20  * IPHONE_6_SCALE : 20   * IPHONE_5_4_SCALE
#define W_TITLE_FONT            [UIFont systemFontOfSize:W_TITLE_FONTSIZE]
#define W_LBL_FONTSIZE          IS_IPAD ? 18    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 18    : IS_IPHONE_6 ? 18  * IPHONE_6_SCALE : 18   * IPHONE_5_4_SCALE
#define W_LBL_FONT              [UIFont systemFontOfSize:W_LBL_FONTSIZE]
#define W_DESC_FONTSIZE         IS_IPAD ? 16    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 16    : IS_IPHONE_6 ? 16  * IPHONE_6_SCALE : 16   * IPHONE_5_4_SCALE
#define W_DESC_FONT             [UIFont italicSystemFontOfSize:W_DESC_FONTSIZE]
#define LBL_BOLD_FONTSIZE       IS_IPAD ? 18    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 18    : IS_IPHONE_6 ? 18  * IPHONE_6_SCALE : 18   * IPHONE_5_4_SCALE
#define LBL_BOLD_FONT           [UIFont boldSystemFontOfSize:LBL_BOLD_FONTSIZE]
#define LBL_MIN_FONTSIZE        IS_IPAD ? 14    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 14    : IS_IPHONE_6 ? 14  * IPHONE_6_SCALE : 14   * IPHONE_5_4_SCALE
#define LBL_MIN_FONT            [UIFont boldSystemFontOfSize:LBL_MIN_FONTSIZE]



//Constants For Authorization Pages
#define AUTH_HEIGHT             IS_IPAD ? 45    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 45    : IS_IPHONE_6 ? 45    * IPHONE_6_SCALE : 45   * IPHONE_5_4_SCALE
#define FIELD_HEIGHT            IS_IPHONE_4 ? (AUTH_HEIGHT)*0.8 : AUTH_HEIGHT
#define AUTH_INSET              IS_IPAD ? 90    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 40    : IS_IPHONE_6 ? 40    * IPHONE_6_SCALE : 40   * IPHONE_5_4_SCALE
#define AUTH_OFFSET             IS_IPAD ? 16.5  * IPAD_SCALE : IS_IPHONE_6_PLUS ? 16.5  : IS_IPHONE_6 ? 16.5  * IPHONE_6_SCALE : 16.5 * IPHONE_5_4_SCALE
#define SP_SHOW_PASS            IS_IPAD ? 25    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 25    : IS_IPHONE_6 ? 25    * IPHONE_6_SCALE : 25   * IPHONE_5_4_SCALE
#define FIELD_FONTSIZE          IS_IPAD ? 20    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 20    : IS_IPHONE_6 ? 20    * IPHONE_6_SCALE : 20   * IPHONE_5_4_SCALE
#define FIELD_FONT              [UIFont systemFontOfSize:FIELD_FONTSIZE]

//Create Constants

#define CC_IMAGE_SIZE        IS_IPAD ? 120   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 120   : IS_IPHONE_6 ? 120 * IPHONE_6_SCALE : 120  * IPHONE_5_4_SCALE
#define CC_IMAGE_INSET       IS_IPAD ? 50  : IS_IPHONE_6_PLUS ? 35   : IS_IPHONE_6 ? 35 : 35
#define CC_IMAGE_INSETS      IS_IPAD ? 10  : IS_IPHONE_6_PLUS ? 10   : IS_IPHONE_6 ? 10 : 10

//Interests Constants
#define IN_INSET                IS_IPAD ? 20    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 20    : IS_IPHONE_6 ? 20  * IPHONE_6_SCALE : 20   * IPHONE_5_4_SCALE
#define IN_HEADER_HEIGHT        IS_IPAD ? 130   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 130   : IS_IPHONE_6 ? 130 * IPHONE_6_SCALE : 130  * IPHONE_5_4_SCALE
#define IN_FOOTER_HEIGHT        IS_IPAD ? 150   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 150   : IS_IPHONE_6 ? 150 * IPHONE_6_SCALE : 150  * IPHONE_5_4_SCALE
#define IN_FOOTER_RESULT        IS_IPAD ? 85    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 85    : IS_IPHONE_6 ? 85  * IPHONE_6_SCALE : 85   * IPHONE_5_4_SCALE
#define IN_LOYOUT_WIDTH         IS_IPAD ? 130   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 105   : IS_IPHONE_6 ? 105 * IPHONE_6_SCALE : 105  * IPHONE_5_4_SCALE
#define IN_LOYOUT_HEIGHT        IS_IPAD ? 180   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 140   : IS_IPHONE_6 ? 140 * IPHONE_6_SCALE : 140  * IPHONE_5_4_SCALE
#define IN_SEARCH_WIDTH         IS_IPAD ? 95    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 95    : IS_IPHONE_6 ? 95  * IPHONE_6_SCALE : 95   * IPHONE_5_4_SCALE
#define IN_SEARCH_HEIGHT        IS_IPAD ? 35    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 35    : IS_IPHONE_6 ? 35  * IPHONE_6_SCALE : 35   * IPHONE_5_4_SCALE
#define IN_FONTSIZE             IS_IPAD ? 26    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 26    : IS_IPHONE_6 ? 26  * IPHONE_6_SCALE : 26   * IPHONE_5_4_SCALE
#define IN_FONT                 [UIFont boldSystemFontOfSize:IN_FONTSIZE]
#define IN_RESULT_FONTSIZE      IS_IPAD ? 20    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 20    : IS_IPHONE_6 ? 20  * IPHONE_6_SCALE : 20   * IPHONE_5_4_SCALE
#define IN_RESULT_FONT          [UIFont boldSystemFontOfSize:IN_RESULT_FONTSIZE]

//LeftMenu Constants
#define LF_INSET                IS_IPAD ? 20    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 20    : IS_IPHONE_6 ? 20  * IPHONE_6_SCALE : 20   * IPHONE_5_4_SCALE
#define LF_IMG_SIZE             IS_IPAD ? 120   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 120   : IS_IPHONE_6 ? 120 * IPHONE_6_SCALE : 120  * IPHONE_5_4_SCALE
#define LF_ICON_SIZE            IS_IPAD ? 40    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 40    : IS_IPHONE_6 ? 40  * IPHONE_6_SCALE : 40   * IPHONE_5_4_SCALE
#define LF_MENU_WIDTH           IS_IPAD ? 300   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 300   : IS_IPHONE_6 ? 300 * IPHONE_6_SCALE : 300  * IPHONE_5_4_SCALE
#define LF_CELL_HEIGHT          IS_IPAD ? 55    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 55    : IS_IPHONE_6 ? 55  * IPHONE_6_SCALE : 60   * IPHONE_5_4_SCALE
#define LF_FONTSIZE             IS_IPAD ? 22    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 22    : IS_IPHONE_6 ? 22  * IPHONE_6_SCALE : 22   * IPHONE_5_4_SCALE
#define LF_FONT                 [UIFont systemFontOfSize:LF_FONTSIZE]

//Settings Constants
#define ST_CELL_HEIGHT          IS_IPAD ? 60    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 60    : IS_IPHONE_6 ? 60  * IPHONE_6_SCALE : 60   * IPHONE_5_4_SCALE
#define ST_HEADER_HEIGHT        IS_IPAD ? 210   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 210   : IS_IPHONE_6 ? 210 * IPHONE_6_SCALE : 210  * IPHONE_5_4_SCALE
#define ST_FONTSIZE             IS_IPAD ? 22    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 22    : IS_IPHONE_6 ? 22  * IPHONE_6_SCALE : 22   * IPHONE_5_4_SCALE
#define ST_FONT                 [UIFont systemFontOfSize:LF_FONTSIZE]

//Profile Settings Constants
#define PS_BV_HEIGHT            IS_IPAD ? 60    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 80    : IS_IPHONE_6 ? 70  * IPHONE_6_SCALE : 50   * IPHONE_5_4_SCALE
#define ST_INSET                IS_IPAD ? 20    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 20    : IS_IPHONE_6 ? 20  * IPHONE_6_SCALE : 20   * IPHONE_5_4_SCALE
#define ST_FOOTER_HEIGHT        IS_IPAD ? 100   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 100   : IS_IPHONE_6 ? 100 * IPHONE_6_SCALE : 100  * IPHONE_5_4_SCALE
#define ST_DESC_FONTSIZE        IS_IPAD ? 16    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 16    : IS_IPHONE_6 ? 16  * IPHONE_6_SCALE : 16   * IPHONE_5_4_SCALE
#define ST_DESC_FONT            [UIFont systemFontOfSize:DESC_FONTSIZE]

//PeopleToFollow Constants
#define PF_INSET                IS_IPAD ? 20    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 20    : IS_IPHONE_6 ? 20  * IPHONE_6_SCALE : 20   * IPHONE_5_4_SCALE
#define PF_IMG_SIZE             IS_IPAD ? 120   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 120   : IS_IPHONE_6 ? 120 * IPHONE_6_SCALE : 120  * IPHONE_5_4_SCALE
#define PF_ICON_SIZE            IS_IPAD ? 45    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 45    : IS_IPHONE_6 ? 45  * IPHONE_6_SCALE : 45   * IPHONE_5_4_SCALE
#define PF_HEADER_HEIGHT        IS_IPAD ? 90    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 90    : IS_IPHONE_6 ? 90  * IPHONE_6_SCALE : 90   * IPHONE_5_4_SCALE
#define PF_ARROW_SIZE           IS_IPAD ? 25    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 25    : IS_IPHONE_6 ? 25  * IPHONE_6_SCALE : 25   * IPHONE_5_4_SCALE
#define PF_NAME_FONTSIZE        IS_IPAD ? 20    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 20    : IS_IPHONE_6 ? 20  * IPHONE_6_SCALE : 20   * IPHONE_5_4_SCALE
#define PF_NAME_FONT            [UIFont boldSystemFontOfSize:PF_NAME_FONTSIZE]
#define PF_SMS_FONTSIZE         IS_IPAD ? 16    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 16    : IS_IPHONE_6 ? 16  * IPHONE_6_SCALE : 16   * IPHONE_5_4_SCALE
#define PF_SMS_FONT             [UIFont italicSystemFontOfSize:PF_SMS_FONTSIZE]

//Profile
#define PF_IMAGEVIEWSIZE        IS_IPAD ? 130    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 130    : IS_IPHONE_6 ? 130  * IPHONE_6_SCALE : 130   * IPHONE_5_4_SCALE

//News Feed Constants
#define PLACEHOLDER             @"Become a thought leader! Use Frontpage to share stories on topics you love."
#define NF_NAV_WIDTH            IS_IPAD ? 110   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 110   : IS_IPHONE_6 ? 110 * IPHONE_6_SCALE : 110  * IPHONE_5_4_SCALE


//AddPost
#define AD_INTEREST_LBL_WIDTH   IS_IPAD ? 180   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 55    : IS_IPHONE_6 ? 55  * IPHONE_6_SCALE : 55   * IPHONE_5_4_SCALE
#define AD_TEXTVIEW             IS_IPAD ? 16    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 16    : IS_IPHONE_6 ? 16  * IPHONE_6_SCALE : 16   * IPHONE_5_4_SCALE
#define AD_TEXTVIEW_FONT        [UIFont systemFontOfSize:AD_TEXTVIEW]
#define AD_TXT_CHOOSE           IS_IPAD ? 16    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 16    : IS_IPHONE_6 ? 16  * IPHONE_6_SCALE : 16   * IPHONE_5_4_SCALE
#define AD_TXT_CHOOSE_FONT      [UIFont italicSystemFontOfSize:AD_TXT_CHOOSE]


//PostContainer
#define NF_INSET                IS_IPAD ? 13    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 13    : IS_IPHONE_6 ? 13  * IPHONE_6_SCALE : 13   * IPHONE_5_4_SCALE
#define NF_TEXTVIEW_HEIGHT      IS_IPAD ? 104   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 104   : IS_IPHONE_6 ? 104 * IPHONE_6_SCALE : 104  * IPHONE_5_4_SCALE
#define NF_TEXTVIEW_FONTSIZE    IS_IPAD ? 13    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 13    : IS_IPHONE_6 ? 13  * IPHONE_6_SCALE : 13   * IPHONE_5_4_SCALE
#define NF_TEXTVIEW_FONT        [UIFont italicSystemFontOfSize:W_TITLE_FONTSIZE]

//newsFeed

#define NF_HEADER_HEIGHT        IS_IPAD ? 250   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 250   : IS_IPHONE_6 ? 250 * IPHONE_6_SCALE : 250  * IPHONE_5_4_SCALE
#define NF_CELL_HEIGHT          IS_IPAD ? 500   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 500   : IS_IPHONE_6 ? 500 * IPHONE_6_SCALE : 565  * IPHONE_5_4_SCALE

#define NF_HEADER_MIDDLE_HEIGHT IS_IPAD ? 130   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 130   : IS_IPHONE_6 ? 130 * IPHONE_6_SCALE : 130  * IPHONE_5_4_SCALE
#define NF_IMG_SIZE             IS_IPAD ? 120   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 120   : IS_IPHONE_6 ? 120 * IPHONE_6_SCALE : 120  * IPHONE_5_4_SCALE
#define NF_ADDPOST_BTN_WIDTH    IS_IPAD ? 140   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 140   : IS_IPHONE_6 ? 140 * IPHONE_6_SCALE : 140  * IPHONE_5_4_SCALE
#define NF_ADDPOST_BTN_HEIGHT   IS_IPAD ? 30    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 30    : IS_IPHONE_6 ? 30  * IPHONE_6_SCALE : 30   * IPHONE_5_4_SCALE
#define NF_PHOT_LOYOUT_SIZE     IS_IPAD ? 100   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 100   : IS_IPHONE_6 ? 100 * IPHONE_6_SCALE : 100  * IPHONE_5_4_SCALE
#define NF_CUSTOM_TABLE_HEIGHT  IS_IPAD ? 110   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 110   : IS_IPHONE_6 ? 110 * IPHONE_6_SCALE : 110  * IPHONE_5_4_SCALE
#define NF_BOTTOM_ICON_SIZE     IS_IPAD ? 35    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 35    : IS_IPHONE_6 ? 35  * IPHONE_6_SCALE : 35   * IPHONE_5_4_SCALE

#define NF_GIST_FONTSIZE        IS_IPAD ? 13    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 13    : IS_IPHONE_6 ? 13  * IPHONE_6_SCALE : 13   * IPHONE_5_4_SCALE
#define NF_GIST_FONT            [UIFont systemFontOfSize:NF_GIST_FONTSIZE]
#define NF_BOTTOM_FONTSIZE      IS_IPAD ? 15    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 15    : IS_IPHONE_6 ? 15  * IPHONE_6_SCALE : 15   * IPHONE_5_4_SCALE
#define NF_BOTTOM_FONT          [UIFont italicSystemFontOfSize:NF_BOTTOM_FONTSIZE]
#define NF_BOTTOM_NAME_FONTSIZE IS_IPAD ? 20    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 20    : IS_IPHONE_6 ? 20  * IPHONE_6_SCALE : 20   * IPHONE_5_4_SCALE
#define NF_BOTTOM_NAME_FONT     [UIFont boldSystemFontOfSize:NF_BOTTOM_NAME_FONTSIZE]
#define NF_BOTTOM_SHARE         IS_IPAD ? 16    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 16    : IS_IPHONE_6 ? 16  * IPHONE_6_SCALE : 16   * IPHONE_5_4_SCALE
#define NF_BOTTOM_SHARE_FONT    [UIFont systemFontOfSize:NF_BOTTOM_SHARE]
#define NF_BOTTOM_INTEREST      IS_IPAD ? 14    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 14    : IS_IPHONE_6 ? 14  * IPHONE_6_SCALE : 14   * IPHONE_5_4_SCALE
#define NF_BOTTOM_INTEREST_FONT [UIFont boldSystemFontOfSize:NF_BOTTOM_INTEREST]
#define NF_BOTTOM_DELETE        IS_IPAD ? 14    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 14    : IS_IPHONE_6 ? 14  * IPHONE_6_SCALE : 14   * IPHONE_5_4_SCALE
#define NF_BOTTOM_DELETE_FONT   [UIFont systemFontOfSize:NF_BOTTOM_DELETE]
#define NF_BOTTOM_LIKE          IS_IPAD ? 21    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 21    : IS_IPHONE_6 ? 21  * IPHONE_6_SCALE : 21   * IPHONE_5_4_SCALE
#define NF_BOTTOM_LIKE_FONT     [UIFont systemFontOfSize:NF_BOTTOM_LIKE]
#define NF_BOTTOM_COMMENT       IS_IPAD ? 15    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 15    : IS_IPHONE_6 ? 15  * IPHONE_6_SCALE : 15   * IPHONE_5_4_SCALE
#define NF_BOTTOM_COMMENT_FONT  [UIFont systemFontOfSize:NF_BOTTOM_COMMENT]
#define NF_BOTTOM_LIKE_INSET    IS_IPAD ? 6     * IPAD_SCALE : IS_IPHONE_6_PLUS ? 6     : IS_IPHONE_6 ? 6   * IPHONE_6_SCALE : 6    * IPHONE_5_4_SCALE
#define NF_NAV_BTN_FONTSIZE     IS_IPAD ? 16    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 20    : IS_IPHONE_6 ? 20  * IPHONE_6_SCALE : 20   * IPHONE_5_4_SCALE
#define NF_NAV_BTN_FONT         [UIFont systemFontOfSize:NF_NAV_BTN_FONTSIZE]
#define NF_MIDDLE_NAME          IS_IPAD ? 16    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 16    : IS_IPHONE_6 ? 16  * IPHONE_6_SCALE : 16   * IPHONE_5_4_SCALE

//Post Detail Constants
#define PD_INSET                IS_IPAD ? 10    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 10    : IS_IPHONE_6 ? 10  * IPHONE_6_SCALE : 10   * IPHONE_5_4_SCALE
#define PD_IMG_SIZE             IS_IPAD ? 60    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 60    : IS_IPHONE_6 ? 60  * IPHONE_6_SCALE : 60   * IPHONE_5_4_SCALE
#define PD_CELL_HEIGHT          IS_IPAD ? 90    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 90    : IS_IPHONE_6 ? 90  * IPHONE_6_SCALE : 90   * IPHONE_5_4_SCALE
#define FOOTER_HEIGHT           IS_IPAD ? 180   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 140   : IS_IPHONE_6 ? 140 * IPHONE_6_SCALE : 140  * IPHONE_5_4_SCALE

#define PD_COMMENT_TEXT         IS_IPAD ? 16    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 16    : IS_IPHONE_6 ? 16  * IPHONE_6_SCALE : 16   * IPHONE_5_4_SCALE
#define PD_COMMENT_TEXT_FONT    [UIFont systemFontOfSize:PD_COMMENT_TEXT]
#define PD_COMMENT_DATE         IS_IPAD ? 13    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 13    : IS_IPHONE_6 ? 13  * IPHONE_6_SCALE : 13   * IPHONE_5_4_SCALE
#define PD_COMMENT_DATE_FONT    [UIFont systemFontOfSize:PD_COMMENT_DATE]

//Alert View Constants
#define AL_INSET                IS_IPAD ? 35    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 35    : IS_IPHONE_6 ? 35  * IPHONE_6_SCALE : 35   * IPHONE_5_4_SCALE
#define AL_VIEW_HEIGHT          IS_IPAD ? 260   * IPAD_SCALE : IS_IPHONE_6_PLUS ? 260   : IS_IPHONE_6 ? 260 * IPHONE_6_SCALE : 260  * IPHONE_5_4_SCALE
#define AL_HEIGHT               IS_IPAD ? 65    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 65    : IS_IPHONE_6 ? 65  * IPHONE_6_SCALE : 65   * IPHONE_5_4_SCALE

#define AL_HEADER               IS_IPAD ? 24    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 24    : IS_IPHONE_6 ? 24  * IPHONE_6_SCALE : 24   * IPHONE_5_4_SCALE
#define AL_HEADER_FONT          [UIFont boldSystemFontOfSize:AL_HEADER]
#define AL_TITLE                IS_IPAD ? 20    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 20    : IS_IPHONE_6 ? 20  * IPHONE_6_SCALE : 19   * IPHONE_5_4_SCALE
#define AL_TITLE_FONT           [UIFont systemFontOfSize:AL_TITLE]
#define AL_BTN                  IS_IPAD ? 20    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 20    : IS_IPHONE_6 ? 20  * IPHONE_6_SCALE : 20   * IPHONE_5_4_SCALE
#define AL_BTN_FONT             [UIFont boldSystemFontOfSize:AL_BTN]

//MapView Constraints
#define MC_INSET                  IS_IPAD ? 15    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 15    : IS_IPHONE_6 ? 15  * IPHONE_6_SCALE : 15   * IPHONE_5_4_SCALE
#define MC_BUTTON_SIZE            IS_IPAD ? 30    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 30    : IS_IPHONE_6 ? 30  * IPHONE_6_SCALE : 30   * IPHONE_5_4_SCALE
#define MC_NOTIFICATION_HEIGHT    IS_IPAD ? 50    * IPAD_SCALE : IS_IPHONE_6_PLUS ? 50    : IS_IPHONE_6 ? 50  * IPHONE_6_SCALE : 50   * IPHONE_5_4_SCALE
#define MC_ANIM_DISTANCE          IS_IPAD ? 70.0  * IPAD_SCALE : IS_IPHONE_6_PLUS ? 70.0  : IS_IPHONE_6 ? 70.0 * IPHONE_6_SCALE : 70.0   * IPHONE_5_4_SCALE

#endif