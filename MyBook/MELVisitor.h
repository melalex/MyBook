//
//  MELVisitor.h
//  MyBook
//
//  Created by Александр Мелащенко on 7/6/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MELBook;
@class MELLibrary;

@interface MELVisitor : NSObject

@property (copy) NSString *name;
@property (copy) NSString *lastName;
@property NSInteger yearOfBirth;
@property (readonly) NSString *fullName;
@property (readonly) NSMutableArray *currentBooks;
 
@property (readonly, assign) NSMutableArray *libraries;

+ (instancetype)createMELVisitorWithName:(NSString *)name lastName:(NSString *)lastName yearOfBirth:(NSInteger)yearOfBirth;

- (instancetype)initWithName:(NSString *)name lastName:(NSString *)lastName yearOfBirth:(NSInteger)yearOfBirth;

- (BOOL)takeBook:(MELBook *)aBook;
- (BOOL)returnBook:(MELBook *)aBook;

- (void)addLibrary:(MELLibrary*)library;
- (void)removeLibrary:(MELLibrary*)library;

@end
