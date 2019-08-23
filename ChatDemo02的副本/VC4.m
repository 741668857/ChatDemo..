//
//  VC4.m
//  ChatDemo02
//
//  Created by Civet on 2019/8/21.
//  Copyright © 2019 Civet. All rights reserved.
//

#import "VC4.h"
#import "VC2.h"
#import "Firebase.h"
#import "FirebaseAuth.h"

@interface VC4 ()

@end

@implementation VC4

- (void)viewDidLoad {
    _Textfield01.clearButtonMode=UITextFieldViewModeAlways;
    self.title=@"重设密码";
    [super viewDidLoad];
    
}


- (IBAction)pressSendBtn:(id)sender {
    if([_Textfield01.text isEqual:@""]){
        UIAlertView* alertview=[[UIAlertView alloc]initWithTitle:@"提示" message:@"填上邮箱" delegate:nil cancelButtonTitle:@"好的～" otherButtonTitles:nil, nil];
        [alertview show];
    }
    else{
       [[FIRAuth auth] sendPasswordResetWithEmail:_Textfield01.text completion:^(NSError *_Nullable error) {
                    NSString* title=@"";
                    NSString* message=@"";
           if(error==nil){
               title=@"成功";
               message=@"成功发送邮件";
               _Textfield01.text=@"";
           }
           else{
               title=@"失败";
               message=error.localizedDescription;
           }
           
           UIAlertView* alertview=[[UIAlertView alloc]initWithTitle:title message:message delegate:nil cancelButtonTitle:@"好的～" otherButtonTitles:nil, nil];
           [alertview show];
        }];
        
        
    }
    
}



@end
