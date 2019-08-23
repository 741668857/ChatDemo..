//
//  VC5.h
//  ChatDemo02
//
//  Created by Civet on 2019/8/21.
//  Copyright © 2019 Civet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FirebaseFirestore/FirebaseFirestore.h>
#import <Firebase.h>

NS_ASSUME_NONNULL_BEGIN

@interface VC5 : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    UITableView* _tableView;
    NSMutableArray *_arraydata;
    UITextField* _textfield;


}

@property (nonatomic, readwrite) FIRFirestore *db;


@end

NS_ASSUME_NONNULL_END
