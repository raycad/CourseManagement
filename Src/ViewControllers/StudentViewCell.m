//
//  StudentViewCell.m
//  CourseManagement
//
//  Created by raycad on 11/6/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import "StudentViewCell.h"

@implementation StudentViewCell

@synthesize fullNameLabel = m_fullNameLabel;
@synthesize idNumberLabel = m_idNumberLabel;
@synthesize avatarImageView = m_avatarImageView;
@synthesize student = m_student;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier 
{
    if ((self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier])) {
        // Initialization code
        m_fullNameLabel = [[UILabel alloc]init];
        m_fullNameLabel.textAlignment = UITextAlignmentLeft;
        m_fullNameLabel.font = [UIFont systemFontOfSize:15];
        m_idNumberLabel = [[UILabel alloc]init];
        m_idNumberLabel.textAlignment = UITextAlignmentLeft;
        //m_categoryLabel.font = [UIFont systemFontOfSize:10];
        m_idNumberLabel.font = [UIFont fontWithMarkupDescription:@"font-family: Arial; font-size: 11px; font-weight: bold; font-style : italic;"];
        m_idNumberLabel.textColor = [UIColor orangeColor];
        m_avatarImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:m_fullNameLabel];
        [self.contentView addSubview:m_idNumberLabel];
        [self.contentView addSubview:m_avatarImageView];        
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect contentRect = self.contentView.bounds;
    CGFloat boundsX = contentRect.origin.x;
    CGRect frame;
    frame = CGRectMake(boundsX+10 ,0, 50, 50);
    m_avatarImageView.frame = frame;
    
    frame = CGRectMake(boundsX+70 ,5, 200, 25);
    m_fullNameLabel.frame = frame;
    
    frame = CGRectMake(boundsX+70 ,32, 100, 15);
    m_idNumberLabel.frame = frame;
}

- (void)dealloc
{
    [m_fullNameLabel release];
    [m_idNumberLabel release];
    [m_avatarImageView release];
    [m_student release];
}
@end