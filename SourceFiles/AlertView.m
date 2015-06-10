//
//  AlertView.m
//  VSAlertView
//
//  Created by Vijay subramaniyam on 06/05/15.
//
//

#import "AlertView.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define boldFont @"Helvetica-Bold"
#define lightFont @"Helvetica-Light"
#define normalFont @"HelveticaNeue"

//ALERT VIEW MACROS

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define alertPositiveColor UIColorFromRGB(0x5DAC01)
#define alertNegativeColor UIColorFromRGB(0xE02200)

const CGFloat kDefaultAnimateDurationAlertVIew = 0.8f;
const CGFloat kDefaultAnimateDelayAlertVIew = 0.1f;
const CGFloat kDefaultAlertShowTimeAlertVIew = 1.5f;


//TOAST VIEW MACROS

const CGFloat kDefaultAlphaValueToastView = 0.8f;
const CGFloat kDefaultCornerRadiusToastView = 6.0f;
const CGFloat kDefaultBorderWidthToastView = 0.5f;

const CGFloat kDefaultAnimateDurationToastView = 1.0f;
const CGFloat kDefaultAnimateDelayToastView = 1.0f;
const CGFloat kDefaultAlertShowTimeDelayToastView = 3.0f;

const CGFloat kRemoveAnimateDurationToastView = 0.7f;
const CGFloat kRemoveAnimateDelayToastView = 0.1f;


UIView* errorView;
UIView *toastView;
#define CURRENT_TOAST_TAG 6984678
#define CURRENT_ERROR_VIEW_TAG 5446546

@implementation AlertView

@synthesize delegate;

-(void)showAlert:(UIView *)viewtoShow alertString:(NSString *)alerttoShow size:(int)Yaxis type:(BOOL)isSuccess position:(int)type
{
    
    if(!errorView)
    {
        
        errorView=[[UIView alloc]init];
        errorView.tag =CURRENT_ERROR_VIEW_TAG;

        
        if(isSuccess)
        {
            errorView.backgroundColor = alertPositiveColor;
        }
        else
        {
            errorView.backgroundColor = alertNegativeColor;
        }
        
        UILabel  *errorLabel = [[UILabel alloc]init];
        errorLabel.frame=CGRectMake(10, 2, SCREEN_WIDTH-20, 20);
        NSInteger height;
        
        if(UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)
        {
            errorLabel.font = [UIFont fontWithName:boldFont size:20.0];
            height = [self getTextHeight:alerttoShow frame:viewtoShow.frame font:boldFont fontSize:20]+5;
        }
        else
        {
            errorLabel.font = [UIFont fontWithName:boldFont size:12.0];
            height = [self getTextHeight:alerttoShow frame:viewtoShow.frame font:boldFont fontSize:12]+5;
        }
        
        errorLabel.text = alerttoShow;
        errorLabel.textAlignment =NSTextAlignmentCenter;
        errorLabel.textColor = [UIColor whiteColor];
        errorLabel.backgroundColor =[UIColor clearColor];
        [errorLabel setNumberOfLines:0];
        [errorLabel sizeToFit];
        
        
        
        if(type==2)
        {
            errorView.frame=CGRectMake(0, SCREEN_HEIGHT+100, SCREEN_WIDTH, height);
 
        }
        else
        {
            errorView.frame=CGRectMake(0, -200, SCREEN_WIDTH, height);

        }
        
        [UIView animateWithDuration:kDefaultAnimateDurationAlertVIew
                              delay:kDefaultAnimateDelayAlertVIew
                            options:UIViewAnimationOptionTransitionFlipFromTop
                         animations:^{
                             
                             if(type==2)
                             {
                                 errorView.frame=CGRectMake(0, SCREEN_HEIGHT-height, SCREEN_WIDTH, height);
                                 
                             }
                             else
                             {
                                 errorView.frame=CGRectMake(0, Yaxis, SCREEN_WIDTH, height);
                                 
                             }
                             [viewtoShow addSubview:errorView];
                             [errorView addSubview:errorLabel];
                             
                         }
                         completion:^(BOOL finished){
                             
                             double delayInSeconds = kDefaultAlertShowTimeAlertVIew;
                             dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
                             dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                                 
                            [UIView animateWithDuration:kDefaultAnimateDurationAlertVIew
                                                       delay:kDefaultAnimateDelayAlertVIew
                                                     options:UIViewAnimationOptionTransitionFlipFromBottom
                                                  animations:^{
                                                     
                                                          
                                                          if(UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)
                                                          {
                                                              if(type==2)
                                                              {
                                                                  errorView.frame=CGRectMake(0, SCREEN_HEIGHT+100, SCREEN_WIDTH, height);
                                                                  
                                                              }
                                                              else
                                                              {
                                                                  errorView.frame = CGRectMake(0, -85, SCREEN_WIDTH, height);
                                                                  
                                                              }
                                                          }
                                                          else
                                                          {
                                                              if(type==2)
                                                              {
                                                                  errorView.frame=CGRectMake(0, SCREEN_HEIGHT+100, SCREEN_WIDTH, height);
                                                                  
                                                              }
                                                              else
                                                              {
                                                                  errorView.frame = CGRectMake(0, -55, SCREEN_WIDTH, height);
                                                                  
                                                              }
                                                          }
                                                          
                                                          errorView.alpha = 0.0;
                                                          
                                                      
                                                      
                                                      
                                                  }
                                                  completion:^(BOOL finished)
                                  {
                                      
                                      [self Remove:viewtoShow];
                                      
                                  }];
                                 
                             });
                             
                         }];
        

    }
    
    
    
}


