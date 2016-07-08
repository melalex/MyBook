//
//  MELVisitor.h
//  MyBook
//
//  Created by Александр Мелащенко on 7/6/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MELBook;

@interface MELVisitor : NSObject

@property (copy) NSString *name;
@property (copy) NSString *lastName;
@property NSInteger yearOfBirth;
@property (readonly) NSString *fullName;
@property (readonly) NSMutableArray *currentBooks;

@property (assign) MELLibrary *library;

+ (instancetype)createMELVisitorWithName:(NSString *)name lastName:(NSString *)lastName yearOfBirth:(NSInteger)yearOfBirth;
+ (instancetype)createMELVisitorWithName:(NSString *)name lastName:(NSString *)lastName yearOfBirth:(NSInteger)yearOfBirth library:(MELLibrary *)library;

- (instancetype)initWithName:(NSString *)name lastName:(NSString *)lastName yearOfBirth:(NSInteger)yearOfBirth;
- (instancetype)initWithName:(NSString *)name lastName:(NSString *)lastName yearOfBirth:(NSInteger)yearOfBirth library:(MELLibrary *)library;

- (BOOL)takeBook:(MELBook *)aBook;
- (BOOL)returnBook:(MELBook *)aBook;

@end
