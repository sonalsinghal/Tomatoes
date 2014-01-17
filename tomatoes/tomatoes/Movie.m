//
//  Movie.m
//  tomatoes
//
//  Created by Sonal Jain on 1/16/14.
//  Copyright (c) 2014 Sonal Singhal. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (id)initWithDictionary:(NSDictionary *)dictionary{
    
    self.title = [dictionary objectForKey:@"title"];
    self.synopsis = [dictionary objectForKey:@"synopsis"];
    self.cast = [[NSMutableString alloc] init];
    
    NSArray *abridged_cast = [dictionary objectForKey:@"abridged_cast"];
    for(int i = 0; i < [abridged_cast count]; i++){
        NSString *name = [abridged_cast[i] objectForKey:@"name"];
        if(i){
            [self.cast appendString:@","];
        }
        [self.cast appendString:name];
    }
    
    NSDictionary *posters = [dictionary objectForKey:@"posters"];
    self.imageLink = [posters objectForKey:@"thumbnail"];
    
    return self;
   
}

@end
