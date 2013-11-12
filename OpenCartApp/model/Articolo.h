//
//  Articolo.h
//  OpenCartApp
//
//  Created by claudio barbera on 11/11/13.
//  Copyright (c) 2013 Claudio Barbera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Articolo : NSObject

@property (nonatomic, strong) NSString *objectId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *imagePath;
@property (nonatomic, strong) NSMutableArray *otherPhotoPath;


@end
