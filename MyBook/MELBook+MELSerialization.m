//
//  MELBook+MELSerialization.m
//  MyBook
//
//  Created by Александр Мелащенко on 7/8/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import "MELBook+MELSerialization.h"

@implementation MELBook (MELSerialization)

- (instancetype)initWithDictionaryRepresentation:(NSDictionary *)aDictionary
{
    return self;
}

- (NSDictionary *)dictionaryRepresentation;
{
    NSMutableDictionary *result = NSMutableDictionary.new;
    @autoreleasepool
    {
        [result setObject:self.getName forKey:@"name"];
        [result setObject:[NSNumber numberWithLong:self.getYear] forKey:@"year"];
        [result setObject:[NSNumber numberWithInt:self.getBookType] forKey:@"type"];
        [result setObject:self.identifier forKey:@"identifier"];
        
        // TODO
        //[result addEntriesFromDictionary:[self.owner dictionaryRepresentation]];
    }
    return result;
}

@end
