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
#import "NSArray+MELEquality.h"

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

- (BOOL)isEqual:(MELLibrary *)other
{
    BOOL result = NO;
    
    if([self.books isSame:other.books] && [self.visitors isSame:other.visitors])
        result = YES;
    
    return result;
}

- (NSUInteger)hash
{
    return self.visitors.hash + self.books.hash;
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

- (BOOL)containsIdentityVisitor:(MELVisitor*)newVisitor
{
    BOOL result = NO;
    
    for(MELVisitor *visitor in self.visitors)
    {
        if(visitor == newVisitor)
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
    if(![self containsIdentifier:book.identifier])
    {
        [book.library removeBook:book];
        book.library = self;
        [self.books addObject:book];
    }
}

- (void)removeBook:(MELBook*)book
{
    book.library = nil;
    [self.books removeObject:book];
}

- (void)addVisitor:(MELVisitor *)visitor
{
    if(![self containsIdentityVisitor:visitor])
    {
        [self.visitors addObject:visitor];
        [visitor addLibrary:self];
    }
}

- (void)removeVisitor:(MELVisitor *)visitor
{
    [self.visitors removeObject:visitor];
    [visitor removeLibrary:self];
}

//Search

- (NSMutableArray *)findBook:(NSString *)name
{
    NSMutableArray *result = [NSMutableArray.new autorelease];
    for(MELBook *book in self.books)
    {
        if([book.name rangeOfString:name options:(NSCaseInsensitiveSearch)].length != 0)
        {
            [result addObject:book];
        }
    }
    return result;
}

- (NSMutableArray *)findVisitor:(NSString *)name
{
    NSMutableArray *result = [NSMutableArray.new autorelease];
    for(MELVisitor *visitor in self.visitors)
    {
        if([visitor.fullName rangeOfString:name options:(NSCaseInsensitiveSearch)].length != 0)
        {
            [result addObject:visitor];
        }
    }
    return result;
}


@end

