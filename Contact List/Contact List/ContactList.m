//
//  ContactList.m
//  Contact List
//
//  Created by Zach Smoroden on 2016-05-03.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import "ContactList.h"

@implementation ContactList

-(instancetype)init {
    self.list = [@[] mutableCopy];
    
    return self;
}

-(void)addContact:(Contact *)newContact {

    [self.list addObject:newContact];

}


-(void)listContacts {
    if (self.list.count != 0) {
        
        for (int i = 0; i < self.list.count; i++) {
            Contact *contact = self.list[i];
            NSLog(@"%i %@ ()", i, contact.fullName);
        }
    }
}

-(void)listPhoneNumbers:(Contact *)contact {
    for (PhoneNumber *phoneNumber in contact.phoneNumbers) {
        NSLog(@"%@: %@", phoneNumber.type, phoneNumber.number);
    }
}

-(void)printContact:(Contact *)contact {
    NSLog(@"Full Name: %@",contact.fullName);
    NSLog(@"Email: %@", contact.email);
    [self listPhoneNumbers:contact];
    NSLog(@"------------------------------");
}

-(void)showContactWithId:(int)index {
    if(index >= self.list.count || index < 0) {
        NSLog(@"Contact not found.\n");
    } else {
        Contact *contact = self.list[index];
        
        [self printContact:contact];
        
    }
}

-(BOOL)find:(NSString *)searchTerm {
    BOOL found = NO;
    if (searchTerm == nil) {
        NSLog(@"No search term found.");
    } else {
        for (Contact *contact in self.list) {
            if ([[contact.fullName lowercaseString] containsString:[searchTerm lowercaseString]] || [[contact.email lowercaseString] containsString:[searchTerm lowercaseString]]) {
                [self printContact:contact];
                found = YES;
            }
        }
        if (!found) {
            NSLog(@"No matches found.");
        }
    }
    return found;
}

-(NSMutableArray *)getPhoneNumbers {
    NSMutableArray *phoneList = [@[] mutableCopy];
    InputCollector *input = [[InputCollector alloc] init];
    BOOL exists = NO;
    
    while ([[[input inputForPrompt:@"Would you like to enter a phone number? (Y/N)"] lowercaseString] isEqualToString:@"y"]) {
        PhoneNumber *newPhoneNumber = [[PhoneNumber alloc] init];
        newPhoneNumber.number = [input inputForPrompt:@"Enter a number:"];
        for (PhoneNumber *entry in phoneList) {
            if ([entry.number isEqualToString:newPhoneNumber.number]) {
                NSLog(@"Number exists.");
                exists = YES;
                break;
            }
        }
        if (exists) {
            continue;
        }
        
        newPhoneNumber.type = [input inputForPrompt:@"Enter the type of number:"];
        
        [phoneList addObject:newPhoneNumber];
    }
    
    return phoneList;
}






-(void)seedContacts {
    NSArray *names = @[@"Job Joe", @"Alfred Azul", @"Clark Kent", @"Bruce Wayne", @"Jessica Jones"];
    NSArray *emails = @[@"job@joe.com", @"alfred@azul.com", @"super@man.com", @"bat@batman.com", @"jessica@jones.com"];
    for (int i = 0; i < names.count; i++) {
        Contact *newContact = [[Contact alloc] init];
        newContact.fullName = names[i];
        newContact.email = emails[i];
        
        [self addContact:newContact];
    }
}
@end
