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

- (BOOL)removeCourse:(Course *)course
{
    for (int i = 0; i < [m_courses count]; i++) {
        Course *courseTmp = [m_courses objectAtIndex:i];
        if (courseTmp == course) {
            [m_courses removeObjectAtIndex:i];
            return YES;
        }
    }
}

- (Course *)courseAtIndex:(int)index
{
    return [m_courses objectAtIndex:index];
}

- (BOOL)copyDataFrom:(CourseModel *)other
{
    // Clear the current model
    [self clear];
    
    for (int i = 0; i < [other count]; i++) {
        [self addCourse:[other courseAtIndex:i]];
    }
    return YES;
}

- (CourseModel *)searchByTitle:(NSString *)searchText
{
    CourseModel *courseModel = [[CourseModel alloc] init];
    Course *course = nil;
    for (int i = 0; i < [self count]; i++) {
        course = [self courseAtIndex:i];
        NSComparisonResult result = [course.title compare:searchText options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchText length])];
        if (result == NSOrderedSame) {
            [courseModel addCourse:course];
        }
    }
        
    if ([courseModel count] == 0)
        return nil;

    return [courseModel autorelease];
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
