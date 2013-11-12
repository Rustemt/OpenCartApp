//
//  ArticoloViewController.m
//  OpenCartApp
//
//  Created by claudio barbera on 12/11/13.
//  Copyright (c) 2013 Claudio Barbera. All rights reserved.
//

#import "ArticoloViewController.h"
#import "AppDelegate.h"
#import "Articolo.h"

@interface ArticoloViewController ()
@property (nonatomic, retain) Articolo *a;
@end

@implementation ArticoloViewController
@synthesize lblName, selectedObjectId, imgProduct, a, scrollView;

NSMutableArray *images;

- (void)viewDidLoad
{
    [super viewDidLoad];

    scrollView.delegate = self;
    scrollView.scrollEnabled = YES;
    int scrollWidth = 320;

    
    [ApplicationDelegate.dataEngine fetchObjectWithId:selectedObjectId OnSucceeded:^(id object) {
        
        a = (Articolo *)object;
        lblName.text = a.name;
        [imgProduct setImageWithURL:[NSURL URLWithString:a.imagePath]];
        
        
        
         scrollView.contentSize = CGSizeMake(scrollWidth,80);
        
        int xOffset = 0;
        
        for(NSString *imgPath in a.otherPhotoPath)
        {
            if (![imgPath isEqual:[NSNull null]]){
            
                UIImageView *img = [[UIImageView alloc] init];
                img.bounds = CGRectMake(10, 10, 50, 50);
                img.frame = CGRectMake(5+xOffset, 0, 160, 110);
                
                NSString *urlString =[NSString stringWithFormat:@"http://www.sbuffo.it/demo/image/%@", imgPath];
                scrollView.contentSize = CGSizeMake(scrollWidth+xOffset,110);
                [scrollView addSubview:img];

                
                [img setImageWithURL:[NSURL URLWithString:urlString]];
                
                xOffset += 170;
                
            }
            
        }
        
    } onError:^(NSError *engineError) {
        
    }];
}



@end
