//
//  StudentModel.m
//  StudentManagement
//
//  Created by raycad on 10/31/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import "StudentModel.h"

@implementation StudentModel

- (id)init
{
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

- (BOOL)removeStudent:(Student *)student
{
    for (int i = 0; i < [m_students count]; i++) {
        Student *studentTmp = [m_students objectAtIndex:i];
        if (studentTmp == student) {
            [m_students removeObjectAtIndex:i];
            return YES;
        }
    }
}

- (Student *)studentAtIndex:(int)index
{
    return [m_students objectAtIndex:index];
}

- (BOOL)copyDataFrom:(StudentModel *)other
{
    // Clear the current model
    [self clear];
    
    for (int i = 0; i < [other count]; i++) {
        [self addStudent:[other studentAtIndex:i]];
    }
    return YES;
}

- (StudentModel *)searchByIDNumber:(NSString *)searchText
{
    StudentModel *studentModel = [[StudentModel alloc] init];
    Student *student = nil;
    for (int i = 0; i < [self count]; i++) {
        student = [self studentAtIndex:i];
        NSComparisonResult result = [student.idNumber compare:searchText options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchText length])];
        if (result == NSOrderedSame) {
            [studentModel addStudent:student];
        }
    }
    
    if ([studentModel count] == 0)
        return nil;
    
    return [studentModel autorelease];
}

- (StudentModel *)searchByName:(NSString *)searchText
{
    StudentModel *studentModel = [[StudentModel alloc] init];
    Student *student = nil;
    for (int i = 0; i < [self count]; i++) {
        student = [self studentAtIndex:i];
        NSComparisonResult result = [student.fullName compare:searchText options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchText length])];
        if (result == NSOrderedSame) {
            [studentModel addStudent:student];
        }
    }
    
    if ([studentModel count] == 0)
        return nil;
    
    return [studentModel autorelease];
}

- (void)clear
{
    [m_students removeAllObjects];
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
