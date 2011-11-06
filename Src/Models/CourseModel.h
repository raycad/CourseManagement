//
//  CourseModel.h
//  CourseManagement
//
//  Created by raycad on 10/27/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Course.h"

@interface CourseModel : NSObject {
    NSMutableArray *m_courses;
}

- (BOOL)addCourse:(Course *)course;
- (Course *)getCourseByPK:(CoursePK *)coursePK;

- (BOOL)removeCourseByPK:(CoursePK *)coursePK;
- (BOOL)removeCourseByIndex:(int)index;
- (BOOL)removeCourse:(Course *)course;

- (Course *)courseAtIndex:(int)index;

- (BOOL)copyDataFrom:(CourseModel *)other;

- (CourseModel *)searchByTitle:(NSString *)searchText;

- (void)clear;

- (int)count;
@end