- (void)Remove:(UIView*)currentView{
    
    for (UIView *errorRemoveView in [currentView subviews])
    {
        if (errorRemoveView.tag == CURRENT_ERROR_VIEW_TAG)
        {
            [errorRemoveView removeFromSuperview];
            errorView = nil;
            
            
        }
        
    }
}


-(void) makeToast:(NSString *)errorText
{
   
    
    if(!toastView)
    {
        CGRect frameSize = CGRectMake(20, SCREEN_WIDTH/2, SCREEN_WIDTH-40,20);
        NSInteger height = height = [self getTextHeight:errorText frame:frameSize font:normalFont fontSize:13]+15;
        
        UILabel *errorLabel = [[UILabel alloc] init];
        errorLabel.backgroundColor = [UIColor clearColor];
        errorLabel.text = errorText;
        [errorLabel setNumberOfLines:0];
        errorLabel.textAlignment =NSTextAlignmentCenter;
        errorLabel.textColor =[UIColor whiteColor];
        
        UIWindow *window = [[[UIApplication sharedApplication] windows]objectAtIndex:0];
        
        
        toastView = [[UIView alloc]init];
        toastView.backgroundColor = [UIColor blackColor];
        toastView.alpha = kDefaultAlphaValueToastView;
        toastView.layer.cornerRadius = kDefaultCornerRadiusToastView;
        toastView.clipsToBounds=YES;
        toastView.layer.borderColor =[[UIColor whiteColor]CGColor];
        toastView.layer.borderWidth=kDefaultBorderWidthToastView;
        toastView.tag = CURRENT_TOAST_TAG;
        
        toastView.frame = CGRectMake(20, window.bounds.size.height/2, SCREEN_WIDTH-40, height);
        errorLabel.font = [UIFont fontWithName:normalFont size:13.0];
        errorLabel.frame= CGRectMake(10, 0, toastView.frame.size.width-20  , height);
        
        
        
        [UIView animateWithDuration:kDefaultAnimateDurationToastView delay:kDefaultAnimateDelayToastView options:UIViewAnimationOptionTransitionFlipFromBottom
                         animations:^{
                             
                             toastView.alpha=0.0;
                             [window addSubview:toastView];
                             [toastView addSubview:errorLabel];
                             [UIView beginAnimations:nil    context:NULL];
                             toastView.alpha=kDefaultAlphaValueToastView;
                             [UIView commitAnimations];
                             
                         }
                         completion:^(BOOL finished){
                             
                             
                             double delayInSeconds = kDefaultAlertShowTimeDelayToastView;
                             dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
                             dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                                 
                                 [UIView animateWithDuration:kRemoveAnimateDurationToastView delay:kRemoveAnimateDelayToastView
                                                     options:UIViewAnimationOptionTransitionFlipFromBottom
                                                  animations:^{
                                                      
                                                      [UIView beginAnimations:nil    context:NULL];
                                                      toastView.alpha = 0.0f;
                                                      [UIView commitAnimations];
                                                      
                                                  }
                                                  completion:^(BOOL finished){
                                                      
                                                      UIView *currentToast = [window viewWithTag:CURRENT_TOAST_TAG];
                                                      if(currentToast!=nil){
                                                          toastView = nil;
                                                          [toastView removeFromSuperview];
                                                      }
                                                      
                                                      
                                                  }];
                                            });
                                        }];
                                    }
    
    
    
}




-(NSInteger)getTextHeight:(NSString*)message frame:(CGRect)frameValue font:(NSString*)fontName fontSize:(int)size
{
    
    CGFloat labelWidth  = CGRectGetWidth(frameValue);
    
    CGSize labelContraints   = CGSizeMake(labelWidth, 1000.0f);
    
    CGRect labelRect = [message
                        boundingRectWithSize:labelContraints
                        options:NSStringDrawingUsesLineFragmentOrigin
                        attributes:@{
                                     NSFontAttributeName : [UIFont fontWithName:fontName size:size]
                                     }
                        context:nil];
    
    return labelRect.size.height;
    
}


@end

