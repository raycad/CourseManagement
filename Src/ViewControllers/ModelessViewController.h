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

- (void)presentModallyOn:(UIViewController *)parent;
@end

@protocol ModelessViewControllerDelegate <NSObject>
@required
- (void)didSave:(NSObject *)controller;
- (void)didCancel:(NSObject *)controller;
@end
