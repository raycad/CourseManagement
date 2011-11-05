//
//  CMModel.h
//  CourseManagement
//
//  Created by raycad on 11/5/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CourseModel.h"
#import "StudentModel.h"

// The CourseManagement model contains data models of the application
@interface CMModel : NSObject {
    CourseModel     *m_courseModel;
    StudentModel    *m_studentModel;
}

// Declare the singleton
+ (CMModel *)instance;

@property (nonatomic, retain) CourseModel *courseModel;
@property (nonatomic, retain) StudentModel *studentModel;
@end
