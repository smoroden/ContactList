//
//  main.m
//  Contact List
//
//  Created by Zach Smoroden on 2016-05-03.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *menu = @"What would you like do next? new - Create a new contact list - List all contacts quit - Exit Application";
        
        InputCollector *inputCollector = [[InputCollector alloc] init];
        
        NSLog(@"The input was: %@",[inputCollector inputForPrompt:menu]);
        
    }
    return 0;
}
