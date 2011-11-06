//
//  StudentViewController.h
//  CourseManagement
//
//  Created by raycad on 10/21/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentViewController.h"
#import "Student.h"
#import "SdtViewController.h"

@interface StudentViewController : SdtViewController {
    Student                             *m_student;
    UITextField                         *m_fullNameTextField;
    UITextField                         *m_dateOfBirthTextField;
    UITextField                         *m_idNumberTextField;
    UITextField                         *m_addressTextField;
    UITextField                         *m_phoneTextField;
}

@property (nonatomic, retain)Student               *student;
@property (nonatomic, retain)IBOutlet UITextField  *fullNameTextField;
@property (nonatomic, retain)IBOutlet UITextField  *dateOfBirthTextField;
@property (nonatomic, retain)IBOutlet UITextField  *idNumberTextField;
@property (nonatomic, retain)IBOutlet UITextField  *addressTextField;
@property (nonatomic, retain)IBOutlet UITextField  *phoneTextField;
@end