//
//  CMModel.m
//  CourseManagement
//
//  Created by raycad on 11/5/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import "CMModel.h"


@implementation CMModel

@synthesize courseModel     = m_courseModel;
@synthesize studentModel    = m_studentModel;

static CMModel *_instance = nil;

+ (CMModel *)instance
{
	@synchronized([CMModel class]) {
		if (!_instance)
			[[self alloc] init];
        
		return _instance;
	}
    
	return nil;
}

+ (id)alloc
{
	@synchronized([CMModel class]) {
		NSAssert(_instance == nil, @"Attempted to allocate a second instance of a singleton.");
		_instance = [super alloc];
		return _instance;
	}
    
	return nil;
}

- (id)init {
	self = [super init];
	if (self != nil) {
		// Initialize parameters
	}
    
	return self;
}

- (void)dealloc
{
    [m_courseModel release];
    [m_studentModel release];
    [super dealloc];
}
@end
