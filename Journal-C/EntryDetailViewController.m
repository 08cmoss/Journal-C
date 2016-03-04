//
//  EntryDetailViewController.m
//  Journal-C
//
//  Created by Cameron Moss on 3/3/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

#import "EntryDetailViewController.h"
#import "EntryController.h"

@interface EntryDetailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
//

@end

@implementation EntryDetailViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self updateWith:self.entry];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateWith:(Entry *)entry {
    if (self.entry) {
        self.entry = entry;
        self.textField.text = self.entry.title;
        self.textView.text = self.entry.text;
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return true;
}

- (IBAction)clearButtonTapped:(id)sender {
    self.textView.text = @"";
}

- (IBAction)saveButtonTapped:(id)sender {
    //check entry if it holds an entry, if so update the properties of the entry
    if (self.entry) {
        self.entry.title = self.textField.text;
        self.entry.text = self.textView.text;
        self.entry.timestamp = [NSDate date];
    } else {
    //if not call the save method on the EntryController
        
        Entry *entry = [[Entry alloc] initWithTitle:self.textField.text text:self.textView.text timestamp:[NSDate date]];
        
        [[EntryController sharedInstance] addEntry:entry];
        
        self.entry = entry;
        //after saving the entry, dismiss the current view
    }
    [self.navigationController popViewControllerAnimated:true];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
