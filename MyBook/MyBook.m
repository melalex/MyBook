//
//  MyBook.m
//  MyBook
//
//  Created by Александр Мелащенко on 7/5/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//


#import "MyBook.h"

@implementation MyBook

+(instancetype)CreateBookWithName:(NSString*)name Year:(int)year Type:(BookType)type
{
    return [[[MyBook alloc]initWithName:name Year:year Type:type] autorelease];

}

-(instancetype)init
{
    if(self = [super init])
    {
        _name = nil;
        _year = 0;
        _type = UNKNOWN;
    }
    return self;
}

-(instancetype)initWithName:(NSString*)name Year:(int)year Type:(BookType)type;
{
    if(self = [super init])
    {
        _name = [[NSString alloc] initWithString:name];
        _year = year;
        _type = type;
    }
    return self;
}


-(void)dealloc
{
    [_name release];
    [super dealloc];
}

//Setters

-(void)setName:(NSString*)name
{
    if (name != _name)
    {
        [_name release];
        _name = [[NSString alloc] initWithString:name];
    }
}

-(void)setYear:(int)year
{
    _year = year;
}

-(void)setBookType:(BookType)type
{
    _type = type;
}

//Getters

-(NSString*)getName
{
    return _name;
}

-(int)getYear
{
    return _year;
}

-(BookType)getBookType
{
    return _type;
}

//

- (NSString *)description
{
    NSString *type = [[NSString alloc] init];
    switch (_type)
    {
        case PAPERBACK:
            type = @"Paperback";
            break;
            
        case HARDCOVER:
            type = @"Hardcover";
            break;
            
        default:
            type = @"Unknown";
            break;
    }
    return [NSString stringWithFormat:@"%@ %d %@", _name, _year, type];
}

@end