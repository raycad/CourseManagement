//
//  Course.h
//  CourseManagement
//
//  Created by raycad on 10/18/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StudentModel.h"

@interface CoursePK : NSObject {
    NSString *m_courseTitle;    
}

@property NSString *courseTitle;

-(id)initWithCourseTitle:(NSString *)courseTitle;
@end

@interface Course : NSObject {
    CoursePK        *m_coursePK;
    StudentModel    *m_studentModel;
}

@property (nonatomic, retain) NSString      *title;
@property (nonatomic, retain) NSString      *category;
@property (nonatomic, retain) NSString      *description;
@property (nonatomic, retain) StudentModel  *studentModel;

-(id)initWithCoursePK:(CoursePK *)coursePK;
-(CoursePK *)coursePK;
@end
