//
//  CourseViewController.h
//  CourseManagement
//
//  Created by raycad on 10/29/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CourseViewControllerDelegate;
@interface CourseViewController : UIViewController {
    id<CourseViewControllerDelegate>   m_delegate;
}

@property (nonatomic, assign, readwrite) id<CourseViewControllerDelegate> delegate;

- (void)presentModallyOn:(UIViewController *)parent;

@end

@protocol CourseViewControllerDelegate <NSObject>

@required

- (void)didSaveCourse:(CourseViewController *)controller;
- (void)didCancelCourse:(CourseViewController *)controller;

@end
