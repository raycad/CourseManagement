//
//  StudentModel.h
//  StudentManagement
//
//  Created by raycad on 10/31/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

@interface StudentModel : NSObject {
    NSMutableArray *m_students;
}

- (BOOL)addStudent:(Student *)course;
- (Student *)getStudentByPK:(PersonPK *)studentPK;

- (BOOL)removeStudentByPK:(PersonPK *)studentPK;
- (BOOL)removeStudentByIndex:(int)index;

- (Student *)studentAtIndex:(int)index;

- (void)clear;

- (int)count;
@end
