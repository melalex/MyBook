//
//  main.m
//  MyBook
//
//  Created by Александр Мелащенко on 7/5/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MELBook+MELSerialization.h"
#import "MELVisitor+MELSerialization.h"
#import "MELLibrary+MELSerialization.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MELBook *book1 = [[MELBook alloc] init];
        MELBook *book2 = [[MELBook alloc] initWithName:@"The Alchemist" aYear:1988 aType:kMELBookTypePaperback];
        MELBook *book3 = [MELBook CreateBookWithName:@"Dark tower" aYear:1982 aType:kMELBookTypeHadrcover];
        
        [book1 setName:@"1984"];
        [book1 setYear:1949];
        [book1 setBookType:kMELBookTypePaperback];
        
        NSLog(@"%@", book1);
        NSLog(@"%@", book2);
        
        NSLog(@"%@ %lu %@", [book3 name], [book3 year], [book3 getBookTypeAsNSString]);
        
        MELVisitor *visitor1 = [[MELVisitor alloc] init];
        MELVisitor *visitor2 = [[MELVisitor alloc] initWithName:@"Vasya" lastName:@"Pupkin" yearOfBirth:1939];
        MELVisitor *visitor3 = [MELVisitor createMELVisitorWithName:@"Ivan" lastName:@"Ivanov" yearOfBirth:1945];
        
        visitor1.name = @"Sanya";
        visitor1.lastName = @"Belui";
        visitor1.yearOfBirth = 2007;
        
        NSLog(@"%@", visitor1);
        NSLog(@"%@", visitor2);
        
        NSLog(@"%@ %@ %lu", visitor3.name, visitor3.lastName, visitor3.yearOfBirth);
        
        MELLibrary *library1 = [[MELLibrary alloc] init];
        
        [library1 addBook:book1];
        [library1 addBook:book2];
        [library1 addBook:book3];
        
        [library1 addVisitor:visitor1];
        [library1 addVisitor:visitor2];
        [library1 addVisitor:visitor3];
        
        if([visitor1 takeBook:book1])
            NSLog(@"%@ take %@", visitor1, book1);
        else
            NSLog(@"%@ can't take %@", visitor1, book1);
        
        if([visitor2 takeBook:book2])
            NSLog(@"%@ take %@", visitor2, book2);
        else
            NSLog(@"%@ can't take %@", visitor2, book2);
        
        if([visitor3 takeBook:book3])
            NSLog(@"%@ take %@", visitor3, book3);
        else
            NSLog(@"%@ can't take %@", visitor3, book3);
        
        if([visitor3 takeBook:book3])
            NSLog(@"%@ take %@", visitor3, book3);
        else
            NSLog(@"%@ can't take %@", visitor3, book3);

        
        [library1 writeToFilePath:@"/Users/melalex/Desktop/Projects/MyBook Exercise 4/library1.json"];
        
        NSDictionary *serializedBookLibrary1 = [library1 dictionaryRepresentation];
        
//        MELLibrary *library2 = [[MELLibrary alloc] initWithFilePath:@"/Users/melalex/Desktop/Projects/MyBook Exercise 4/library1.json"];
        
        MELLibrary *library2 = [[MELLibrary alloc] initWithDictionaryRepresentation:serializedBookLibrary1];
        
        if([library1 isEqual:library1])
        {
            NSLog(@"[library1 isEqual:library1]");
        }
        else
        {
            NSLog(@"![library1 isEqual:library1]");
        }
        
        NSLog(@"%lu book(s) found", (unsigned long)[library2 findBook:@"Al"].count);
        
        if([visitor1 returnBook:book1])
            NSLog(@"%@ return", visitor1);
        else
            NSLog(@"%@ don't have book", visitor1);

        if([visitor2 returnBook:book2])
            NSLog(@"%@ return", visitor2);
        else
            NSLog(@"%@ don't have book", visitor2);

        if([visitor3 returnBook:book3])
            NSLog(@"%@ return", visitor3);
        else
            NSLog(@"%@ don't have book", visitor3);
        
        if([visitor3 returnBook:book3])
            NSLog(@"%@ return", visitor3);
        else
            NSLog(@"%@ don't have book", visitor3);
        

        [book1 release];
        [book2 release];
        
        [visitor1 release];
        [visitor2 release];
        
        [library1 release];
        [library2 release];
    }
    
    NSLog(@"Main ended");
    
    return 0;
}
