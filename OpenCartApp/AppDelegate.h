//
//  AppDelegate.h
//  OpenCartApp
//
//  Created by claudio barbera on 09/11/13.
//  Copyright (c) 2013 Claudio Barbera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataEngine.h"

#define ApplicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)


@interface AppDelegate : UIResponder <UIApplicationDelegate>


@property (strong, nonatomic) DataEngine *dataEngine;
@property (strong, nonatomic) UIWindow *window;

@end
