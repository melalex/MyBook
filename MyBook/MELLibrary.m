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

@synthesize visitors = _vizitors;
@synthesize books = _books;

static MELLibrary * _instance = nil;

+ (id)allocWithZone:(NSZone *)zone
{
    return [[self getInstance] retain];
}

- (id)copyWithZone:(NSZone*)zone
{
    return self;
}

- (id)retain
{
    return self;
}
- (NSUInteger)retainCount
{
    return NSUIntegerMax;
}

- (oneway void) release
{
    
}

- (id)autorelease
{
    return self;
}

- (instancetype)init
{
    if (self = [super init])
    {
        _visitors = NSMutableArray.new;
        _books = NSMutableArray.new;
    }
    return self;
}

+(MELLibrary *)getInstance
{
    if(_instance)
    {
        _instance = [[super allocWithZone:nil] init];
    }
    return _instance;
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

