//
//  MELVisitor.m
//  MyBook
//
//  Created by Александр Мелащенко on 7/6/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MELVisitor.h"
#import "MELMyBook.h"

@interface MELVisitor()

@property (readwrite, assign, ) MELMyBook *currentBook;

@end

@implementation MELVisitor

//Memory management

+ (instancetype)createMELVisitorWithName:(NSString *)name lastName:(NSString *)lastName yearOfBirth:(NSInteger)yearOfBirth
{
    return [[[MELVisitor alloc] initWithName:name lastName:lastName yearOfBirth:yearOfBirth] autorelease];
}

- (instancetype)initWithName:(NSString *)name lastName:(NSString *)lastName yearOfBirth:(NSInteger)yearOfBirth
{
    if(self = [super init])
    {
        _name = [[NSString alloc] initWithString:name];
        _lastName = [[NSString alloc] initWithString:lastName];
        _yearOfBirth = yearOfBirth;
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"%@ dealloced", [self description]);
    
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
        _name = [[NSString alloc] initWithString:name];
    }
}

- (void)setLastName:(NSString *)lastName
{
    if(lastName != _lastName)
    {
        [_lastName release];
        _lastName = [[NSString alloc] initWithString:lastName];
    }
}

- (void)setYearOfBirth:(NSInteger)yearOfBirth
{
    _yearOfBirth = yearOfBirth;
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

//"Book" methods

- (BOOL)takeBook:(MELMyBook *)aBook
{
    if(!self.currentBook && !aBook.owner)
    {
        [aBook retain];
        self.currentBook = aBook;
        aBook.owner = self;
        return YES;
    }
    return NO;
}

- (BOOL)returnCurrentBook;
{
    if(self.currentBook)
    {
        self.currentBook.owner = nil;
        [self.currentBook release];
        self.currentBook = nil;
        
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