//
//  ViewController.m
//  VSAlertView
//
//  Created by Vijay subramaniyam on 06/05/15.
//
//

#import "ViewController.h"
#import "AlertView.h"

@interface ViewController ()<alertViewDelegate>
{
    AlertView *alert;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    alert = [[AlertView alloc]init];
    alert.delegate = self;
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)showSuccessAlertTop:(id)sender
{
    [alert showAlert:self.view alertString:@"Welcome to the wonderful world. With advanced of activating account and new login widgets, you will definitely have a great experience of using" size:64 type:YES position:1];
}
- (IBAction)showFailureAlertTop:(id)sender
{
  [alert showAlert:self.view alertString:@"uhh! oh Looks like server is down. Come back later" size:64 type:NO position:1];
}

- (IBAction)showSuccessAlertBottom:(id)sender
{
     [alert showAlert:self.view alertString:@"Welcome to the wonderful world. With advanced of activating account and new login widgets, you will definitely have a great experience of using" size:64 type:YES position:2];
}
- (IBAction)showFailureAlertBottom:(id)sender
{
    [alert showAlert:self.view alertString:@"uhh! oh Looks like server is down. Come back later" size:64 type:NO position:2];
}

- (IBAction)showToast:(id)sender
{
        [alert makeToast:@"Welcome to the wonderful world. With advanced of activating account and new login widgets, you will definitely have a great experience of using"];
}

@end
