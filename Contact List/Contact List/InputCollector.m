//
//  InputCollector.m
//  Contact List
//
//  Created by Zach Smoroden on 2016-05-03.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

-(NSString *)inputForPrompt:(NSString *)promptString {
    char inputChars[255];
    
    NSLog(@"%@ \n>  ", promptString);
    
    fgets(inputChars, 255, stdin);
    
    return [NSString stringWithUTF8String:inputChars];
}

@end
