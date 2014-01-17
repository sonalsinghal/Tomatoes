//
//  MovieCell.h
//  tomatoes
//
//  Created by Sonal Jain on 1/16/14.
//  Copyright (c) 2014 Sonal Singhal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *movieTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *movieSynopsisLabel;
@property (nonatomic, weak) IBOutlet UILabel *movieCastLabel;
@property (nonatomic, weak) IBOutlet UIImageView *posterImageView;

@end
