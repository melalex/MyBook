//
//  MELBook_MELBookSerialization.h
//  MyBook
//
//  Created by Александр Мелащенко on 7/7/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import "MELBook.h"
#import "MELSerializable.h"

@interface MELBook (MELSerialization) <MELSerializable>

@end

@implementation MELBook (MELSerialization)

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