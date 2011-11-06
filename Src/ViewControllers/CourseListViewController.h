//
//  CourseListViewController.h
//  CourseManagement
//
//  Created by raycad on 10/23/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CourseModel.h"
#import "CMModel.h"
#import "SdtViewController.h"

@interface CourseListViewController : SdtViewController {
    CourseModel *m_courseModel;    
    UITableView *m_courseTableView;
    UISearchBar *m_searchBar;
    
    CMModel     *m_cmModel; // Singleton CourseManagement model
}
@property (nonatomic, retain) IBOutlet UITableView *courseTableView;
@property (nonatomic, retain) IBOutlet UISearchBar *searchBar;

- (void) refreshData;
@end
