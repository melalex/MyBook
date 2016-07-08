//
//  MELVisitor.m
//  MyBook
//
//  Created by Александр Мелащенко on 7/6/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MELLibrary.h"
#import "MELVisitor.h"
#import "MELBook.h"

@interface MELVisitor()
{
@private
    NSString *_name;
    NSString *_lastName;
    NSInteger _yearOfBirth;
    
    MELLibrary *_library;
}

@property (readwrite) NSMutableArray *currentBooks;

@end

@implementation MELVisitor

//Memory management

+ (instancetype)createMELVisitorWithName:(NSString *)name lastName:(NSString *)lastName yearOfBirth:(NSInteger)yearOfBirth
{
    return [MELVisitor createMELVisitorWithName:name lastName:lastName yearOfBirth:yearOfBirth library:nil];
}

+ (instancetype)createMELVisitorWithName:(NSString *)name lastName:(NSString *)lastName yearOfBirth:(NSInteger)yearOfBirth library:(MELLibrary *)library
{
    return [[MELVisitor alloc] initWithName:name lastName:lastName yearOfBirth:yearOfBirth library:library];
}

- (instancetype)init
{
    if(self = [super init])
    {
        _currentBooks = NSMutableArray.new;
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name lastName:(NSString *)lastName yearOfBirth:(NSInteger)yearOfBirth
{
    return [self initWithName:name lastName:lastName yearOfBirth:yearOfBirth library:nil];
}

- (instancetype)initWithName:(NSString *)name lastName:(NSString *)lastName yearOfBirth:(NSInteger)yearOfBirth library:(MELLibrary *)library
{
    if(self = [self init])
    {
        _name = [name copy];
        _lastName = [lastName copy];
        _yearOfBirth = yearOfBirth;
        _library = library;
        [_library addVisitor:self];
    }
    return self;

}


- (void)dealloc
{
    NSLog(@"%@ dealloced", [self description]);
    
    [_library removeVisitor:self];
    
    [self.name release];
    [self.lastName release];
    
    [super dealloc];
}

//Setters

- (void)setName:(NSString *)name
{
    if(name != _name)
    {
        [_name release];
        _name = [name copy];
    }
}

- (void)setLastName:(NSString *)lastName
{
    if(lastName != _lastName)
    {
        [_lastName release];
        _lastName = [lastName copy];
    }
}

- (void)setYearOfBirth:(NSInteger)yearOfBirth
{
    _yearOfBirth = yearOfBirth;
}

- (void)setLibrary:(MELLibrary *)library
{
    [_library removeVisitor:self];
    _library = library;
    [_library addVisitor:self];
}

//Getters

- (NSString *)name
{
    return _name;
}

- (NSString *)lastName
{
    return _lastName;
}

- (NSInteger)yearOfBirth
{
    return  _yearOfBirth;
}

- (NSString *)fullName
{
    return [NSString stringWithFormat:@"%@ %@", self.name, self.lastName];
}

- (MELLibrary *)library
{
    return _library;
}

//"Book" methods

- (BOOL)takeBook:(MELBook *)aBook
{
    if(!aBook.owner)
    {
        [self.currentBooks addObject:aBook];
        aBook.owner = self;
        return YES;
    }
    return NO;
}

- (BOOL)returnBook:(MELBook *)aBook
{
    if([self.currentBooks containsObject:aBook])
    {
        aBook.owner = nil;
        [self.currentBooks removeObject:aBook];
        
        return YES;
    }
    return NO;
}

//description

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@", [super description], self.fullName];
}

@end