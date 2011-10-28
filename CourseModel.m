//
//  CourseModel.m
//  CourseManagement
//
//  Created by raycad on 10/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CourseModel.h"


@implementation CourseModel

static CourseModel *_instance = nil;

+(CourseModel *)instance
{
	@synchronized([CourseModel class]) {
		if (!_instance)
			[[self alloc] init];
        
		return _instance;
	}
    
	return nil;
}

+(id)alloc
{
	@synchronized([CourseModel class]) {
		NSAssert(_instance == nil, @"Attempted to allocate a second instance of a singleton.");
		_instance = [super alloc];
		return _instance;
	}
    
	return nil;
}

-(id)init {
	self = [super init];
	if (self != nil) {
		// initialize stuff here
	}
    
	return self;
}

-(void)addCourse:(Course *)course
{
    [m_courses addObject:course];
}

-(Course *)getCourseByPK:(CoursePK *)coursePK
{
    for (int i = 0; i < [m_courses count]; i++) {
        Course *course = [m_courses objectAtIndex:i];
    }
}
@end
