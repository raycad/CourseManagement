//
//  Course.m
//  CourseManagement
//
//  Created by raycad on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Course.h"

@implementation CoursePK

-(id)initWithCode:(NSString *)courseCode
{
    if ((self = [super init])) {
        // Initialize parameters
        [m_courseCode autorelease]; // Use this to avoid releasing itself
        m_courseCode = [courseCode retain];
    }
    return self;   
}

-(NSString *)courseCode
{
    return m_courseCode;
}

-(void)dealloc 
{
    [m_courseCode release];
}

-(BOOL)isEqual:(id)object
{
    if (object == self)
        return YES;
    
    if (!object || ![object isKindOfClass:[self class]])
        return NO;
    
    if ([self.courseCode isEqual:[object courseCode]])
        return YES;

    return NO;
}
@end

@implementation Course

@synthesize title = m_title;
@synthesize description = m_description;

-(id)initWithCoursePK:(CoursePK *)coursePK
{
    if ((self = [super init])) {
        // Initialize parameters
        m_title = @"iOS";
        m_description = @"iOS";
        
        [m_coursePK autorelease]; // Use this to avoid releasing itself
        m_coursePK = [coursePK retain];
    }
    
    return self;
}

-(CoursePK *)coursePK
{
    return m_coursePK;
}

- (void)dealloc {
    NSLog(@"Title = %@", m_title);
    [m_title release];
    [m_description release];
    [m_coursePK release];
}

@end
