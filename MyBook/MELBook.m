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
    
    NSString *_identifier;
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
        
        _identifier = [identifier copy];
        
        [library addBook:self];;
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"%@ dealloced", [self description]);
    
    [_name release];
    
    [super dealloc];
}

- (BOOL)isEqual:(MELBook *)other
{
    BOOL result = NO;
    
    if([_name isEqual:other.getName]
       && [self.owner isEqual:other.owner]
       && _year == other.getYear
       && _type == other.getBookType)
    {
        result = YES;
    }
    
    return result;
}

- (NSUInteger)hash
{
    return _name.hash + _year + _type + _owner.hash;
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

- (NSString *)identifier
{
    return _identifier;
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