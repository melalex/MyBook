//
//  MELLibrary.m
//  MyBook
//
//  Created by Александр Мелащенко on 7/7/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import "MELLibrary.h"
#import "MELVisitor.h"
#import "MELBook.h"

@interface MELLibrary()
{
    @private
        NSMutableArray *_visitors;
        NSMutableArray *_books;
}
@end

@implementation MELLibrary

- (instancetype)init
{
    if (self = [super init])
    {
        _visitors = NSMutableArray.new;
        _books = NSMutableArray.new;
    }
    return self;
}


- (BOOL)containsIdentifier:(NSString *)identifier
{
    BOOL result = NO;
    
    for(MELBook *book in self.books)
    {
        if([book.identifier isEqual:identifier])
        {
            result = YES;
            break;
        }
    }
    
    return result;
}


- (NSArray *)visitors
{
    return _visitors;
}

- (NSArray *)books
{
    return _books;
}


- (void)addBook:(MELBook*)book
{
    [self.books addObject:book];
}

- (void)removeBook:(MELBook*)book
{
    [self.books removeObject:book];
}

- (void)addVisitor:(MELVisitor *)visitor
{
    [self.visitors addObject:visitor];
}

- (void)removeVisitor:(MELVisitor *)visitor
{
    [self.visitors removeObject:visitor];
}


@end

