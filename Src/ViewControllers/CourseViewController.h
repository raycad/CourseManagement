//
//  CourseViewController.h
//  CourseManagement
//
//  Created by raycad on 10/29/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"

@protocol CourseViewControllerDelegate;
@interface CourseViewController : UIViewController {
    id<CourseViewControllerDelegate> m_delegate;
    UITextField *m_titleTextField;
    UITextView *m_descriptionTextView;
    UIButton *m_thumbnailImageButton;
    UITextField *m_categoryTextField;   
    
    Course *m_course;
}

@property (nonatomic, retain) IBOutlet UITextField *titleTextField;

@property (nonatomic, retain) IBOutlet UITextField *categoryTextField;

@property (nonatomic, retain) IBOutlet UIButton *thumbnailImageButton;

@property (nonatomic, retain) IBOutlet UITextView *descriptionTextView;

@property (nonatomic, retain) Course *course;

@property (nonatomic, assign, readwrite) id<CourseViewControllerDelegate> delegate;

- (void)presentModallyOn:(UIViewController *)parent;

- (IBAction)selectImage:(id)sender;

@end

@protocol CourseViewControllerDelegate <NSObject>

@required

- (void)didSaveCourse:(CourseViewController *)controller;
- (void)didCancelCourse:(CourseViewController *)controller;

@end
