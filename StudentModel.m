//
//  StudentModel.m
//  StudentManagement
//
//  Created by raycad on 10/31/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import "StudentModel.h"


@implementation StudentModel

static StudentModel *_instance = nil;

+ (StudentModel *)instance
{
	@synchronized([StudentModel class]) {
		if (!_instance)
			[[self alloc] init];
        
		return _instance;
	}
    
	return nil;
}

+ (id)alloc
{
	@synchronized([StudentModel class]) {
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
        m_students = [[NSMutableArray alloc] init];
	}
    
	return self;
}

- (BOOL)addStudent:(Student *)student
{
    if ([self getStudentByPK:[student personPK]])
        return NO; // The student is existing
    
    [m_students addObject:student];
    
    return YES;
}

- (Student *)getStudentByPK:(PersonPK *)personPK
{
    for (int i = 0; i < [m_students count]; i++) {
        Student *student = [m_students objectAtIndex:i];
        if ([personPK isEqual:[student personPK]])
            return student;
    }
    
    return nil;
}

- (BOOL)removeStudentByPK:(PersonPK *)personPK;
{
    for (int i = 0; i < [m_students count]; i++) {
        Student *student = [m_students objectAtIndex:i];
        if ([personPK isEqual:[student personPK]]) {
            [m_students removeObjectAtIndex:i];
            return YES;
        }
    }
    
    return NO;
}

- (BOOL)removeStudentByIndex:(int)index
{
    @try {
        [m_students removeObjectAtIndex:index];
    } @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        return NO;
    } @finally {
        NSLog(@"finally");
        return YES;
    }    
}

- (Student *)studentAtIndex:(int)index
{
    return [m_students objectAtIndex:index];
}

- (int)count
{
    return [m_students count];
}

- (void)dealloc
{
    [m_students release];
    [super dealloc];
}
@end
