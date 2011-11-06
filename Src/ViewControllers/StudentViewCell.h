//
//  StudentViewCell.h
//  CourseManagement
//
//  Created by raycad on 11/6/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

@interface StudentViewCell : UITableViewCell {
    UILabel     *m_fullNameLabel;
    UILabel     *m_idNumberLabel;
    UIImageView *m_avatarImageView;
    Student     *m_student;
}

@property (nonatomic, retain) UILabel     *fullNameLabel;
@property (nonatomic, retain) UILabel     *idNumberLabel;
@property (nonatomic, retain) UIImageView *avatarImageView;
@property (nonatomic, retain) Student     *student;
@end
