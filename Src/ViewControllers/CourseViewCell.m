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
        m_categoryLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:12];
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
    frame = CGRectMake(boundsX+10, 5, 40, 40);
    m_thumbnailImageView.frame = frame;
    
    frame = CGRectMake(boundsX+70, 5, 200, 25);
    m_titleLabel.frame = frame;
    
    frame = CGRectMake(boundsX+70, 32, 100, 15);
    m_categoryLabel.frame = frame;
}
@end
