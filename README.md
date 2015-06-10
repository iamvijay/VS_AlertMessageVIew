# Alert message and Toast Message

This will be useful to show alert view or some kind of alert information to the user. It may be a success message or failure message
then you can also show simple toast message to the user.

# Screen shots 

  <img align="left" src="https://i.imgflip.com/mpg6w.gif" alt="SS1" width="200" height="360"/>
  <img align="center" src="http://i.imgur.com/cuoGHe4.jpeg" alt="SS2" width="200" height="360"/>
  <img align="center" src="http://i.imgur.com/Vhtj62V.jpeg" alt="SS3" width="200" height="360"/>
  <img align="center" src="http://i.imgur.com/6zlgMbu.jpeg" alt="SS3" width="200" height="360"/>


# Installation

Just drag and drop the "AlertView.h" and "AlertView.m" file from source files into your project, 
and make sure you check the "Copy items into destination group's folder" box

###### - Then import AlertView.h and set the cradViewDelegate wherever you need it.

```objective-c
#import "AlertView.h"

@interface ViewController ()<alertViewDelegate>
```

# Usage

Creation is very simple just send the message to show in the alert with Yaxis where should show the message and also send
whether its success message or failure message as BOOL. Don forget to send position type before that create object for the 
class and set delegate.

position 1 -> Top
position 2 -> Bottom


Code for showing alert message
```objective-c

AlertView *alert = [[AlertView alloc]init];
alert.delegate=self;

- (IBAction)showSuccessAlertTop:(id)sender
{
    [alert showAlert:self.view alertString:@"Welcome to the wonderful world. With advanced of activating account and new login widgets, you will definitely have a great experience of using" 
           size:64 type:YES position:1];
}

- (IBAction)showFailureAlertTop:(id)sender
{
  [alert showAlert:self.view alertString:@"uhh! oh Looks like server is down. Come back later" 
         size:64 type:NO position:1];
}

- (IBAction)showSuccessAlertBottom:(id)sender
{
     [alert showAlert:self.view alertString:@"Welcome to the wonderful world. With advanced of activating account and new login widgets, you will definitely have a great experience of using" 
            size:64 type:YES position:2];
}

- (IBAction)showFailureAlertBottom:(id)sender
{
    [alert showAlert:self.view alertString:@"uhh! oh Looks like server is down. Come back later"
           size:64 type:NO position:2];
}
```
Code for showing toast message and for that send only message which should be shown.


```objective-c
- (IBAction)showToast:(id)sender
{
  [alert makeToast:@"Welcome to the wonderful world. With advanced of activating account and new login widgets, you will definitely have a great experience of using"];
}
```

Note : This is my first try so please feel free to comment or even you can tell me if i have to improve anything
or even small mistakes in the coding. Thanks

# Get in touch
If you want to contact me mail at vijays1107@gmail.com 
or
Just tweet me : [@iam_vijay7](https://twitter.com/iam_vijay7)

# License

 The MIT License (MIT)
 
 Copyright (c) 2015 Vijay Subramaniyam
 
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
