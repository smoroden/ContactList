//
//  main.m
//  Contact List
//
//  Created by Zach Smoroden on 2016-05-03.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Contact.h"
#import "ContactList.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //NSString *menu = @"What would you like do next? new - Create a new contact list - List all contacts quit - Exit Application";
        NSString *command;
        NSString *input;
        NSString *data;
        
        ContactList *contactList = [[ContactList alloc] init];
        InputCollector *inputCollector = [[InputCollector alloc] init];
        
        [contactList seedContacts];
        
        while (1) {
            input = [inputCollector inputForPrompt:@"What would you like do next? \n new - Create a new contact \n show [number] - Shows the contact with the id (number) \n find [search term] - Finds contacts that contain the search term \n list - List all contacts \n quit - Exit Application"];
            
            NSArray *components = [input componentsSeparatedByString:@" "];
            command = components[0];
            if (components.count > 1) {
                data = [input componentsSeparatedByString:@" "][1];
            }
            
            if ([command isEqualToString:@"quit"]) {
                NSLog(@"Goodbye!");
                return 0;
            } else if ([command isEqualToString:@"new"]) {
                NSString *email = [inputCollector inputForPrompt:@"Please enter the email address:\n"];
                
                while ([contactList find:email]) {
                    NSLog(@"------------------------------\nContact exists. ");
                    email = [inputCollector inputForPrompt:@"Please enter a new email address:\n"];
                }

                NSString *fullName = [inputCollector inputForPrompt:@"Please enter the full name (First Last):\n"];
                
                NSMutableArray *phoneNumbers = [contactList getPhoneNumbers];
                
                Contact *newContact = [[Contact alloc] init];
                newContact.fullName = fullName;
                newContact.email = email;
                newContact.phoneNumbers = phoneNumbers;
                
                [contactList addContact:newContact];
            } else if ([command isEqualToString:@"list"]) {
                [contactList listContacts];
            } else if ([command isEqualToString:@"show"]) {
                int index = [data intValue];
                [contactList showContactWithId:index];
            } else if ([command isEqualToString:@"find"]) {
                [contactList find:data];
            } else {
                NSLog(@"Invalid command.");
            }

        }
    }
    return 0;
}
