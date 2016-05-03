//
//  ContactList.h
//  Contact List
//
//  Created by Zach Smoroden on 2016-05-03.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"
#import "PhoneNumber.h"
#import "InputCollector.h"

@interface ContactList : NSObject

@property (nonatomic, strong) NSMutableArray *list;

-(instancetype)init;
-(void)addContact:(Contact *)newContact;
-(void)listContacts;
-(void)showContactWithId:(int)index;
-(BOOL)find:(NSString *)searchTerm;
-(NSMutableArray *)getPhoneNumbers;

-(void)seedContacts;
@end
