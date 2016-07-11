//
//  MELLibrary+MELSerialization.m
//  MyBook
//
//  Created by Александр Мелащенко on 7/8/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import "MELLibrary+MELSerialization.h"
#import "MELBook+MELSerialization.h"
#import "MELVisitor+MELSerialization.h"

@implementation MELLibrary (MELSerialization)

- (instancetype)initWithDictionaryRepresentation:(NSDictionary *)aDictionary
{
    if(self = [self init])
    {
        @autoreleasepool
        {
            MELVisitor *newVisitor;
            for(NSDictionary *visitor in aDictionary[@"visitors"])
            {
                newVisitor =[[[MELVisitor alloc] initWithDictionaryRepresentation:visitor] autorelease];
                
                for(MELBook *book in newVisitor.currentBooks)
                {
                    [self addBook:book];
                }
                
                [self addVisitor:newVisitor];
            }
            
            for(NSDictionary *books in aDictionary[@"books"])
            {
                [self addBook:[[[MELBook alloc] initWithDictionaryRepresentation:books] autorelease]];
            }
        }
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation;
{
    NSMutableArray *visitors = [NSMutableArray array];
    for(MELVisitor *visitor in self.visitors)
    {
        [visitors addObject:[visitor dictionaryRepresentation]];
    }
        
        
    NSMutableArray *books = [NSMutableArray array];
    for(MELBook *book in self.books)
    {
        if(!book.owner)
            [books addObject:[book dictionaryRepresentation]];
    }
    
    return @{@"visitors" : visitors, @"books" : books};
}

- (instancetype)initWithFilePath:(NSString *)aPath;
{
    @autoreleasepool
    {
        NSError *error;
        NSString *stringFromFileAtPath = [[NSString alloc] initWithContentsOfFile:aPath encoding:NSUTF8StringEncoding error:&error];
        
        if(!stringFromFileAtPath)
        {
            NSLog(@"initWithFilePath: error: %@", error.localizedDescription);
            stringFromFileAtPath = @"{}";
        }
        
        NSData *data = [stringFromFileAtPath dataUsingEncoding:NSUTF8StringEncoding];
        
        //Почему не работает???
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        return [self initWithDictionaryRepresentation:dictionary];
    }
}

- (void)writeToFilePath:(NSString *)aPath;
{
    NSError *error = NSError.new;
    NSString *jsonString;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[self dictionaryRepresentation]
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    if (!jsonData) {
        NSLog(@"writeToFilePath: error: %@", error.localizedDescription);
        jsonString = @"{}";
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    BOOL ok = [jsonString writeToFile:aPath atomically:YES encoding:NSUTF8StringEncoding error:&error];

    if (!ok)
    {
        NSLog(@"Error writing file at %@\n%@", aPath, [error localizedFailureReason]);
    }
}

@end
