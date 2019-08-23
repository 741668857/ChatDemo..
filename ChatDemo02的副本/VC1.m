//
//  VC1.m
//  ChatDemo02
//
//  Created by Civet on 2019/8/20.
//  Copyright © 2019 Civet. All rights reserved.
//

#import "VC1.h"
#import "VC2.h"
#import "Firebase.h"
#import "FirebaseAuth.h"


@interface VC1 ()

@end

@implementation VC1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"注册";
    _Textfield01.clearButtonMode=UITextFieldViewModeAlways;
    _Textfield02.clearButtonMode=UITextFieldViewModeAlways;
    _Textfield02.secureTextEntry=YES;

}
- (IBAction)pressBtnLogin:(id)sender {
    if ([_Textfield01.text isEqual:@""]){
        UIAlertView* alertview=[[UIAlertView alloc]initWithTitle:@"提示" message:@"填上邮箱啊弟弟" delegate:nil cancelButtonTitle:@"好的～" otherButtonTitles:nil, nil];
        [alertview show];
    }else{
        [[FIRAuth auth] createUserWithEmail:_Textfield01.text
                                   password:_Textfield02.text
                                 completion:^(FIRAuthDataResult * _Nullable authResult,
                                              NSError * _Nullable error) {
                             if(error==nil){
                                 UIAlertView* alertview2=[[UIAlertView alloc]initWithTitle:@"恭喜" message:@"注册成功" delegate:nil cancelButtonTitle:@"好的QAQ" otherButtonTitles:nil, nil];
                                 [alertview2 show];
                                VC2* vc2=[[VC2 alloc]init];
                                [self.navigationController pushViewController:vc2 animated:YES];
                                 }
                            else{
                                UIAlertView* alertview1=[[UIAlertView alloc]initWithTitle:@"警告" message:error.localizedDescription delegate:nil cancelButtonTitle:@"好的QAQ" otherButtonTitles:nil, nil];
                                     [alertview1 show];
                                 }
                             }];
        
    }
    
}

- (IBAction)pressLogin:(id)sender {
    VC2* vc2=[[VC2 alloc]init];
    [self.navigationController pushViewController:vc2 animated:YES];
    
}


@end
