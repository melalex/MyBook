//
//  MELLibrary_MELLibrarySerialization.h
//  MyBook
//
//  Created by Александр Мелащенко on 7/7/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import "MELLibrary.h"
#import "MELSerializable.h"

@interface MELLibrary (MELSerialization) <MELSerializable>

@end

@implementation MELLibrary

- (instancetype)initWithFilePath:(NSString *)aPath;
{
    return self;
}

- (void)writeToFilePath:(NSString *)aPath;
{
    
}

@end