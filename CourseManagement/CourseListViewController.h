//
//  CourseListViewController.h
//  CourseManagement
//
//  Created by raycad on 10/23/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CourseModel.h"

@interface CourseViewCell : UITableViewCell {
    UILabel *m_titleLabel;
    UILabel *m_categoryLabel;
    UIImageView *m_thumbnailImageView;
}
@property(nonatomic,retain)UILabel *titleLabel;
@property(nonatomic,retain)UILabel *categoryLabel;
@property(nonatomic,retain)UIImageView *thumbnailImageView;
@end

@interface CourseListViewController : UITableViewController {
    CourseModel *m_courseModel;    
}

@end
