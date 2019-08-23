//
//  VC6.h
//  ChatDemo02
//
//  Created by Civet on 2019/8/22.
//  Copyright © 2019 Civet. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VC6 : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    UITableView* _tableView;
    NSMutableArray *_arraydata;
}
@property (weak, nonatomic) IBOutlet UITextField *Textfield01;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *Button02;

@end

NS_ASSUME_NONNULL_END
