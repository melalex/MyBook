//
//  MELLibrary_MELLibrarySerialization.h
//  MyBook
//
//  Created by Александр Мелащенко on 7/7/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import "MELSerializable.h"
#import "MELLibrary.h"

@interface MELLibrary (MELSerialization) <MELSerializable>

@end

@implementation MELLibrary (MELSerialization)

- (instancetype)initWithDictionaryRepresentation:(NSDictionary *)aDictionary
{
    if(self = [self init])
    {
        
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation;
{
    NSMutableDictionary *result = NSMutableDictionary.new;
    return result;
}

- (instancetype)initWithFilePath:(NSString *)aPath;
{
    return self;
}

- (void)writeToFilePath:(NSString *)aPath;
{
    
}

@end