//
//  CourseViewCell.m
//  CourseManagement
//
//  Created by raycad on 11/6/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import "CourseViewCell.h"

@implementation CourseViewCell

@synthesize titleLabel = m_titleLabel;
@synthesize categoryLabel = m_categoryLabel;
@synthesize thumbnailImageView = m_thumbnailImageView;
@synthesize course = m_course;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier 
{
    if ((self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier])) {
        // Initialization code
        m_titleLabel = [[UILabel alloc]init];
        m_titleLabel.textAlignment = UITextAlignmentLeft;
        m_titleLabel.font = [UIFont systemFontOfSize:15];
        m_categoryLabel = [[UILabel alloc]init];
        m_categoryLabel.textAlignment = UITextAlignmentLeft;
        //m_categoryLabel.font = [UIFont systemFontOfSize:10];
        m_categoryLabel.font = [UIFont fontWithMarkupDescription:@"font-family: Arial; font-size: 11px; font-weight: bold; font-style : italic;"];
        m_categoryLabel.textColor = [UIColor orangeColor];
        m_thumbnailImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:m_titleLabel];
        [self.contentView addSubview:m_categoryLabel];
        [self.contentView addSubview:m_thumbnailImageView];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect contentRect = self.contentView.bounds;
    CGFloat boundsX = contentRect.origin.x;
    CGRect frame;
    frame = CGRectMake(boundsX+10 ,0, 50, 50);
    m_thumbnailImageView.frame = frame;
    
    frame = CGRectMake(boundsX+70 ,5, 200, 25);
    m_titleLabel.frame = frame;
    
    frame = CGRectMake(boundsX+70 ,32, 100, 15);
    m_categoryLabel.frame = frame;
}

- (void)dealloc
{
    [m_titleLabel release];
    [m_categoryLabel release];
    [m_thumbnailImageView release];
    [m_course retain];
}
@end
