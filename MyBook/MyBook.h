//
//  MyBook.h
//  MyBook
//
//  Created by Александр Мелащенко on 7/5/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {UNKNOWN, PAPERBACK, HARDCOVER} BookType;

@interface MyBook : NSObject
{
    @private
        NSString *_name;
        int _year;
        BookType _type;
}

+(instancetype)CreateBookWithName:(NSString*)name Year:(int)year Type:(BookType)type;

-(instancetype)init;
-(instancetype)initWithName:(NSString*)name Year:(int)year Type:(BookType)type;
-(void)dealloc;

-(void)setName:(NSString*)name;
-(void)setYear:(int)year;
-(void)setBookType:(BookType)type;


-(NSString*)getName;
-(int)getYear;
-(BookType)getBookType;

-(NSString*)description;

@end
