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

+ (CourseModel *)instance;

- (BOOL)addCourse:(Course *)course;
- (Course *)getCourseByPK:(CoursePK *)coursePK;

- (BOOL)removeCourseByPK:(CoursePK *)coursePK;
- (BOOL)removeCourseByIndex:(int)index;

- (Course *)courseAtIndex:(int)index;

- (int)count;
@end
