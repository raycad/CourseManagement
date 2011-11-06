//
//  CourseViewCell.h
//  CourseManagement
//
//  Created by raycad on 11/6/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"

@interface CourseViewCell : UITableViewCell {
    UILabel     *m_titleLabel;
    UILabel     *m_categoryLabel;
    UIImageView *m_thumbnailImageView;
    
    Course      *m_course;
}
@property (nonatomic, retain) UILabel     *titleLabel;
@property (nonatomic, retain) UILabel     *categoryLabel;
@property (nonatomic, retain) UIImageView *thumbnailImageView;
@property (nonatomic, retain) Course      *course;
@end

