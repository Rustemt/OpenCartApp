//
//  Articolo.m
//  OpenCartApp
//
//  Created by claudio barbera on 11/11/13.
//  Copyright (c) 2013 Claudio Barbera. All rights reserved.
//

#import "Articolo.h"

@implementation Articolo
@synthesize objectId, name, imagePath, otherPhotoPath;


-(id)init
{
    self = [super init];
    
    if (self)
    {
        otherPhotoPath = [[NSMutableArray alloc] init];
        
    }
    
    
    return self;
    
}

@end
