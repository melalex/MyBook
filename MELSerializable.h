//
//  MELSerializable.h
//  MyBook
//
//  Created by Александр Мелащенко on 7/7/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MELSerializable <NSObject>

- (instancetype)initWithFilePath:(NSString *)aPath;
- (void)writeToFilePath:(NSString *)aPath;

@end
