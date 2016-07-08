//
//  MELLibrary+MELSerialization.m
//  MyBook
//
//  Created by Александр Мелащенко on 7/8/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import "MELLibrary+MELSerialization.h"
#import "MELBook.h"
#import "MELVisitor.h"

@implementation MELLibrary (MELSerialization)

- (instancetype)initWithDictionaryRepresentation:(NSDictionary<NSString *, id> *)aDictionary
{
    if(self = [self init])
    {
        for(NSString *key in aDictionary)
        {
            if([aDictionary[key] isKindOfClass:[MELBook class]])
                [self addBook:aDictionary[key]];
            else
                [self addVisitor:aDictionary[key]];
        }
    }
    return self;
}

- (NSDictionary<NSString*, id> *)dictionaryRepresentation;
{
    NSMutableDictionary<NSString*, id> *result = NSMutableDictionary.new;
    
    for(MELBook *book in self.books)
        [result setObject:book forKey:book.identifier];
    
    //for(MELVisitor *visitor in self.visitors)
        
        
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
