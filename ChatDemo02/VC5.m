//
//  VC5.m
//  ChatDemo02
//
//  Created by Civet on 2019/8/21.
//  Copyright © 2019 Civet. All rights reserved.
//

#import "VC5.h"
#import "VC6.h"
#import "Firebase.h"
#import "FirebaseAuth.h"
#import "VC2.h"
#import "AppDelegate.h"
@import FirebaseCore;
@import FirebaseFirestore;


@interface VC5 ()

@end

@implementation VC5



- (void)viewDidLoad {
    
    _arraydata=[[NSMutableArray alloc]init];
    _textfield=[[UITextField alloc]init];
    _textfield.borderStyle=UITextBorderStyleRoundedRect;
    _textfield.frame=CGRectMake(0, 0, 250, 20);
    _textfield.clearButtonMode=UITextFieldViewModeAlways;
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    UIBarButtonItem* leftbtn=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pressAddbtn)];
    self.navigationItem.leftBarButtonItem=leftbtn;
    UIBarButtonItem* rightbtn=[[UIBarButtonItem alloc]initWithTitle:@"登出" style:UIBarButtonItemStylePlain target:self action:@selector(pressEdit)];
    self.navigationItem.rightBarButtonItem=rightbtn;
    self.navigationItem.titleView=_textfield;
    [self.view addSubview:_tableView];
    self.db = [FIRFirestore firestore];
     [super viewDidLoad];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arraydata.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* cellstr=@"cell";
    UITableViewCell* cell=[_tableView dequeueReusableCellWithIdentifier:cellstr];
    if(cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellstr];
    }
    cell.textLabel.text=_arraydata[indexPath.row];
    return cell;
}


-(void)pressAddbtn{
    
    NSMutableArray *indexpaths=[[NSMutableArray alloc]init];
    if([_textfield.text isEqual:@""]){
        UIAlertView* alertview=[[UIAlertView alloc]initWithTitle:@"提示" message:@"写上东西崽种" delegate:nil cancelButtonTitle:@"好的爸爸～" otherButtonTitles:nil, nil];
        [alertview show];
    }
    else{
        NSIndexPath* indexpath=[NSIndexPath indexPathForRow:0 inSection:0];
        NSString* str=[NSString stringWithFormat:@"%@",_textfield.text];
        [indexpaths addObject:indexpath];
        [_arraydata addObject:str];
    [_tableView insertRowsAtIndexPaths:indexpaths withRowAnimation:UITableViewRowAnimationNone];
    }
    [_tableView reloadData];
  
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    VC6* vc6=[[VC6 alloc]init];
    [self.navigationController pushViewController:vc6 animated:YES];
}

-(void)pressEdit{
    NSError *signOutError;
    BOOL status = [[FIRAuth auth] signOut:&signOutError];
    if (!status) {
    UIAlertView* alertview1=[[UIAlertView alloc]initWithTitle:@"提示" message:signOutError delegate:nil cancelButtonTitle:@"好的爸爸～" otherButtonTitles:nil, nil];
        [alertview1 show];
        NSLog(@"Error signing out: %@", signOutError);
        return;
    }else{
        VC2* vc2=[[VC2 alloc]init];
        [self.navigationController pushViewController:vc2 animated:YES];
    }
    
}


@end
