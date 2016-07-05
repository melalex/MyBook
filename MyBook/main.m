//
//  main.m
//  MyBook
//
//  Created by Александр Мелащенко on 7/5/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyBook.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MyBook *book1 = [[MyBook alloc] init];
        MyBook *book2 = [[MyBook alloc] initWithName:@"The Alchemist" Year:1988 Type:PAPERBACK];
        MyBook *book3 = [MyBook CreateBookWithName:@"Dark tower" Year:1982 Type:HARDCOVER];
        
        [book1 setName:@"1984"];
        [book1 setYear:1949];
        [book1 setBookType:PAPERBACK];
        
        NSLog(@"%@", [book1 description]);
        NSLog(@"%@", [book2 description]);
        
        NSString *type = [[NSString alloc] init];
        switch ([book3 getBookType])
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
        
        NSLog(@"%@ %d %@", [book3 getName], [book3 getYear], type);
        
        [book1 release];
        [book2 release];
    }
    return 0;
}
