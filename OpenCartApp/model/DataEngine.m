//
//  DataEngine.m
//  OpenCartApp
//
//  Created by claudio barbera on 09/11/13.
//  Copyright (c) 2013 Claudio Barbera. All rights reserved.
//

#import "DataEngine.h"
#import "Categoria.h"

@implementation DataEngine

-(id) initWithDefaultSettings {
    
    if(self = [super initWithHostName:@"www.sbuffo.it/demo/index.php"
                   customHeaderFields:nil]) {
        
    }
    
    return self;
}

-(MKNetworkOperation *)fetchCategoriesOnSucceeded:(ArrayResponseBlock)succededBlock onError:(ErrorBlock)errorBlock{


    MKNetworkOperation *op = [self operationWithURLString:@"http://www.sbuffo.it/demo/index.php?route=feed/web_api/categories" params:nil];
    
    
    [op onCompletion:^(MKNetworkOperation *completedOperation)
     {
         BOOL isCachedResponse = [completedOperation isCachedResponse];
         
         if (!isCachedResponse){
             
             NSString *r = [op responseString];
             NSMutableDictionary *responseDictionary = [op responseJSON];
             NSDictionary *result = [responseDictionary objectForKey:@"result"];
             
             
             NSMutableArray *items = [responseDictionary objectForKey:@"categories"];
             
             NSMutableArray *arrayout = [NSMutableArray array];
             
             [items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                 
                 NSDictionary *d = (NSDictionary *)obj;
                 
                 
                 Categoria *cat = [[Categoria alloc] init];
                 [cat setCategoryId:[[d valueForKey:@"category_id"] intValue]];
                 [cat setName:[d valueForKey:@"name"]];
                 
                 [arrayout addObject:cat];
             }];
             
             
             succededBlock(arrayout);
         }
         
         
     }onError:^(NSError* error) {
         
         errorBlock(error);
     }];
    
    [self enqueueOperation:op];
    
    return op;
    
    
}

@end
