//
//  Entry.h
//  Journal-C
//
//  Created by Cameron Moss on 3/3/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entry : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSDate *timestamp;

@property (copy, nonatomic) NSDictionary *dictionaryCopy;

- (instancetype)initWithTitle:(NSString *)title text:(NSString *) text timestamp:(NSDate *)timestamp;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
