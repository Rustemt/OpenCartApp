//
//  CategoriaViewController.h
//  OpenCartApp
//
//  Created by claudio barbera on 11/11/13.
//  Copyright (c) 2013 Claudio Barbera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Categoria.h"

@interface ArticoliViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) Categoria *categoriaSelezionata;
@property (nonatomic, strong) NSArray *articoli;

@end
