//
//  CategoriaViewController.m
//  OpenCartApp
//
//  Created by claudio barbera on 11/11/13.
//  Copyright (c) 2013 Claudio Barbera. All rights reserved.
//

#import "ArticoliViewController.h"
#import "Articolo.h"
#import "AppDelegate.h"
#import "ArticoloViewController.h"

@implementation ArticoliViewController

@synthesize categoriaSelezionata, articoli;



- (void)viewDidLoad
{
    [super viewDidLoad];

    
    [ApplicationDelegate.dataEngine fetchObjectsWithCategoryId:categoriaSelezionata.categoryId OnSucceeded:^(NSMutableArray *listOfObjects) {
        
        articoli = [[NSArray alloc] initWithArray:listOfObjects];
        [self.tableView reloadData];
        
    } onError:^(NSError *engineError) {
        
    }];
    

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    int i = [[self.tableView indexPathForSelectedRow] row];
    
    [[segue destinationViewController] setSelectedObjectId:[[articoli objectAtIndex:i] objectId]];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

  return [articoli count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"articoloCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Articolo *c = [articoli objectAtIndex:indexPath.row];
    UILabel *lblName = (UILabel *)[cell viewWithTag:1];
    UIImageView *img = (UIImageView *)[cell viewWithTag:2];
    
    
    [img setImageWithURL:[NSURL URLWithString:c.imagePath]];
    
    [lblName setText:c.name];
    
    return cell;

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
