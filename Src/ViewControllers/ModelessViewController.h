//
//  ModelessViewController.h
//  CourseManagement
//
//  Created by raycad on 11/6/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ModelessViewControllerDelegate;
@interface ModelessViewController : UIViewController {
    id<ModelessViewControllerDelegate>   m_delegate;
}

@property (nonatomic, retain)id<ModelessViewControllerDelegate> delegate;

- (void)saveAction:(id)sender;
- (void)cancelAction:(id)sender;
- (void)selectAction:(id)sender;
- (void)updateAction:(id)sender;

- (void)presentModallyOn:(UIViewController *)parent;
@end

@protocol ModelessViewControllerDelegate <NSObject>
@required
- (void)didSave:(NSObject *)object;
- (void)didCancel:(NSObject *)object;
- (void)didSelect:(NSObject *)object;
- (void)didUpdate:(NSObject *)object;
@end
