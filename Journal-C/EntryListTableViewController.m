//
//  EntryListTableViewController.m
//  Journal-C
//
//  Created by Caleb Hicks on 12/1/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import "EntryListTableViewController.h"
#import "EntryDetailViewController.h"
#import "EntryController.h"

@interface EntryListTableViewController ()

@end

@implementation EntryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [EntryController sharedController].entries.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    Entry *entry = [EntryController sharedController].entries[indexPath.row];
    
    cell.textLabel.text = entry.title;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    if ([segue.identifier isEqualToString:@"toViewEntry"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        
        Entry *entry = [EntryController sharedController].entries[indexPath.row];
        
        EntryDetailViewController *detailViewController = segue.destinationViewController;
        
        detailViewController.entry = entry;
    }
    
}

@end
