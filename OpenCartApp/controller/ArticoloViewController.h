//
//  ArticoloViewController.h
//  OpenCartApp
//
//  Created by claudio barbera on 12/11/13.
//  Copyright (c) 2013 Claudio Barbera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticoloViewController : UITableViewController 

@property (nonatomic, strong) IBOutlet UILabel *lblName;

@property (nonatomic, strong) NSString *selectedObjectId;
@property (weak, nonatomic) IBOutlet UIImageView *imgProduct;
@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;

@end
