//
//  VC6.m
//  ChatDemo02
//
//  Created by Civet on 2019/8/22.
//  Copyright © 2019 Civet. All rights reserved.
//

#import "VC6.h"
#import "VC5.h"
#import "Firebase.h"


@interface VC6 ()

@end

@implementation VC6

- (void)viewDidLoad {
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _arraydata=[[NSMutableArray alloc]init];
    [self.view addSubview:_tableView];
    
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




- (IBAction)pressBtnSend1:(id)sender {
    NSMutableArray *indexpaths=[[NSMutableArray alloc]init];
    if([_Textfield01.text isEqual:@""]){
        UIAlertView* alertview=[[UIAlertView alloc]initWithTitle:@"提示" message:@"写上东西崽种" delegate:nil cancelButtonTitle:@"好的爸爸～" otherButtonTitles:nil, nil];
        [alertview show];
    }
    else{
        NSIndexPath* indexpath=[NSIndexPath indexPathForRow:0 inSection:0];
        NSString* str=[NSString stringWithFormat:@"%@",_Textfield01.text];
        [indexpaths addObject:indexpath];
        [_arraydata addObject:str];
        [_tableView insertRowsAtIndexPaths:indexpaths withRowAnimation:UITableViewRowAnimationNone];
    }
    [_tableView reloadData];
}





@end
