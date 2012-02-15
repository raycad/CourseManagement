//
//  Course.m
//  CourseManagement
//
//  Created by raycad on 10/18/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import "Course.h"

@implementation CoursePK

@synthesize courseTitle = m_courseTitle;

- (id)initWithCourseTitle:(NSString *)courseTitle
{
    if ((self = [super init])) {
        // Initialize parameters
        m_courseTitle = courseTitle;
    }
    return self;   
}

- (void)dealloc 
{
    // Don't release or autorelease the m_courseTitle since it might cause the crash. m_courseTitle has been set autorelease in the initWithCourseTitle: function already.
    //[m_courseTitle release];
}

- (BOOL)isEqual:(id)object
{
    if (object == self)
        return YES;
    
    if (!object || ![object isKindOfClass:[self class]])
        return NO;
    
    NSString *courseTitle = [(CoursePK *)object courseTitle];
    if (!courseTitle)
        return NO;

    if ([self.courseTitle isEqual:courseTitle])
        return YES;

    return NO;
}
@end

@implementation Course

@synthesize title           = m_title;
@synthesize category        = m_category;
@synthesize description     = m_description;
@synthesize studentModel = m_studentModel;

- (id)initWithCoursePK:(CoursePK *)coursePK
{
    if ((self = [super init])) {
        // Initialize parameters
        m_title = @"iOS";
        m_category = @"IOS";
        m_description = @"iOS";
        
        m_studentModel = [[StudentModel alloc] init];
    }
    
    return self;
}

- (CoursePK *)coursePK
{
    return m_coursePK;
}

@end
