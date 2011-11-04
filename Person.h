//
//  Person.h
//  CourseManagement
//
//  Created by raycad on 10/18/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonPK : NSObject {
    NSString *m_idNumber;
}

-(id)initWithIdNumber:(NSString *)idNumber;
-(NSString *)idNumber;

@end

@interface Person : NSObject {
    NSString    *m_fullName;
    NSString    *m_idNumber;
    NSString    *m_dateOfBirth;
    NSString    *m_address;
    NSString    *m_mobilePhoneNumber;
    int         m_sex; // Male = 0; Female = 1
    
    PersonPK    *m_personPK;
}

@property (nonatomic, retain) NSString *fullName;
@property (nonatomic, retain) NSString *idNumber;
@property (nonatomic, retain) NSString *dateOfBirth;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, retain) NSString *mobilePhoneNumber;
@property int sex;

-(id)initWithPersonPK:(PersonPK *)personPK;
-(PersonPK *)personPK;

@end
