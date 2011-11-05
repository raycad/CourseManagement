//
//  CourseModel.m
//  CourseManagement
//
//  Created by raycad on 10/27/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import "CourseModel.h"


@implementation CourseModel

- (id)init
{
    self = [super init];
    if (self != nil) {
        // Initialize parameters
        m_courses = [[NSMutableArray alloc] init];
    }
    return self;
}

- (BOOL)addCourse:(Course *)course
{
    if ([self getCourseByPK:[course coursePK]])
        return NO; // The course is existing
    
    [m_courses addObject:course];
    
    return YES;
}

- (Course *)getCourseByPK:(CoursePK *)coursePK
{
    for (int i = 0; i < [m_courses count]; i++) {
        Course *course = [m_courses objectAtIndex:i];
        if ([coursePK isEqual:[course coursePK]])
            return course;
    }
    
    return nil;
}

- (BOOL)removeCourseByPK:(CoursePK *)coursePK;
{
    for (int i = 0; i < [m_courses count]; i++) {
        Course *course = [m_courses objectAtIndex:i];
        if ([coursePK isEqual:[course coursePK]]) {
            [m_courses removeObjectAtIndex:i];
            return YES;
        }
    }
    
    return NO;
}

- (BOOL)removeCourseByIndex:(int)index
{
    @try {
        [m_courses removeObjectAtIndex:index];
    } @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        return NO;
    } @finally {
        NSLog(@"finally");
        return YES;
    }    
}

- (Course *)courseAtIndex:(int)index
{
    return [m_courses objectAtIndex:index];
}

- (void)clear
{
    [m_courses removeAllObjects];
}

- (int)count
{
    return [m_courses count];
}

- (void)dealloc
{
    [m_courses release];
    [super dealloc];
}
@end
