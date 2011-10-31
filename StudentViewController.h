//
//  StudentViewController.h
//  CourseManagement
//
//  Created by raycad on 10/21/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentViewController.h"

@protocol StudentViewControllerDelegate;
@interface StudentViewController : UIViewController {
    id<StudentViewControllerDelegate> m_delegate;
}

@property (nonatomic, assign, readwrite) id<StudentViewControllerDelegate> delegate;

- (void)presentModallyOn:(UIViewController *)parent;

@end

@protocol StudentViewControllerDelegate <NSObject>

@required

- (void)didSaveStudent:(StudentViewController *)controller;
- (void)didCancelStudent:(StudentViewController *)controller;

@end