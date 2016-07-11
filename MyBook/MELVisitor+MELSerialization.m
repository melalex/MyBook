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
    if(self = [[MELVisitor alloc] initWithName:aDictionary[@"name"] lastName:aDictionary[@"lastName"] yearOfBirth:[@"yearOfBirth" longLongValue]])
    {
        @autoreleasepool
        {
            MELBook *newBook;
            
            for(NSDictionary *book in aDictionary[@"currentBooks"])
            {
                newBook = [MELBook CreateBookWithName:book[@"name"] aYear:[book[@"year"] longLongValue] aType:[book[@"type"] longLongValue] aIdentifier:book[@"identifier"]];
                
                
                newBook.owner = self;
                
                [self takeBook:newBook];
            };
        }
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation;
{
    NSMutableArray *currentBooks = [NSMutableArray array];
    for(MELBook *book in self.currentBooks)
    {
        NSDictionary *serializedBook = [book dictionaryRepresentation];
            
        [currentBooks addObject:serializedBook];
    }
    
    return @{@"name" : self.name, @"lastName" : self.lastName, @"yearOfBirth" : [NSNumber numberWithLong:self.yearOfBirth], @"currentBooks" : currentBooks};
}

@end
