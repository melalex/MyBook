//
//  MELBook+MELSerialization.m
//  MyBook
//
//  Created by Александр Мелащенко on 7/8/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import "MELBook+MELSerialization.h"
#import "MELVisitor+MELSerialization.h"

@implementation MELBook (MELSerialization)

- (instancetype)initWithDictionaryRepresentation:(NSDictionary *)aDictionary
{
    return [[MELBook alloc] initWithName:aDictionary[@"name"] aYear:[aDictionary[@"year"] longLongValue] aType:[aDictionary[@"type"] longLongValue] aIdentifier:aDictionary[@"identifier"]];
}

- (NSDictionary *)dictionaryRepresentation;
{
    return @{@"name" : self.name,
            @"year" : [NSNumber numberWithLong:self.year],
            @"type" : [NSNumber numberWithInt:self.type],
            @"identifier" : self.identifier};
}

@end
