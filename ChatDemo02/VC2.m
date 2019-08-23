//
//  VC2.m
//  ChatDemo02
//
//  Created by Civet on 2019/8/20.
//  Copyright © 2019 Civet. All rights reserved.
//

#import "VC2.h"
#import "VC1.h"
#import "Firebase.h"
#import "FirebaseAuth.h"
#import "VC5.h"
#import "VC4.h"

@interface VC2 ()

@end

@implementation VC2

- (void)viewDidLoad {
    [super viewDidLoad];
    _Textfield02.secureTextEntry=YES;
    _Textfield02.clearButtonMode=UITextFieldViewModeAlways;
    _Textfield01.clearButtonMode=UITextFieldViewModeAlways;
    self.title=@"登陆";

}

- (IBAction)pressResetBtn:(id)sender {
    VC4 *vc4=[[VC4 alloc]init];
    [self.navigationController pushViewController:vc4 animated:YES];
}


- (IBAction)pressLoginBtn1:(id)sender {
    
    if([_Textfield01.text isEqual:@""]||[_Textfield02.text isEqual:@""]){
        UIAlertView* alertview=[[UIAlertView alloc]initWithTitle:@"提示" message:@"填上用户名或者密码" delegate:nil cancelButtonTitle:@"好的～" otherButtonTitles:nil, nil];
        [alertview show];
    }
    else{
        [[FIRAuth auth] signInWithEmail:self->_Textfield01.text
                               password:self->_Textfield02.text
                             completion:^(FIRAuthDataResult * _Nullable authResult,
                                          NSError * _Nullable error) {
                                 if(error==nil){
                                     UIAlertView* alertview2=[[UIAlertView alloc]initWithTitle:@"恭喜" message:@"登陆成功" delegate:nil cancelButtonTitle:@"好的QAQ" otherButtonTitles:nil, nil];
                                     [alertview2 show];
                                     VC5* vc1=[[VC5 alloc]init];
                                     [self.navigationController pushViewController:vc1 animated:YES];
                                 }
                                 else{
                                     UIAlertView* alertview1=[[UIAlertView alloc]initWithTitle:@"警告" message:error.localizedDescription delegate:nil cancelButtonTitle:@"好的QAQ" otherButtonTitles:nil, nil];
                                     [alertview1 show];
                                 }
                               
                             }];
    }
    
    
}

@end
