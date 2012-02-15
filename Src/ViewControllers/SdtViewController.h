//
//  SdtViewController.h
//  CourseManagement
//
//  Created by raycad on 11/7/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelessViewController.h"

typedef enum {
    CreateNewMode   = 0, // Save/Cancel buttons
    UpdateMode      = 1,
    SelectMode      = 2
} ViewMode; 

@interface SdtViewController : ModelessViewController {   
    ViewMode m_viewMode;
}

@property (nonatomic) ViewMode viewMode;

@end
