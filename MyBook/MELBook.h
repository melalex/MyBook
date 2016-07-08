//
//  MyBook.h
//  MyBook
//
//  Created by Александр Мелащенко on 7/5/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MELVisitor;
@class MELLibrary;

typedef NS_ENUM (NSInteger, MELBookType)
{
    kMELBookTypeUnknown = 0,
    kMELBookTypePaperback = 1,
    kMELBookTypeHadrcover = 2
};


@interface MELBook : NSObject

@property (readwrite, assign) MELVisitor *owner;
@property (readonly) NSString *identifier;

@property (readwrite, assign) MELLibrary *library;

+ (instancetype)CreateBookWithName:(NSString*)name aYear:(NSInteger)year aType:(MELBookType)type;
+ (instancetype)CreateBookWithName:(NSString*)name aYear:(NSInteger)year aType:(MELBookType)type aIdentifier:(NSString *)identifier;
+ (instancetype)CreateBookWithName:(NSString*)name aYear:(NSInteger)year aType:(MELBookType)type aLibrary:(MELLibrary *)library;
+ (instancetype)CreateBookWithName:(NSString*)name aYear:(NSInteger)year aType:(MELBookType)type aIdentifier:(NSString *)identifier aLibrary:(MELLibrary *)library;

- (instancetype)initWithName:(NSString*)name aYear:(NSInteger)year aType:(MELBookType)type;
- (instancetype)initWithName:(NSString*)name aYear:(NSInteger)year aType:(MELBookType)type aIdentifier:(NSString *)identifier;
- (instancetype)initWithName:(NSString*)name aYear:(NSInteger)year aType:(MELBookType)type aLibrary:(MELLibrary *)library;
- (instancetype)initWithName:(NSString*)name aYear:(NSInteger)year aType:(MELBookType)type aIdentifier:(NSString *)identifier aLibrary:(MELLibrary *)library;

- (void)setName:(NSString*)name;
- (void)setYear:(NSInteger)year;
- (void)setBookType:(MELBookType)type;


- (NSString*)getName;
- (NSInteger)getYear;
- (MELBookType)getBookType;
- (NSString *)getBookTypeAsNSString;


- (NSString*)description;

@end
