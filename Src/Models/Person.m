//
//  Person.m
//  CourseManagement
//
//  Created by raycad on 10/18/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import "Person.h"

@implementation PersonPK

- (id)initWithIdNumber:(NSString *)idNumber
{
    if ((self = [super init])) {
        // Initialize parameters
        m_idNumber = idNumber;
    }
    return self;   
}

- (NSString *)idNumber
{
    return m_idNumber;
}

- (BOOL)isEqual:(id)object
{
    if (object == self)
        return YES;
    
    if (!object || ![object isKindOfClass:[self class]])
        return NO;
    
    if ([self.idNumber isEqual:[object idNumber]])
        return YES;
    
    return NO;
}
@end

@implementation Person

@synthesize fullName            = m_fullName;
@synthesize idNumber            = m_idNumber;
@synthesize dateOfBirth         = m_dateOfBirth;
@synthesize address             = m_address;
@synthesize mobilePhoneNumber   = m_mobilePhoneNumber;
@synthesize sex                 = m_sex;

- (id)initWithPersonPK:(PersonPK *)personPK
{
    if ((self = [super init])) {
        // Initialize parameters
        m_personPK = personPK;
    }
    
    return self;
}

- (PersonPK *)personPK
{
    return m_personPK;
}

@end
