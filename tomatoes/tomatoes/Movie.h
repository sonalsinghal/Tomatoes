//
//  Movie.h
//  tomatoes
//
//  Created by Sonal Jain on 1/16/14.
//  Copyright (c) 2014 Sonal Singhal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property(nonatomic, strong) NSMutableString *cast;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *synopsis;
@property(nonatomic, strong) NSString *imageLink;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
