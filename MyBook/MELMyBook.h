//
//  MyBook.h
//  MyBook
//
//  Created by Александр Мелащенко on 7/5/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MELVisitor;

typedef NS_ENUM (NSInteger, MELBookType)
{
    kMELBookTypeUnknown = 0,
    kMELBookTypePaperback = 1,
    kMELBookTypeHadrcover = 2
};


@interface MELMyBook : NSObject
{
    @private
        NSString *_name;
        NSInteger _year;
        MELBookType _type;
}

@property (readwrite, assign) MELVisitor *owner;

+ (instancetype)CreateBookWithName:(NSString*)name Year:(NSInteger)year Type:(MELBookType)type;

- (instancetype)initWithName:(NSString*)name Year:(NSInteger)year Type:(MELBookType)type;

- (void)setName:(NSString*)name;
- (void)setYear:(NSInteger)year;
- (void)setBookType:(MELBookType)type;


- (NSString*)getName;
- (NSInteger)getYear;
- (MELBookType)getBookType;
- (NSString *)getBookTypeAsNSString;


- (NSString*)description;

@end
