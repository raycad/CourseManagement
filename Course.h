//
//  Course.h
//  CourseManagement
//
//  Created by raycad on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoursePK : NSObject {
    NSString *m_courseCode;
}

-(id)initWithCode:(NSString *)courseCode;
-(NSString *)courseCode;

@end

@interface Course : NSObject {
    CoursePK *m_coursePK;
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *description;

-(id)initWithCoursePK:(CoursePK *)coursePK;
-(CoursePK *)coursePK;

@end
