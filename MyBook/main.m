//
//  main.m
//  MyBook
//
//  Created by Александр Мелащенко on 7/5/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MELBook.h"
#import "MELVisitor.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MELBook *book1 = [[MELBook alloc] init];
        MELBook *book2 = [[MELBook alloc] initWithName:@"The Alchemist" aYear:1988 aType:kMELBookTypePaperback];
        MELBook *book3 = [MELBook CreateBookWithName:@"Dark tower" Year:1982 Type:kMELBookTypeHadrcover];
        
        [book1 setName:@"1984"];
        [book1 setYear:1949];
        [book1 setBookType:kMELBookTypePaperback];
        
        NSLog(@"%@", book1);
        NSLog(@"%@", book2);
        
        NSLog(@"%@ %lu %@", [book3 getName], [book3 getYear], [book3 getBookTypeAsNSString]);
        
        MELVisitor *visitor1 = [[MELVisitor alloc] init];
        MELVisitor *visitor2 = [[MELVisitor alloc] initWithName:@"Vasya" lastName:@"Pupkin" yearOfBirth:1939];
        MELVisitor *visitor3 = [MELVisitor createMELVisitorWithName:@"Ivan" lastName:@"Ivanov" yearOfBirth:1945];
        
        visitor1.name = @"Sanya";
        visitor1.lastName = @"Belui";
        visitor1.yearOfBirth = 2007;
        
        NSLog(@"%@", visitor1);
        NSLog(@"%@", visitor2);
        
        NSLog(@"%@ %@ %lu", visitor3.name, visitor3.lastName, visitor3.yearOfBirth);
        
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
        
        
        if([visitor1 returnCurrentBook])
            NSLog(@"%@ return", visitor1);
        else
            NSLog(@"%@ don't have book", visitor1);

        if([visitor2 returnCurrentBook])
            NSLog(@"%@ return", visitor2);
        else
            NSLog(@"%@ don't have book", visitor2);

        if([visitor3 returnCurrentBook])
            NSLog(@"%@ return", visitor3);
        else
            NSLog(@"%@ don't have book", visitor3);
        
        if([visitor3 returnCurrentBook])
            NSLog(@"%@ return", visitor3);
        else
            NSLog(@"%@ don't have book", visitor3);

        
        [book1 release];
        [book2 release];
        
        [visitor1 release];
        [visitor2 release];
    }
    
    NSLog(@"Main ended");
    
    return 0;
}
