//
//  MELVisitor+MELSerialization.m
//  MyBook
//
//  Created by Александр Мелащенко on 7/8/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import "MELVisitor+MELSerialization.h"
#import "MELBook+MELSerialization.h"

@implementation MELVisitor (MELSerialization)

- (instancetype)initWithDictionaryRepresentation:(NSDictionary *)aDictionary
{
    return self;
}

- (NSDictionary *)dictionaryRepresentation;
{
    NSMutableDictionary *result = NSMutableDictionary.new;
    
    @autoreleasepool
    {
        [result setObject:self.name forKey:@"name"];
        [result setObject:self.lastName forKey:@"lastName"];
        [result setObject:[NSNumber numberWithLong:self.yearOfBirth] forKey:@"yearOfBirth"];
        
        // TODO
//        for(MELBook *book in self.currentBooks)
//        {
//            [result addEntriesFromDictionary:[book dictionaryRepresentation]];
//        }
    }

    return result;
}

@end
