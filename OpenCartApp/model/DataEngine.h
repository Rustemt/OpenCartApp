//
//  DataEngine.h
//  OpenCartApp
//
//  Created by claudio barbera on 09/11/13.
//  Copyright (c) 2013 Claudio Barbera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKNetworkEngine.h"


typedef void (^ArrayResponseBlock)(NSMutableArray *listOfObjects);
typedef void (^ErrorBlock)(NSError *engineError);
typedef void (^ModelBlock)(id object);
typedef void (^VoidBlock)(void);
typedef void (^DictionaryBlock)(NSDictionary *dictionaryResult);


@interface DataEngine : MKNetworkEngine

-(id) initWithDefaultSettings;

-(MKNetworkOperation *)fetchCategoriesOnSucceeded:(ArrayResponseBlock)succededBlock onError:(ErrorBlock)errorBlock;



@end
