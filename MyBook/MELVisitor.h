//
//  MELVisitor.h
//  MyBook
//
//  Created by Александр Мелащенко on 7/6/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MELMyBook;

@interface MELVisitor : NSObject
{
@private
    NSString *_name;
    NSString *_lastName;
    NSInteger _yearOfBirth;
}

@property (copy) NSString *name;
@property (copy) NSString *lastName;
@property NSInteger yearOfBirth;
@property (readonly, nonatomic) NSString *fullName;
@property (readonly, assign) MELMyBook *currentBook;

+ (instancetype)createMELVisitorWithName:(NSString *)name lastName:(NSString *)lastName yearOfBirth:(NSInteger)yearOfBirth;


- (instancetype)initWithName:(NSString *)name lastName:(NSString *)lastName yearOfBirth:(NSInteger)yearOfBirth;


- (void)setName:(NSString *)name;
- (void)setLastName:(NSString *)lastName;
- (void)setYearOfBirth:(NSInteger)yearOfBirth;


- (NSString *)name;
- (NSString *)lastName;
- (NSInteger)yearOfBirth;

- (NSString *)fullName;


- (BOOL)takeBook:(MELMyBook *)aBook;
- (BOOL)returnCurrentBook;

@end
