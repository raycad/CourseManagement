//
//  Course.h
//  CourseManagement
//
//  Created by raycad on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoursePK : NSObject {
@private
    int m_id;
}

@end

@interface Course : NSObject {
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *description;

@end
