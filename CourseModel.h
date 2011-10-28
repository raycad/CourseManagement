//
//  CourseModel.h
//  CourseManagement
//
//  Created by raycad on 10/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Course.h"

@interface CourseModel : NSObject {
    NSMutableArray *m_courses;
}

+(CourseModel *)instance;

-(void)addCourse:(Course *)course;
-(Course *)getCourseByPK:(CoursePK *)coursePK;

@end
