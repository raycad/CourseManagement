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

@property (nonatomic, strong) NSString *courseTitle;

-(id)initWithCourseTitle:(NSString *)courseTitle;
@end

@interface Course : NSObject {
    CoursePK        *m_coursePK;
    StudentModel    *m_studentModel;
}

@property (nonatomic, strong) NSString      *title;
@property (nonatomic, strong) NSString      *category;
@property (nonatomic, strong) NSString      *description;
@property (nonatomic, strong) StudentModel  *studentModel;

-(id)initWithCoursePK:(CoursePK *)coursePK;
-(CoursePK *)coursePK;
@end
