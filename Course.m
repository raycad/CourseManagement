//
//  Course.m
//  CourseManagement
//
//  Created by raycad on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Course.h"


@implementation Course

@synthesize title = m_title;
@synthesize description = m_description;

- (id)init {
    if ((self = [super init])) {
        // Initialization code here
        m_title = @"iOS";
        m_description = @"iOS";
    }
    return self;    
}

- (void)dealloc {
    NSLog(@"Title = %@", m_title);
}

@end
