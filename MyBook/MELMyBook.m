//
//  MyBook.m
//  MyBook
//
//  Created by Александр Мелащенко on 7/5/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import "MELMyBook.h"
#import "MELVisitor.h"

@implementation MELMyBook

+ (instancetype)CreateBookWithName:(NSString*)name Year:(NSInteger)year Type:(MELBookType)type
{
    return [[[MELMyBook alloc]initWithName:name Year:year Type:type] autorelease];

}


- (instancetype)initWithName:(NSString*)name Year:(NSInteger)year Type:(MELBookType)type;
{
    if(self = [super init])
    {
        _name = [[NSString alloc] initWithString:name];
        _year = year;
        _type = type;
    }
    return self;
}


- (void)dealloc
{
    NSLog(@"%@ dealloced", [self description]);
    
    [_name release];
    
    [super dealloc];
}

//Setters

- (void)setName:(NSString*)name
{
    if (name != _name)
    {
        [_name release];
        _name = [[NSString alloc] initWithString:name];
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