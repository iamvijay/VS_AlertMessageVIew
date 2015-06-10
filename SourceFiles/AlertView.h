//
//  AlertView.h
//  VSAlertView
//
//  Created by Vijay subramaniyam on 06/05/15.
//
//

#import <UIKit/UIKit.h>



@protocol alertViewDelegate <NSObject>

@end

@interface AlertView : UIView

@property(nonatomic,retain)id<alertViewDelegate>delegate;

-(void) showAlert:(UIView*)viewtoShow alertString :(NSString *)alerttoShow size:(int)Yaxis type:(BOOL)isSuccess position:(int)type;
-(void) Remove:(UIView*)currentView;
-(void) makeToast:(NSString*) errorText;

@end
