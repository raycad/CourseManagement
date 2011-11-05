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
        [m_idNumber autorelease]; // Use this to avoid releasing itself
        m_idNumber = [idNumber retain];
    }
    return self;   
}

- (NSString *)idNumber
{
    return m_idNumber;
}

- (void)dealloc 
{
    [m_idNumber release];
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
        [m_personPK autorelease]; // Use this to avoid releasing itself
        m_personPK = [personPK retain];
    }
    
    return self;
}

- (PersonPK *)personPK
{
    return m_personPK;
}

- (void)dealloc
{
    [m_fullName release];
    [m_idNumber release];
    [m_dateOfBirth release];
    [m_address release];
    [m_mobilePhoneNumber release];
    
    [super dealloc];
}

@end
