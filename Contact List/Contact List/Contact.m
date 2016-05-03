//
//  Contact.m
//  Contact List
//
//  Created by Zach Smoroden on 2016-05-03.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import "Contact.h"

@implementation Contact

-(instancetype)init {
    self.phoneNumbers = [@[] mutableCopy];
    
    return self;
}
@end
