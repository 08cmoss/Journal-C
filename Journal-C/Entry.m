//
//  Entry.m
//  Journal-C
//
//  Created by Cameron Moss on 3/3/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

#import "Entry.h"

static NSString * const TitleKey = @"title";
static NSString * const TextKey = @"text";
static NSString * const TimestampKey = @"timestamp";

@implementation Entry

- (instancetype)initWithTitle:(NSString *)title text:(NSString *)text timestamp:(NSDate *)timestamp {
    self = [super init];
    if (self) {
        _title = title;
        _text = text;
        _timestamp = timestamp;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _title = dictionary[TitleKey];
        _text = dictionary[TextKey];
        _timestamp = dictionary[TimestampKey];
    }
    return self;
}

-(NSDictionary *)dictionaryCopy {
    return @{
             TitleKey: self.title,
             TextKey: self.text,
             TimestampKey: self.timestamp
             };
}



@end
