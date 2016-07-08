//
//  MyBook.m
//  MyBook
//
//  Created by Александр Мелащенко on 7/5/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import "MELBook.h"
#import "MELVisitor.h"
#import "MELLibrary.h"

@interface MELBook()
{
@private
    NSString *_name;
    NSInteger _year;
    MELBookType _type;
    
    MELLibrary *_library;
}


@end

@implementation MELBook

+ (instancetype)CreateBookWithName:(NSString*)name aYear:(NSInteger)year aType:(MELBookType)type
{
    return [[[MELBook alloc]initWithName:name aYear:year aType:type] autorelease];

}

+ (instancetype)CreateBookWithName:(NSString*)name aYear:(NSInteger)year aType:(MELBookType)type aIdentifier:(NSString *)identifier
{
    return [[MELBook alloc] initWithName:name aYear:year aType:type aIdentifier:identifier];
}

+ (instancetype)CreateBookWithName:(NSString*)name aYear:(NSInteger)year aType:(MELBookType)type aLibrary:(MELLibrary *)library
{
    return [[MELBook alloc] initWithName:name aYear:year aType:type aLibrary:library];
}

+ (instancetype)CreateBookWithName:(NSString*)name aYear:(NSInteger)year aType:(MELBookType)type aIdentifier:(NSString *)identifier aLibrary:(MELLibrary *)library
{
    return [[MELBook alloc] initWithName:name aYear:year aType:type aIdentifier:identifier aLibrary:library];
}


- (instancetype)initWithName:(NSString*)name aYear:(NSInteger)year aType:(MELBookType)type
{
    return [self initWithName:name aYear:year aType:type aIdentifier:[[NSUUID alloc] init].UUIDString];
}

- (instancetype)initWithName:(NSString*)name aYear:(NSInteger)year aType:(MELBookType)type aIdentifier:(NSString *)identifier;
{
    return [self initWithName:name aYear:year aType:type aIdentifier:identifier aLibrary:nil];
}

- (instancetype)initWithName:(NSString*)name aYear:(NSInteger)year aType:(MELBookType)type aLibrary:(MELLibrary *)library
{
    return [self initWithName:name aYear:year aType:type aIdentifier:[[NSUUID alloc] init].UUIDString aLibrary:library];
}

- (instancetype)initWithName:(NSString*)name aYear:(NSInteger)year aType:(MELBookType)type aIdentifier:(NSString *)identifier aLibrary:(MELLibrary *)library
{
    if(self = [self init])
    {
        _name = [name copy];
        _year = year;
        _type = type;
        
        _library = library;
        
        if([_library containsIdentifier:identifier])
            @throw @"Identifier is already exist";
        else
            _identifier = identifier;
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"%@ dealloced", [self description]);
    
    [_library removeBook:self];
    
    [_name release];
    
    [super dealloc];
}

//Setters

- (void)setName:(NSString*)name
{
    if (name != _name)
    {
        [_name release];
        _name = [name copy];
    }
}

- (void)setYear:(NSInteger)year
{
    _year = year;
}

- (void)setBookType:(MELBookType)type
{
    _type = type;
}

- (void)setLibrary:(MELLibrary *)library
{
    _library = library;
    [_library addBook:self];
}

//Getters

- (NSString *)getName
{
    return _name;
}

- (NSInteger)getYear
{
    return _year;
}

- (MELBookType)getBookType
{
    return _type;
}

- (MELLibrary *)library
{
    return _library;
}

- (NSString *)getBookTypeAsNSString;
{
    NSString *type = [[NSString alloc] init];
    switch (_type)
    {
        case kMELBookTypePaperback:
            type = @"Paperback";
            break;
            
        case kMELBookTypeHadrcover:
            type = @"Hardcover";
            break;
            
        default:
            type = @"Unknown";
            break;
    }
    return type;
}

//


- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@ %lu %@", [super description], _name, _year, [self getBookTypeAsNSString]];
}

@end