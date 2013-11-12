//
//  DataEngine.m
//  OpenCartApp
//
//  Created by claudio barbera on 09/11/13.
//  Copyright (c) 2013 Claudio Barbera. All rights reserved.
//

#import "DataEngine.h"
#import "Categoria.h"
#import "Articolo.h"

#define WEB_API_KEY @"00112233"

@implementation DataEngine

-(id) initWithDefaultSettings {
    
    if(self = [super initWithHostName:@"www.sbuffo.it/demo"
                   customHeaderFields:nil]) {
        
    }
    
    return self;
}

-(MKNetworkOperation *)fetchCategoriesOnSucceeded:(ArrayResponseBlock)succededBlock onError:(ErrorBlock)errorBlock{

    NSMutableDictionary *params = [[NSMutableDictionary alloc] initWithCapacity:2];
    
    [params setValue:WEB_API_KEY forKey:@"key"];    
    [params setValue:@"feed/web_api/categories" forKey:@"route"];
    
    
    MKNetworkOperation *op = [self operationWithPath:@"index.php" params:params];
    
    
    [op onCompletion:^(MKNetworkOperation *completedOperation)
     {
         BOOL isCachedResponse = [completedOperation isCachedResponse];
         
         if (!isCachedResponse){
            
             NSMutableDictionary *responseDictionary = [op responseJSON];
             
             NSMutableArray *items = [responseDictionary objectForKey:@"categories"];
             
             NSMutableArray *arrayout = [NSMutableArray array];
             
             [items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                 
                 NSDictionary *d = (NSDictionary *)obj;
                 
                 
                 Categoria *cat = [[Categoria alloc] init];
                 [cat setCategoryId:[d valueForKey:@"category_id"]];
                 [cat setName:[d valueForKey:@"name"]];
                 
                 NSString * thumb = (NSString *)[d valueForKey: @"image"];
                 
                 
                 Class boolClass = [[NSNumber numberWithBool:YES] class];
                 
                 if(![thumb isKindOfClass:boolClass])
                     [cat setImagePath:thumb];
                 
                 
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

-(MKNetworkOperation *)fetchCategoryWithId:(NSString *)categoryId OnSucceeded:(ArrayResponseBlock)succededBlock onError:(ErrorBlock)errorBlock{


    NSMutableDictionary *params = [[NSMutableDictionary alloc] initWithCapacity:2];
    
    [params setValue:categoryId forKey:@"id"];

    
    MKNetworkOperation *op = [self operationWithPath:@"index.php?route=feed/web_api/category" params:params];
    
    
    [op onCompletion:^(MKNetworkOperation *completedOperation)
     {
         BOOL isCachedResponse = [completedOperation isCachedResponse];
         
         if (!isCachedResponse){
             
             NSString *r = [op responseString];
             NSMutableDictionary *responseDictionary = [op responseJSON];
             
             NSMutableArray *items = [responseDictionary objectForKey:@"categories"];
             
             NSMutableArray *arrayout = [NSMutableArray array];
             
             [items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                 
                 NSDictionary *d = (NSDictionary *)obj;
                 
                 
                 Categoria *cat = [[Categoria alloc] init];
                 [cat setCategoryId:[d valueForKey:@"category_id"]];
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

-(MKNetworkOperation *)fetchObjectsWithCategoryId:(NSString *)categoryId OnSucceeded:(ArrayResponseBlock)succededBlock onError:(ErrorBlock)errorBlock{

    NSMutableDictionary *params = [[NSMutableDictionary alloc] initWithCapacity:3];
   
    [params setValue:@"feed/web_api/products" forKey:@"route"];
    [params setValue:WEB_API_KEY forKey:@"key"];
    [params setValue:categoryId forKey:@"category"];
    
    
    MKNetworkOperation *op = [self operationWithPath:@"index.php" params:params];
   
    
    [op onCompletion:^(MKNetworkOperation *completedOperation)
     {
         BOOL isCachedResponse = [completedOperation isCachedResponse];
         
         if (!isCachedResponse){
             
             NSMutableDictionary *responseDictionary = [op responseJSON];
             
             NSMutableArray *items = [responseDictionary objectForKey:@"products"];
             
             NSMutableArray *arrayout = [NSMutableArray array];
             
             [items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                 
                 NSDictionary *d = (NSDictionary *)obj;
                 
                
                 Articolo *art = [[Articolo alloc] init];
                 [art setObjectId:[d valueForKey:@"id"]];
                 [art setName:[d valueForKey:@"name"]];
                 
                 NSString * thumb = (NSString *)[d valueForKey: @"thumb"];

                 
                 Class boolClass = [[NSNumber numberWithBool:YES] class];
                
                 if(![thumb isKindOfClass:boolClass])
                     [art setImagePath:thumb];
                
                 
                 [arrayout addObject:art];
             }];
             
             
             succededBlock(arrayout);
         }
         
         
     }onError:^(NSError* error) {
         
         errorBlock(error);
     }];
    
    [self enqueueOperation:op];
    
    return op;
    
    
}

-(MKNetworkOperation *)fetchObjectWithId:(NSString *)objectId OnSucceeded:(ModelBlock)modelBlock onError:(ErrorBlock)errorBlock{

    NSMutableDictionary *params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    [params setValue:@"feed/web_api/product" forKey:@"route"];
    [params setValue:WEB_API_KEY forKey:@"key"];
    [params setValue:objectId forKey:@"id"];
    
    
    MKNetworkOperation *op = [self operationWithPath:@"index.php" params:params];
    
    
    [op onCompletion:^(MKNetworkOperation *completedOperation)
     {
         BOOL isCachedResponse = [completedOperation isCachedResponse];
         
         if (!isCachedResponse){
             
             NSMutableDictionary *responseDictionary = [op responseJSON];
             NSMutableDictionary *artDict = [responseDictionary objectForKey:@"product"];
             
             Articolo *a = [[Articolo alloc] init];
             [a setName:[artDict valueForKey:@"name"]];
             [a setImagePath:[artDict valueForKey:@"image"]];
             
              NSMutableArray *imgs = [artDict objectForKey:@"images"];
             
             
             [imgs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                 
                 [a.otherPhotoPath addObject:(NSString *)obj];
             }];
             
             modelBlock(a);
         }
         
         
     }onError:^(NSError* error) {
         
         errorBlock(error);
     }];
    
    [self enqueueOperation:op];
    
    return op;

    
}
@end
