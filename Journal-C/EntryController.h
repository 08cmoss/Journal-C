//
//  EntryController.h
//  Journal-C
//
//  Created by Cameron Moss on 3/3/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

@interface EntryController : NSObject

@property (strong, nonatomic) NSMutableArray *entries;

- (void)addEntry:(Entry *)entry;
- (void)removeEntry:(Entry *)entry;
+ (EntryController *)sharedInstance;

@end
