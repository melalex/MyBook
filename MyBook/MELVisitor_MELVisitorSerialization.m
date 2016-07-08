//
//  MELVisitor_MELVisitorSerialization.h
//  MyBook
//
//  Created by Александр Мелащенко on 7/7/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import "MELVisitor.h"
#import "MELSerializable.h"

@interface MELVisitor (MELSerialization) <MELSerializable>

@end

@implementation MELVisitor (MELSerialization)

- (instancetype)initWithDictionaryRepresentation:(NSDictionary *)aDictionary
{
    return self;
}

- (NSDictionary *)dictionaryRepresentation;
{
    NSMutableDictionary *result = NSMutableDictionary.new;
    return result;
}

@end